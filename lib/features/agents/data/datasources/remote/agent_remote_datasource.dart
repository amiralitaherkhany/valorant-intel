import 'package:dio/dio.dart';

class AgentRemoteDatasource {
  final Dio _dio;

  AgentRemoteDatasource({required Dio dio}) : _dio = dio;

  Future<Response> getAllAgents() async {
    Map<String, dynamic> queryParameters = {
      'language': 'en-US',
      'isPlayableCharacter': true
    };
    Response response = await _dio.get(
      '/agents',
      queryParameters: queryParameters,
    );

    return response;
  }
}
