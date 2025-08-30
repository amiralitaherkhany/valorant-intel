import 'package:equatable/equatable.dart';

class AdsStats extends Equatable {
  final double? zoomMultiplier;
  final double? fireRate;
  final double? runSpeedMultiplier;
  final int? burstCount;
  final double? firstBulletAccuracy;

  const AdsStats({
    this.zoomMultiplier,
    this.fireRate,
    this.runSpeedMultiplier,
    this.burstCount,
    this.firstBulletAccuracy,
  });

  factory AdsStats.fromMap(Map<String, dynamic> data) => AdsStats(
    zoomMultiplier: (data['zoomMultiplier'] as num?)?.toDouble(),
    fireRate: (data['fireRate'] as num?)?.toDouble(),
    runSpeedMultiplier: (data['runSpeedMultiplier'] as num?)?.toDouble(),
    burstCount: data['burstCount'] as int?,
    firstBulletAccuracy: (data['firstBulletAccuracy'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    'zoomMultiplier': zoomMultiplier,
    'fireRate': fireRate,
    'runSpeedMultiplier': runSpeedMultiplier,
    'burstCount': burstCount,
    'firstBulletAccuracy': firstBulletAccuracy,
  };

  @override
  List<Object?> get props {
    return [
      zoomMultiplier,
      fireRate,
      runSpeedMultiplier,
      burstCount,
      firstBulletAccuracy,
    ];
  }
}
