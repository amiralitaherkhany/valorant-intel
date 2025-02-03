import 'package:equatable/equatable.dart';

import 'ability.dart';
import 'role.dart';

class Agent extends Equatable {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final dynamic characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<dynamic> backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final Role role;
  final dynamic recruitmentData;
  final List<Ability> abilities;
  final dynamic voiceLine;

  const Agent({
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

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
        uuid: json['uuid'] as String,
        displayName: json['displayName'] as String,
        description: json['description'] as String,
        developerName: json['developerName'] as String,
        characterTags: json['characterTags'] as dynamic,
        displayIcon: json['displayIcon'] as String,
        displayIconSmall: json['displayIconSmall'] as String,
        bustPortrait: json['bustPortrait'] as String,
        fullPortrait: json['fullPortrait'] as String,
        fullPortraitV2: json['fullPortraitV2'] as String,
        killfeedPortrait: json['killfeedPortrait'] as String,
        background: json['background'] as String,
        backgroundGradientColors:
            json['backgroundGradientColors'] as List<dynamic>,
        assetPath: json['assetPath'] as String,
        isFullPortraitRightFacing: json['isFullPortraitRightFacing'] as bool,
        isPlayableCharacter: json['isPlayableCharacter'] as bool,
        isAvailableForTest: json['isAvailableForTest'] as bool,
        isBaseContent: json['isBaseContent'] as bool,
        role: Role.fromJson(json['role'] as Map<String, dynamic>),
        recruitmentData: json['recruitmentData'] as dynamic,
        abilities: (json['abilities'] as List<dynamic>)
            .map((e) => Ability.fromJson(e as Map<String, dynamic>))
            .toList(),
        voiceLine: json['voiceLine'] as dynamic,
      );

  @override
  List<Object?> get props => [];
}
