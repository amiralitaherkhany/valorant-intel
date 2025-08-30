import 'package:dio/dio.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/weapon_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponRemoteDatasource implements WeaponDatasource {
  final DioClient _dioClient;
  WeaponRemoteDatasource({required DioClient dioClient})
    : _dioClient = dioClient;
  @override
  Future<List<Weapon>> getAllWeapons() async {
    try {
      return await _dioClient.dio
          .get('/weapons')
          .then(
            (response) => (response.data['data'] as List<dynamic>)
                .map<Weapon>((element) => Weapon.fromMap(element))
                .toList(),
          );
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
