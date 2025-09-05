import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_error_view.dart';
import 'package:valorant_intel/core/widgets/custom_shimmer_grid_view.dart';
import 'package:valorant_intel/core/widgets/custom_sliver_refresh_wrapper.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_card.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.maps),
      ),
      body: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state is MapErrorState && state.cachedMapList != null) {
            context.showSimpleSnackBar(
              context.localizations.cachedContent(
                context.translateError(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            MapLoadingState() => const CustomShimmerGridView(
              width: 300,
              height: 100,
              radius: 12,
            ),
            MapSuccessState(:final mapList) => MapSuccessView(
              mapList: mapList,
            ),
            MapErrorState(
              :final message,
              :final cachedMapList,
            ) =>
              cachedMapList == null
                  ? CustomErrorView(
                      message: message,
                      onTryAgain: () =>
                          context.read<MapBloc>().add(GetAllMapsEvent()),
                    )
                  : MapSuccessView(mapList: cachedMapList),
          };
        },
      ),
    );
  }
}

class MapSuccessView extends StatelessWidget {
  final List<GameMap> mapList;
  const MapSuccessView({super.key, required this.mapList});

  @override
  Widget build(BuildContext context) {
    return CustomSliverRefreshWrapper(
      onRefresh: () => context.read<MapBloc>().add(GetAllMapsEvent()),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width > 35 ? context.width / 35 : 10,
            vertical: 30,
          ),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width > 300 ? context.width ~/ 300 : 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) {
              return MapCard(map: mapList[index]);
            },
            itemCount: mapList.length,
          ),
        ),
      ],
    );
  }
}
