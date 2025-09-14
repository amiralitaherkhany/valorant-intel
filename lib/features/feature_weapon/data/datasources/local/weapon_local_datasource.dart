import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

abstract interface class WeaponLocalDatasource {
  Future<List<Weapon>> getAllWeapons();
  Future<void> saveAllWeapons(List<Weapon> weapons);
}
