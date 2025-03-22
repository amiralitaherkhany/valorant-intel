import 'package:valorant_intel/features/feature_agent/data/models/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/models/role.dart';

Agent createFakeAgent() {
  return Agent(
    uuid: '',
    displayName: 'displayName',
    description: 'description',
    developerName: 'developerName',
    displayIcon: 'displayIcon',
    displayIconSmall: 'displayIconSmall',
    bustPortrait: 'bustPortrait',
    fullPortrait: 'fullPortrait',
    fullPortraitV2: 'fullPortraitV2',
    killfeedPortrait: 'killfeedPortrait',
    background: 'background',
    backgroundGradientColors: const ['', '', '', ''],
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
      Ability(description: '', displayIcon: '', displayName: '', slot: ''),
      Ability(description: '', displayIcon: '', displayName: '', slot: ''),
      Ability(description: '', displayIcon: '', displayName: '', slot: ''),
      Ability(description: '', displayIcon: '', displayName: '', slot: ''),
    ],
  );
}
