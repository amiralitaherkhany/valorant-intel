import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_error_view.dart';
import 'package:valorant_intel/core/widgets/custom_shimmer_grid_view.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';
import 'package:valorant_intel/features/feature_weapon/bloc/weapon_bloc.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponsPage extends StatelessWidget {
  const WeaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.weapons),
      ),
      body: BlocConsumer<WeaponBloc, WeaponState>(
        builder: (context, state) {
          return switch (state) {
            WeaponLoadingState() => CustomShimmerGridView(
              width: 100,
              height: 100,
              radius: 20,
            ),
            WeaponSuccessState(:final weaponList) => WeaponSuccessView(
              weaponList: weaponList,
            ),
            WeaponErrorState(
              :final message,
              :final cachedWeaponList,
            ) =>
              cachedWeaponList == null
                  ? CustomErrorView(
                      message: message,
                      onTryAgain: () =>
                          context.read<WeaponBloc>().add(GetAllWeaponsEvent()),
                    )
                  : WeaponSuccessView(
                      weaponList: cachedWeaponList,
                    ),
          };
        },
        listener: (context, state) {
          if (state is WeaponErrorState && state.cachedWeaponList != null) {
            context.showSimpleSnackBar(
              context.localizations.cachedContent(
                context.translateError(state.message),
              ),
            );
          }
        },
      ),
    );
  }
}

class WeaponSuccessView extends StatelessWidget {
  const WeaponSuccessView({super.key, required this.weaponList});
  final List<Weapon> weaponList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(weaponList[index].displayName ?? ""),
      ),
    );
  }
}
