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

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        slot: json['slot'] ?? "",
        displayName: json['displayName'] ?? "",
        description: json['description'] ?? "",
        displayIcon: json['displayIcon'] ?? "",
      );

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'displayName': displayName,
        'description': description,
        'displayIcon': displayIcon,
      };
}
