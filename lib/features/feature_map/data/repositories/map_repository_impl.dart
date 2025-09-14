import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/local/map_local_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/remote/map_remote_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapRemoteDatasource _mapRemoteDatasource;
  final MapLocalDatasource _mapLocalDatasource;

  MapRepositoryImpl({
    required MapRemoteDatasource mapRemoteDatasource,
    required MapLocalDatasource mapLocalDatasource,
  }) : _mapRemoteDatasource = mapRemoteDatasource,
       _mapLocalDatasource = mapLocalDatasource;

  @override
  Future<Either<(String, List<GameMap>?), List<GameMap>>> getAllMaps() async {
    try {
      final mapList = await _mapRemoteDatasource.getAllMaps();
      final filteredMaps = mapList
          .where(
            (element) => ![
              "5914d1e0-40c4-cfdd-6b88-eba06347686c",
              "1f10dab3-4294-3827-fa35-c2aa00213cf3",
            ].contains(element.uuid),
          )
          .toList();
      await _mapLocalDatasource.saveAllMaps(filteredMaps);
      return right(filteredMaps);
    } on ApiException catch (exception) {
      final mapList = await _mapLocalDatasource.getAllMaps();
      if (mapList.isNotEmpty) {
        return Left((exception.message, mapList));
      } else {
        return Left((exception.message, null));
      }
    }
  }
}
