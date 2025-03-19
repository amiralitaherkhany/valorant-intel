import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_error_view.dart';
import 'package:valorant_intel/core/widgets/custom_sliver_refresh_control.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/maps_card.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.maps),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return switch (state) {
            MapLoadingState() => const MapLoadingView(),
            MapSuccessState(mapList: final mapList) =>
              MapSuccessView(mapList: mapList),
            MapErrorState(message: final message) => CustomErrorView(
                message: message,
                onTryAgain: () =>
                    context.read<MapBloc>().add(GetAllMapsEvent()),
              )
          };
        },
      ),
    );
  }
}

class MapLoadingView extends StatelessWidget {
  const MapLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class MapSuccessView extends StatefulWidget {
  final List<GameMap> mapList;
  const MapSuccessView({super.key, required this.mapList});

  @override
  State<MapSuccessView> createState() => _MapSuccessViewState();
}

class _MapSuccessViewState extends State<MapSuccessView> {
  final _controller = ScrollController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverRefreshControl(
          onRefresh: () => context.read<MapBloc>().add(GetAllMapsEvent()),
          controller: _controller,
        ),
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
              return MapsCard(map: widget.mapList[index]);
            },
            itemCount: widget.mapList.length,
          ),
        ),
      ],
    );
  }
}
