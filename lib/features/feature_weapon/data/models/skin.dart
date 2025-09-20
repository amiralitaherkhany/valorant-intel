import 'package:equatable/equatable.dart';

import 'chroma.dart';
import 'level.dart';

class Skin extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final dynamic wallpaper;
  final List<Chroma>? chromas;
  final List<Level>? levels;

  const Skin({
    this.uuid,
    this.displayName,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    this.chromas,
    this.levels,
  });

  factory Skin.fromMap(Map<String, dynamic> data) => Skin(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    themeUuid: data['themeUuid'] as String?,
    contentTierUuid: data['contentTierUuid'] as String?,
    displayIcon: data['displayIcon'] as String?,
    wallpaper: data['wallpaper'] as dynamic,
    chromas: (data['chromas'] as List<dynamic>?)
        ?.map((e) => Chroma.fromMap(e as Map<String, dynamic>))
        .toList(),
    levels: (data['levels'] as List<dynamic>?)
        ?.map((e) => Level.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'themeUuid': themeUuid,
    'contentTierUuid': contentTierUuid,
    'displayIcon': displayIcon,
    'wallpaper': wallpaper,
    'chromas': chromas?.map((e) => e.toMap()).toList(),
    'levels': levels?.map((e) => e.toMap()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      themeUuid,
      contentTierUuid,
      displayIcon,
      wallpaper,
      chromas,
      levels,
    ];
  }
}
