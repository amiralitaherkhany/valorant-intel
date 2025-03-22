import 'package:equatable/equatable.dart';

import 'ability.dart';
import 'role.dart';

class Agent extends Equatable {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<dynamic> backgroundGradientColors;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final Role role;
  final dynamic recruitmentData;
  final List<Ability> abilities;

  const Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.recruitmentData,
    required this.abilities,
  });

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
        uuid: json['uuid'] ?? "",
        displayName: json['displayName'] ?? "",
        description: json['description'] ?? "",
        developerName: json['developerName'] ?? "",
        displayIcon: json['displayIcon'] ?? "",
        displayIconSmall: json['displayIconSmall'] ?? "",
        bustPortrait: json['bustPortrait'] ?? "",
        fullPortrait: json['fullPortrait'] ?? "",
        fullPortraitV2: json['fullPortraitV2'] ?? "",
        killfeedPortrait: json['killfeedPortrait'] ?? "",
        background: json['background'] ?? "",
        backgroundGradientColors:
            json['backgroundGradientColors'] as List<dynamic>,
        isFullPortraitRightFacing: json['isFullPortraitRightFacing'] as bool,
        isPlayableCharacter: json['isPlayableCharacter'] as bool,
        isAvailableForTest: json['isAvailableForTest'] as bool,
        isBaseContent: json['isBaseContent'] as bool,
        role: Role.fromMap(json['role'] as Map<String, dynamic>),
        recruitmentData: json['recruitmentData'] as dynamic,
        abilities: (json['abilities'] as List<dynamic>)
            .map((e) => Ability.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [uuid];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uuid': uuid});
    result.addAll({'displayName': displayName});
    result.addAll({'description': description});
    result.addAll({'developerName': developerName});
    result.addAll({'displayIcon': displayIcon});
    result.addAll({'displayIconSmall': displayIconSmall});
    result.addAll({'bustPortrait': bustPortrait});
    result.addAll({'fullPortrait': fullPortrait});
    result.addAll({'fullPortraitV2': fullPortraitV2});
    result.addAll({'killfeedPortrait': killfeedPortrait});
    result.addAll({'background': background});
    result.addAll({'backgroundGradientColors': backgroundGradientColors});
    result.addAll({'isFullPortraitRightFacing': isFullPortraitRightFacing});
    result.addAll({'isPlayableCharacter': isPlayableCharacter});
    result.addAll({'isAvailableForTest': isAvailableForTest});
    result.addAll({'isBaseContent': isBaseContent});
    result.addAll({'role': role.toMap()});
    result.addAll({'recruitmentData': recruitmentData});
    result.addAll({'abilities': abilities.map((x) => x.toMap()).toList()});

    return result;
  }
}
