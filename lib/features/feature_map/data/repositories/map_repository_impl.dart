import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/map_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapDatasource _mapDatasource;

  MapRepositoryImpl({required MapDatasource mapDatasource})
      : _mapDatasource = mapDatasource;

  @override
  Future<Either<String, List<GameMap>>> getAllMaps() async {
    try {
      return await _mapDatasource.getAllMaps().then(
            (mapList) => right(mapList),
          );
    } on ApiException catch (exception) {
      return left(exception.message);
    }
  }
}
