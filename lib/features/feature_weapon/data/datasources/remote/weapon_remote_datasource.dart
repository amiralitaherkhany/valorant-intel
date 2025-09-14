import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

abstract interface class WeaponRemoteDatasource {
  Future<List<Weapon>> getAllWeapons();
}
