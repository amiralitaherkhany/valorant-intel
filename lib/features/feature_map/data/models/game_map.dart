import 'package:equatable/equatable.dart';

import 'callout.dart';

class GameMap extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic narrativeDescription;
  final String? tacticalDescription;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? listViewIconTall;
  final String? splash;
  final String? stylizedBackgroundImage;
  final String? premierBackgroundImage;
  final String? assetPath;
  final String? mapUrl;
  final double? xMultiplier;
  final double? yMultiplier;
  final double? xScalarToAdd;
  final double? yScalarToAdd;
  final List<Callout>? callouts;

  const GameMap({
    this.uuid,
    this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.listViewIconTall,
    this.splash,
    this.stylizedBackgroundImage,
    this.premierBackgroundImage,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  factory GameMap.fromMap(Map<String, dynamic> data) => GameMap(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    narrativeDescription: data['narrativeDescription'] as dynamic,
    tacticalDescription: data['tacticalDescription'] as String?,
    coordinates: data['coordinates'] as String?,
    displayIcon: data['displayIcon'] as String?,
    listViewIcon: data['listViewIcon'] as String?,
    listViewIconTall: data['listViewIconTall'] as String?,
    splash: data['splash'] as String?,
    stylizedBackgroundImage: data['stylizedBackgroundImage'] as String?,
    premierBackgroundImage: data['premierBackgroundImage'] as String?,
    assetPath: data['assetPath'] as String?,
    mapUrl: data['mapUrl'] as String?,
    xMultiplier: (data['xMultiplier'] as num?)?.toDouble(),
    yMultiplier: (data['yMultiplier'] as num?)?.toDouble(),
    xScalarToAdd: (data['xScalarToAdd'] as num?)?.toDouble(),
    yScalarToAdd: (data['yScalarToAdd'] as num?)?.toDouble(),
    callouts: (data['callouts'] as List<dynamic>?)
        ?.map((e) => Callout.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'narrativeDescription': narrativeDescription,
    'tacticalDescription': tacticalDescription,
    'coordinates': coordinates,
    'displayIcon': displayIcon,
    'listViewIcon': listViewIcon,
    'listViewIconTall': listViewIconTall,
    'splash': splash,
    'stylizedBackgroundImage': stylizedBackgroundImage,
    'premierBackgroundImage': premierBackgroundImage,
    'assetPath': assetPath,
    'mapUrl': mapUrl,
    'xMultiplier': xMultiplier,
    'yMultiplier': yMultiplier,
    'xScalarToAdd': xScalarToAdd,
    'yScalarToAdd': yScalarToAdd,
    'callouts': callouts?.map((e) => e.toMap()).toList(),
  };

  GameMap copyWith({
    String? uuid,
    String? displayName,
    dynamic narrativeDescription,
    String? tacticalDescription,
    String? coordinates,
    String? displayIcon,
    String? listViewIcon,
    String? listViewIconTall,
    String? splash,
    String? stylizedBackgroundImage,
    String? premierBackgroundImage,
    String? assetPath,
    String? mapUrl,
    double? xMultiplier,
    double? yMultiplier,
    double? xScalarToAdd,
    double? yScalarToAdd,
    List<Callout>? callouts,
  }) {
    return GameMap(
      uuid: uuid ?? this.uuid,
      displayName: displayName ?? this.displayName,
      narrativeDescription: narrativeDescription ?? this.narrativeDescription,
      tacticalDescription: tacticalDescription ?? this.tacticalDescription,
      coordinates: coordinates ?? this.coordinates,
      displayIcon: displayIcon ?? this.displayIcon,
      listViewIcon: listViewIcon ?? this.listViewIcon,
      listViewIconTall: listViewIconTall ?? this.listViewIconTall,
      splash: splash ?? this.splash,
      stylizedBackgroundImage:
          stylizedBackgroundImage ?? this.stylizedBackgroundImage,
      premierBackgroundImage:
          premierBackgroundImage ?? this.premierBackgroundImage,
      assetPath: assetPath ?? this.assetPath,
      mapUrl: mapUrl ?? this.mapUrl,
      xMultiplier: xMultiplier ?? this.xMultiplier,
      yMultiplier: yMultiplier ?? this.yMultiplier,
      xScalarToAdd: xScalarToAdd ?? this.xScalarToAdd,
      yScalarToAdd: yScalarToAdd ?? this.yScalarToAdd,
      callouts: callouts ?? this.callouts,
    );
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      narrativeDescription,
      tacticalDescription,
      coordinates,
      displayIcon,
      listViewIcon,
      listViewIconTall,
      splash,
      stylizedBackgroundImage,
      premierBackgroundImage,
      assetPath,
      mapUrl,
      xMultiplier,
      yMultiplier,
      xScalarToAdd,
      yScalarToAdd,
      callouts,
    ];
  }
}
