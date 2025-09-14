import 'package:sembast/sembast_io.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/local/map_local_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

class MapLocalDatasourceImpl implements MapLocalDatasource {
  final Database _database;
  final StoreRef _store = intMapStoreFactory.store("map_store");

  MapLocalDatasourceImpl({required Database database}) : _database = database;

  @override
  Future<List<GameMap>> getAllMaps() async {
    final snapshots = await _store.find(_database);

    return snapshots
        .map(
          (snapshot) => GameMap.fromMap(snapshot.value as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> saveAllMaps(List<GameMap> maps) async {
    await _store.delete(_database);
    await _store.addAll(_database, maps.map((map) => map.toMap()).toList());
  }
}
