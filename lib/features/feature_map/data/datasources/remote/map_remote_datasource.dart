import 'package:dio/dio.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/map_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

class MapRemoteDatasource implements MapDatasource {
  final DioClient _dioClient;

  MapRemoteDatasource({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<GameMap>> getAllMaps() async {
    try {
      return await _dioClient.dio.get('/maps').then(
            (response) => (response.data['data'] as List<dynamic>)
                .map<GameMap>((element) => GameMap.fromMap(element))
                .toList(),
          );
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.connectionError) {
        throw ApiException(
          exception.response?.data['error'] ?? 'networkFailure',
          exception.response?.data['status'] ?? exception.response?.statusCode,
        );
      } else {
        throw ApiException(
          exception.response?.data['error'] ?? 'serverError',
          exception.response?.data['status'] ?? exception.response?.statusCode,
        );
      }
    } catch (exception) {
      throw ApiException(exception.toString(), null);
    }
  }
}
