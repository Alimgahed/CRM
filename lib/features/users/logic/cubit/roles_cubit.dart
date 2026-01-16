import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/users/data/repo/roles_repo.dart';
import 'package:crm/features/users/logic/states/roles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesCubit extends Cubit<RolesState> {
  final RolesRepo rolesRepo;

  RolesCubit({required this.rolesRepo}) : super(const RolesState.initial());

  Future<void> getRoles() async {
    emit(const RolesState.loading());

    final result = await rolesRepo.getRoles();

    result.when(
      success: (data) => emit(RolesState.loaded(data)),
      error: (e) => emit(RolesState.error(e.error ?? 'Unknown error')),
    );
  }
}
