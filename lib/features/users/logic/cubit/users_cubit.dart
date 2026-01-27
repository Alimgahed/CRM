import 'dart:async';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/states/users_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo usersRepo;

  // Keep a reference to the full list for local filtering
  List<UsersModel> _allUsers = [];
  Timer? _debounce;

  UsersCubit({required this.usersRepo}) : super(const UsersState.initial());

  Future<void> getAllUsers() async {
    emit(const UsersState.loading());
    final result = await usersRepo.getAllUsers();

    result.when(
      success: (users) {
        _allUsers = users.data; // Store the original data
        emit(UsersState.loaded(List.from(_allUsers)));
      },
      error: (e) => emit(UsersState.error(e.error ?? 'Failed to load users')),
    );
  }

  void filterUsers(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        emit(UsersState.loaded(List.from(_allUsers)));
        return;
      }

      // Professional local filtering by Name and Role Name
      final filteredList = _allUsers.where((user) {
        final nameLower = (user.fullName).toLowerCase();
        final roleLower =
            (user.roles?.isNotEmpty == true
                    ? (user.roles!.first.roleName ?? '')
                    : '')
                .toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) ||
            roleLower.contains(searchLower);
      }).toList();

      emit(UsersState.loaded(filteredList));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
