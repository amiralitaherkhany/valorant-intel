import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponDetailPage extends StatelessWidget {
  const WeaponDetailPage({super.key, required this.weapon});
  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(weapon.displayName ?? ""),
    );
  }
}
