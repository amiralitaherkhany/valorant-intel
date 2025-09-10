import 'package:equatable/equatable.dart';

import 'shop_data.dart';
import 'skin.dart';
import 'weapon_stats.dart';

class Weapon extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? category;
  final String? defaultSkinUuid;
  final String? displayIcon;
  final String? killStreamIcon;
  final WeaponStats? weaponStats;
  final ShopData? shopData;
  final List<Skin>? skins;

  const Weapon({
    this.uuid,
    this.displayName,
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.killStreamIcon,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  factory Weapon.fromMap(Map<String, dynamic> data) => Weapon(
    uuid: data['uuid'] as String?,
    displayName: data['displayName'] as String?,
    category: data['category'] as String?,
    defaultSkinUuid: data['defaultSkinUuid'] as String?,
    displayIcon: data['displayIcon'] as String?,
    killStreamIcon: data['killStreamIcon'] as String?,
    weaponStats: data['weaponStats'] == null
        ? null
        : WeaponStats.fromMap(data['weaponStats'] as Map<String, dynamic>),
    shopData: data['shopData'] == null
        ? null
        : ShopData.fromMap(data['shopData'] as Map<String, dynamic>),
    skins: (data['skins'] as List<dynamic>?)
        ?.map((e) => Skin.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'displayName': displayName,
    'category': category,
    'defaultSkinUuid': defaultSkinUuid,
    'displayIcon': displayIcon,
    'killStreamIcon': killStreamIcon,
    'weaponStats': weaponStats?.toMap(),
    'shopData': shopData?.toMap(),
    'skins': skins?.map((e) => e.toMap()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      category,
      defaultSkinUuid,
      displayIcon,
      killStreamIcon,
      weaponStats,
      shopData,
      skins,
    ];
  }
}
