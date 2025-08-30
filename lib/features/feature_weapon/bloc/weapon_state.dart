part of 'weapon_bloc.dart';

sealed class WeaponState extends Equatable {
  const WeaponState();

  @override
  List<Object?> get props => [];
}

final class WeaponLoadingState extends WeaponState {}

final class WeaponSuccessState extends WeaponState {
  final List<Weapon> weaponList;

  const WeaponSuccessState({required this.weaponList});

  @override
  List<Object?> get props => [weaponList];
}

final class WeaponErrorState extends WeaponState {
  final String message;
  final List<Weapon>? cachedWeaponList;

  const WeaponErrorState({
    required this.message,
    required this.cachedWeaponList,
  });

  @override
  List<Object?> get props => [message, cachedWeaponList];
}
