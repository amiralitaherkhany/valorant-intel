import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/maps_card.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.maps),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return switch (state) {
            MapLoadingState() => const MapLoadingView(),
            MapSuccessState(mapList: final mapList) =>
              MapSuccessView(mapList: mapList),
            MapErrorState(message: final message) =>
              MapErrorView(message: message)
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

class MapSuccessView extends StatelessWidget {
  final List<GameMap> mapList;
  const MapSuccessView({super.key, required this.mapList});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemBuilder: (context, index) {
            return MapsCard(map: mapList[index]);
          },
          itemCount: mapList.length,
        ),
      ],
    );
  }
}

class MapErrorView extends StatelessWidget {
  final String message;
  const MapErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.translateError(message),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => context.read<MapBloc>().add(GetAllMapsEvent()),
            child: Text(
              context.localizations.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
