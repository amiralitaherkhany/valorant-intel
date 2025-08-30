import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/remote/weapon_remote_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';
import 'package:valorant_intel/features/feature_weapon/data/repositories/weapon_repository.dart';

class WeaponRepositoryImpl implements WeaponRepository {
  final WeaponRemoteDatasource _weaponRemoteDatasource;

  WeaponRepositoryImpl({required WeaponRemoteDatasource weaponRemoteDatasource})
    : _weaponRemoteDatasource = weaponRemoteDatasource;

  @override
  Future<Either<(String, List<Weapon>?), List<Weapon>>> getAllWeapons() async {
    try {
      final weaponList = await _weaponRemoteDatasource.getAllWeapons();
      return Right(weaponList);
    } on ApiException catch (exception) {
      return Left((exception.message, null));
    }
  }
}
