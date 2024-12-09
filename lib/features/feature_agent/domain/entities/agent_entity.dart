import 'package:equatable/equatable.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent_model/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent_model/role.dart';

class AgentEntity extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final dynamic characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<dynamic>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final dynamic recruitmentData;
  final List<Ability>? abilities;
  final dynamic voiceLine;

  const AgentEntity({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.recruitmentData,
    required this.abilities,
    required this.voiceLine,
  });

  @override
  List<Object> get props {
    return [
      uuid!,
    ];
  }
}
