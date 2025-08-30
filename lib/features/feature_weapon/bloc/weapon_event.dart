part of 'weapon_bloc.dart';

sealed class WeaponEvent extends Equatable {
  const WeaponEvent();

  @override
  List<Object> get props => [];
}

final class GetAllWeaponsEvent extends WeaponEvent {}
