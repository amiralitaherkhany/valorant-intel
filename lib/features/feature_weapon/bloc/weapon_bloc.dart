import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';
import 'package:valorant_intel/features/feature_weapon/data/repositories/weapon_repository.dart';

part 'weapon_event.dart';
part 'weapon_state.dart';

class WeaponBloc extends Bloc<WeaponEvent, WeaponState> {
  final WeaponRepository _weaponRepository;
  WeaponBloc({required WeaponRepository weaponRepository})
    : _weaponRepository = weaponRepository,
      super(WeaponLoadingState()) {
    on<GetAllWeaponsEvent>(
      (event, emit) async {
        emit(WeaponLoadingState());
        final response = await _weaponRepository.getAllWeapons();
        response.fold(
          (errorDetails) => emit(
            WeaponErrorState(
              message: errorDetails.$1,
              cachedWeaponList: errorDetails.$2,
            ),
          ),
          (weaponList) => emit(
            WeaponSuccessState(weaponList: weaponList),
          ),
        );
      },
    );
  }
}
