import 'package:valorant_intel/features/feature_agent/data/models/agent_model/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent_model/role.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';

AgentEntity createFakeAgentEntity() {
  return AgentEntity(
    uuid: '',
    displayName: 'displayName',
    description: 'description',
    developerName: 'developerName',
    characterTags: 'characterTags',
    displayIcon: 'displayIcon',
    displayIconSmall: 'displayIconSmall',
    bustPortrait: 'bustPortrait',
    fullPortrait: 'fullPortrait',
    fullPortraitV2: 'fullPortraitV2',
    killfeedPortrait: 'killfeedPortrait',
    background: 'background',
    backgroundGradientColors: const ['', '', '', ''],
    assetPath: 'assetPath',
    isFullPortraitRightFacing: true,
    isPlayableCharacter: true,
    isAvailableForTest: true,
    isBaseContent: true,
    role: Role(
      assetPath: '',
      description: '',
      displayIcon: '',
      displayName: '',
      uuid: '',
    ),
    recruitmentData: 'recruitmentData',
    abilities: [
      Ability(),
      Ability(),
      Ability(),
      Ability(),
    ],
    voiceLine: 'voiceLine',
  );
}
