class Ability {
  String displayName;
  String description;
  String displayIcon;

  Ability({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
    displayName: json['displayName'] ?? "",
    description: json['description'] ?? "",
    displayIcon: json['displayIcon'] ?? "",
  );

  Map<String, dynamic> toMap() => {
    'displayName': displayName,
    'description': description,
    'displayIcon': displayIcon,
  };
}
