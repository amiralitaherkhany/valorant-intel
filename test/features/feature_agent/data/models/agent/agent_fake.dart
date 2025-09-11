import 'package:valorant_intel/features/feature_agent/data/models/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/models/role.dart';

Agent createFakeAgent() {
  return Agent(
    uuid: '',
    displayName: 'displayName',
    description: 'description',
    displayIcon: 'displayIcon',
    fullPortrait: 'fullPortrait',
    background: 'background',
    backgroundGradientColors: const ['', '', '', ''],
    isPlayableCharacter: true,
    role: Role(
      description: '',
      displayIcon: '',
      displayName: '',
      uuid: '',
    ),
    abilities: [
      Ability(
        description: '',
        displayIcon: '',
        displayName: '',
      ),
      Ability(
        description: '',
        displayIcon: '',
        displayName: '',
      ),
      Ability(
        description: '',
        displayIcon: '',
        displayName: '',
      ),
      Ability(
        description: '',
        displayIcon: '',
        displayName: '',
      ),
    ],
  );
}
