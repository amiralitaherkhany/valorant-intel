import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

abstract interface class MapLocalDatasource {
  Future<List<GameMap>> getAllMaps();
  Future<void> saveAllMaps(List<GameMap> maps);
}
