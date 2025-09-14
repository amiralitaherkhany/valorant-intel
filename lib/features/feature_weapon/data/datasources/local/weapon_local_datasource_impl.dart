import 'package:sembast/sembast.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/local/weapon_local_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponLocalDatasourceImpl implements WeaponLocalDatasource {
  final Database _database;
  final StoreRef _store = intMapStoreFactory.store("weapon_store");

  WeaponLocalDatasourceImpl({required Database database})
    : _database = database;

  @override
  Future<List<Weapon>> getAllWeapons() async {
    final snapshots = await _store.find(_database);

    return snapshots
        .map(
          (snapshot) => Weapon.fromMap(snapshot.value as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> saveAllWeapons(List<Weapon> weapons) async {
    await _store.delete(_database);
    await _store.addAll(
      _database,
      weapons.map((weapon) => weapon.toMap()).toList(),
    );
  }
}
