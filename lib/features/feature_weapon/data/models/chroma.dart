import 'package:equatable/equatable.dart';

class Chroma extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic displayIcon;
  final String? fullRender;
  final dynamic swatch;
  final dynamic streamedVideo;
  final String? assetPath;

  const Chroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
    this.assetPath,
  });

  factory Chroma.fromMap(Map<String, dynamic> data) => Chroma(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    displayIcon: data['displayIcon'] as dynamic,
    fullRender: data['fullRender'] as String?,
    swatch: data['swatch'] as dynamic,
    streamedVideo: data['streamedVideo'] as dynamic,
    assetPath: data['assetPath'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'displayIcon': displayIcon,
    'fullRender': fullRender,
    'swatch': swatch,
    'streamedVideo': streamedVideo,
    'assetPath': assetPath,
  };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      displayIcon,
      fullRender,
      swatch,
      streamedVideo,
      assetPath,
    ];
  }
}
