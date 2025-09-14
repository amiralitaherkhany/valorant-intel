import 'package:sembast/sembast.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/local/agent_local_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

class AgentLocalDatasourceImpl implements AgentLocalDatasource {
  final Database _database;
  final StoreRef _store = intMapStoreFactory.store("agent_store");
  AgentLocalDatasourceImpl({required Database database}) : _database = database;
  @override
  Future<List<Agent>> getAllAgents() async {
    final snapshots = await _store.find(_database);

    return snapshots
        .map(
          (snapshot) => Agent.fromMap(snapshot.value as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> saveAllAgents(List<Agent> agents) async {
    await _store.delete(_database);
    await _store.addAll(
      _database,
      agents.map((agent) => agent.toMap()).toList(),
    );
  }
}
