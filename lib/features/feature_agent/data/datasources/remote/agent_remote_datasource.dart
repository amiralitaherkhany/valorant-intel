import 'package:dio/dio.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent_model/agent_model.dart';

class AgentRemoteDatasource implements AgentDatasource {
  final Dio _dio;
  final NetworkUtils _networkUtils;

  AgentRemoteDatasource({required Dio dio, required NetworkUtils networkUtils})
      : _dio = dio,
        _networkUtils = networkUtils;

  @override
  Future<List<AgentModel>> getAllAgents() async {
    Map<String, dynamic> queryParameters = {
      'language': await _networkUtils.getLanguageCode(),
      'isPlayableCharacter': true
    };
    try {
      Response response =
          await _dio.get('/agents', queryParameters: queryParameters);

      return (response.data['data'] as List<dynamic>)
          .map<AgentModel>((element) => AgentModel.fromMap(element))
          .toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw ApiException(
          e.response?.data['error'] ?? 'networkFailure',
          e.response?.data['status'] ?? e.response?.statusCode,
        );
      } else {
        throw ApiException(
          e.response?.data['error'] ?? 'serverError',
          e.response?.data['status'] ?? e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ApiException('unknownError', null);
    }
  }
}
