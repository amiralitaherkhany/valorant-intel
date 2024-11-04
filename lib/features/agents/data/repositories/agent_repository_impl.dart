import 'package:dio/dio.dart';
import 'package:valorant_intel/core/common/data_state.dart';
import 'package:valorant_intel/features/agents/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/agents/data/models/agent_model/agent_model.dart';
import 'package:valorant_intel/features/agents/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/agents/domain/repositories/agent_repository.dart';

class AgentRepositoryImpl implements AgentRepository {
  final AgentRemoteDatasource _agentRemoteDatasource;

  AgentRepositoryImpl({required AgentRemoteDatasource agentRemoteDatasource})
      : _agentRemoteDatasource = agentRemoteDatasource;
  @override
  Future<DataState<List<AgentEntity>>> getAllAgents() async {
    try {
      Response response = await _agentRemoteDatasource.getAllAgents();
      if (response.statusCode == 200 && response.data['status'] == 200) {
        return DataSuccess<List<AgentEntity>>(
          (response.data['data'] as List<dynamic>)
              .map<AgentEntity>(
                (element) => AgentModel.fromJson(element).toEntity(),
              )
              .toList(),
        );
      } else {
        return DataFailed(
            'something went wrong with status code ${response.statusCode}');
      }
    } on DioException {
      return DataFailed('something went wrong');
    } catch (e) {
      return DataFailed('check your internet connection !');
    }
  }
}
