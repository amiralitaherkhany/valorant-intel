import 'package:dio/dio.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

class AgentRemoteDatasourceImpl implements AgentRemoteDatasource {
  final DioClient _dioClient;

  AgentRemoteDatasourceImpl({required DioClient dioClient})
    : _dioClient = dioClient;

  @override
  Future<List<Agent>> getAllAgents() async {
    Map<String, dynamic> queryParameters = {'isPlayableCharacter': true};
    try {
      final response = await _dioClient.dio.get(
        '/agents',
        queryParameters: queryParameters,
      );
      final agentList = (response.data['data'] as List<dynamic>)
          .map<Agent>((element) => Agent.fromMap(element))
          .toList();

      return agentList;
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
