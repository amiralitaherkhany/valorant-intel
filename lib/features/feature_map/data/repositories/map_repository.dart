import 'package:dartz/dartz.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

abstract interface class MapRepository {
  Future<Either<(String, List<GameMap>?), List<GameMap>>> getAllMaps();
}
