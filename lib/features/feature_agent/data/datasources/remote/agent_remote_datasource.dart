import 'package:dio/dio.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent_model/agent_model.dart';

class AgentRemoteDatasource implements AgentDatasource {
  final Dio _dio;

  AgentRemoteDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<List<AgentModel>> getAllAgents() async {
    Map<String, dynamic> queryParameters = {
      'language': 'en-US',
      'isPlayableCharacter': true
    };
    try {
      Response response =
          await _dio.get('/agents', queryParameters: queryParameters);

      return (response.data['data'] as List<dynamic>)
          .map<AgentModel>((element) => AgentModel.fromMap(element))
          .toList();
    } on DioException catch (e) {
      throw ApiException(
        e.response?.data['error'] ?? 'unknown error',
        e.response?.data['status'] ?? e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('something went wrong', null);
    }
  }
}
