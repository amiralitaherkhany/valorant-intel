part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

final class MapLoadingState extends MapState {}

final class MapSuccessState extends MapState {
  final List<GameMap> mapList;
  const MapSuccessState({required this.mapList});

  @override
  List<Object?> get props => [mapList];
}

final class MapErrorState extends MapState {
  final String message;
  final List<GameMap>? cachedMapList;
  const MapErrorState({required this.message, required this.cachedMapList});

  @override
  List<Object?> get props => [message, cachedMapList];
}
