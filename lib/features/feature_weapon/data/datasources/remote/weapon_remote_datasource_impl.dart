import 'package:dio/dio.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/remote/weapon_remote_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponRemoteDatasourceImpl implements WeaponRemoteDatasource {
  final DioClient _dioClient;

  WeaponRemoteDatasourceImpl({required DioClient dioClient})
    : _dioClient = dioClient;

  @override
  Future<List<Weapon>> getAllWeapons() async {
    try {
      final response = await _dioClient.dio.get('/weapons');
      final weaponList = (response.data['data'] as List<dynamic>)
          .map<Weapon>((element) => Weapon.fromMap(element))
          .toList();

      return weaponList;
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.connectionError) {
        throw ApiException(
          'networkFailure',
          exception.response?.statusCode,
        );
      } else {
        throw ApiException(
          exception.response?.data['error'] ?? 'serverError',
          exception.response?.data['status'] ?? exception.response?.statusCode,
        );
      }
    } catch (exception) {
      throw ApiException('unknownError', null);
    }
  }
}
