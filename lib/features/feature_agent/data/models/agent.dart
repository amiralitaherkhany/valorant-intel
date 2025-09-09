import 'package:equatable/equatable.dart';

import 'ability.dart';
import 'role.dart';

class Agent extends Equatable {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String fullPortrait;
  final String background;
  final List<dynamic> backgroundGradientColors;
  final bool isPlayableCharacter;
  final Role role;
  final List<Ability> abilities;

  const Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.isPlayableCharacter,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
    uuid: json['uuid'] ?? "",
    displayName: json['displayName'] ?? "",
    description: json['description'] ?? "",
    displayIcon: json['displayIcon'] ?? "",
    fullPortrait: json['fullPortrait'] ?? "",
    background: json['background'] ?? "",
    backgroundGradientColors: json['backgroundGradientColors'] as List<dynamic>,
    isPlayableCharacter: json['isPlayableCharacter'] as bool,
    role: Role.fromMap(json['role'] as Map<String, dynamic>),
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
    result.addAll({'displayIcon': displayIcon});
    result.addAll({'fullPortrait': fullPortrait});
    result.addAll({'background': background});
    result.addAll({'backgroundGradientColors': backgroundGradientColors});
    result.addAll({'isPlayableCharacter': isPlayableCharacter});
    result.addAll({'role': role.toMap()});
    result.addAll({'abilities': abilities.map((x) => x.toMap()).toList()});

    return result;
  }
}
