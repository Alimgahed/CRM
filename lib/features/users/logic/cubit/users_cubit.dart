import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo userRepo;

  UsersCubit({required this.userRepo}) : super(const UsersState.initial());

  Future<void> getAllUsers() async {
    emit(const UsersState.loading());

    final result = await userRepo.getAllUsers();

    result.when(
      success: (data) => emit(UsersState.loaded(data.data)),
      error: (e) => emit(UsersState.error(e.error ?? 'Unknown error')),
    );
  }
}
