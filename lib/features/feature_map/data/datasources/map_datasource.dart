import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

abstract interface class MapDatasource {
  Future<List<GameMap>> getAllMaps();
}
