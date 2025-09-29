import 'package:equatable/equatable.dart';

class Chroma extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic displayIcon;
  final String? fullRender;
  final dynamic swatch;
  final dynamic streamedVideo;

  const Chroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
  });

  factory Chroma.fromMap(Map<String, dynamic> data) => Chroma(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    displayIcon: data['displayIcon'] as dynamic,
    fullRender: data['fullRender'] as String?,
    swatch: data['swatch'] as dynamic,
    streamedVideo: data['streamedVideo'] as dynamic,
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'displayIcon': displayIcon,
    'fullRender': fullRender,
    'swatch': swatch,
    'streamedVideo': streamedVideo,
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
    ];
  }
}
