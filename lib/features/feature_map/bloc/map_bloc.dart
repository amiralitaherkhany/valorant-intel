import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;
  MapBloc({required MapRepository mapRepository})
    : _mapRepository = mapRepository,
      super(MapLoadingState()) {
    on<GetAllMapsEvent>(
      (event, emit) async {
        emit(MapLoadingState());
        await _mapRepository.getAllMaps().then(
          (response) => response.fold(
            (errorDetails) => emit(
              MapErrorState(
                message: errorDetails.$1,
                cachedMapList: errorDetails.$2,
              ),
            ),
            (mapList) => emit(MapSuccessState(mapList: mapList)),
          ),
        );
      },
    );
  }
}
