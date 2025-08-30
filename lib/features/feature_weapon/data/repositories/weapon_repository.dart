import 'package:dartz/dartz.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

abstract interface class WeaponRepository {
  Future<Either<(String, List<Weapon>?), List<Weapon>>> getAllWeapons();
}
