class Ability {
  String slot;
  String displayName;
  String description;
  String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json['slot'] as String,
        displayName: json['displayName'] as String,
        description: json['description'] as String,
        displayIcon: json['displayIcon'] ?? "",
      );
}
