import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/local/weapon_local_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/remote/weapon_remote_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';
import 'package:valorant_intel/features/feature_weapon/data/repositories/weapon_repository.dart';

class WeaponRepositoryImpl implements WeaponRepository {
  final WeaponRemoteDatasource _weaponRemoteDatasource;
  final WeaponLocalDatasource _weaponLocalDatasource;

  WeaponRepositoryImpl({
    required WeaponRemoteDatasource weaponRemoteDatasource,
    required WeaponLocalDatasource weaponLocalDatasource,
  }) : _weaponRemoteDatasource = weaponRemoteDatasource,
       _weaponLocalDatasource = weaponLocalDatasource;

  @override
  Future<Either<(String, List<Weapon>?), List<Weapon>>> getAllWeapons() async {
    try {
      final weaponList = await _weaponRemoteDatasource.getAllWeapons();
      await _weaponLocalDatasource.saveWeapons(weaponList);
      return Right(weaponList);
    } on ApiException catch (exception) {
      final weaponList = await _weaponLocalDatasource.getAllWeapons();
      if (weaponList.isNotEmpty) {
        return Left((exception.message, weaponList));
      } else {
        return Left((exception.message, null));
      }
    }
  }
}
