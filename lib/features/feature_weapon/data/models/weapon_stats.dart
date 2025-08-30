import 'package:equatable/equatable.dart';

import 'ads_stats.dart';
import 'damage_range.dart';

class WeaponStats extends Equatable {
  final int? fireRate;
  final int? magazineSize;
  final double? runSpeedMultiplier;
  final double? equipTimeSeconds;
  final int? reloadTimeSeconds;
  final double? firstBulletAccuracy;
  final int? shotgunPelletCount;
  final String? wallPenetration;
  final String? feature;
  final dynamic fireMode;
  final String? altFireType;
  final AdsStats? adsStats;
  final dynamic altShotgunStats;
  final dynamic airBurstStats;
  final List<DamageRange>? damageRanges;

  const WeaponStats({
    this.fireRate,
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
    this.wallPenetration,
    this.feature,
    this.fireMode,
    this.altFireType,
    this.adsStats,
    this.altShotgunStats,
    this.airBurstStats,
    this.damageRanges,
  });

  factory WeaponStats.fromMap(Map<String, dynamic> data) => WeaponStats(
    fireRate: data['fireRate'] as int?,
    magazineSize: data['magazineSize'] as int?,
    runSpeedMultiplier: (data['runSpeedMultiplier'] as num?)?.toDouble(),
    equipTimeSeconds: (data['equipTimeSeconds'] as num?)?.toDouble(),
    reloadTimeSeconds: data['reloadTimeSeconds'] as int?,
    firstBulletAccuracy: (data['firstBulletAccuracy'] as num?)?.toDouble(),
    shotgunPelletCount: data['shotgunPelletCount'] as int?,
    wallPenetration: data['wallPenetration'] as String?,
    feature: data['feature'] as String?,
    fireMode: data['fireMode'] as dynamic,
    altFireType: data['altFireType'] as String?,
    adsStats: data['adsStats'] == null
        ? null
        : AdsStats.fromMap(data['adsStats'] as Map<String, dynamic>),
    altShotgunStats: data['altShotgunStats'] as dynamic,
    airBurstStats: data['airBurstStats'] as dynamic,
    damageRanges: (data['damageRanges'] as List<dynamic>?)
        ?.map((e) => DamageRange.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'fireRate': fireRate,
    'magazineSize': magazineSize,
    'runSpeedMultiplier': runSpeedMultiplier,
    'equipTimeSeconds': equipTimeSeconds,
    'reloadTimeSeconds': reloadTimeSeconds,
    'firstBulletAccuracy': firstBulletAccuracy,
    'shotgunPelletCount': shotgunPelletCount,
    'wallPenetration': wallPenetration,
    'feature': feature,
    'fireMode': fireMode,
    'altFireType': altFireType,
    'adsStats': adsStats?.toMap(),
    'altShotgunStats': altShotgunStats,
    'airBurstStats': airBurstStats,
    'damageRanges': damageRanges?.map((e) => e.toMap()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      fireRate,
      magazineSize,
      runSpeedMultiplier,
      equipTimeSeconds,
      reloadTimeSeconds,
      firstBulletAccuracy,
      shotgunPelletCount,
      wallPenetration,
      feature,
      fireMode,
      altFireType,
      adsStats,
      altShotgunStats,
      airBurstStats,
      damageRanges,
    ];
  }
}
