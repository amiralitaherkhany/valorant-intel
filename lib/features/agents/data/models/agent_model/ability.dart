class Ability {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json['slot'] as String?,
        displayName: json['displayName'] as String?,
        description: json['description'] as String?,
        displayIcon: json['displayIcon'] as String?,
      );
}
