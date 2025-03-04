import 'package:dio/dio.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';

class AgentRemoteDatasource implements AgentDatasource {
  final DioClient _dioClient;

  AgentRemoteDatasource({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<List<Agent>> getAllAgents() async {
    Map<String, dynamic> queryParameters = {'isPlayableCharacter': true};
    try {
      return await _dioClient.dio
          .get('/agents', queryParameters: queryParameters)
          .then(
            (response) => (response.data['data'] as List<dynamic>)
                .map<Agent>((element) => Agent.fromMap(element))
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
