class Role {
  String uuid;
  String displayName;
  String description;
  String displayIcon;
  String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  factory Role.fromMap(Map<String, dynamic> json) => Role(
    uuid: json['uuid'] ?? "",
    displayName: json['displayName'] ?? "",
    description: json['description'] ?? "",
    displayIcon: json['displayIcon'] ?? "",
    assetPath: json['assetPath'] ?? "",
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'description': description,
    'displayIcon': displayIcon,
    'assetPath': assetPath,
  };
}
