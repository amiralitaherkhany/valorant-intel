import 'package:equatable/equatable.dart';

class Level extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic levelItem;
  final String? displayIcon;
  final dynamic streamedVideo;
  final String? assetPath;

  const Level({
    this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    this.assetPath,
  });

  factory Level.fromMap(Map<String, dynamic> data) => Level(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    levelItem: data['levelItem'] as dynamic,
    displayIcon: data['displayIcon'] as String?,
    streamedVideo: data['streamedVideo'] as dynamic,
    assetPath: data['assetPath'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'levelItem': levelItem,
    'displayIcon': displayIcon,
    'streamedVideo': streamedVideo,
    'assetPath': assetPath,
  };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      levelItem,
      displayIcon,
      streamedVideo,
      assetPath,
    ];
  }
}
