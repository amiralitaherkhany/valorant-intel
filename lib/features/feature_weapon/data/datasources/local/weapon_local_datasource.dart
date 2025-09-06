import 'package:sembast/sembast.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/weapon_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponLocalDatasource implements WeaponDatasource {
  final Database _database;
  final StoreRef _store = intMapStoreFactory.store("weapon_store");
  WeaponLocalDatasource({required Database database}) : _database = database;
  @override
  Future<List<Weapon>> getAllWeapons() async {
    final snapshots = await _store.find(_database);

    return snapshots
        .map(
          (snapshot) => Weapon.fromMap(snapshot.value as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> saveWeapons(List<Weapon> weapons) async {
    await _store.delete(_database);
    await _store.addAll(
      _database,
      weapons.map((weapon) => weapon.toMap()).toList(),
    );
  }
}
