import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/owners/data/repo/owner_repo.dart';
import 'package:crm/features/owners/logic/states/owner_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerCubit extends Cubit<OwnerState> {
  final OwnerRepo ownerRepo;

  OwnerCubit({required this.ownerRepo}) : super(const OwnerState.initial());

  Future<void> getAllOwners() async {
    emit(const OwnerState.loading());

    final result = await ownerRepo.getAllOwners();

    result.when(
      success: (data) => emit(OwnerState.loaded(data.data)),
      error: (error) => emit(OwnerState.error(error.error ?? "Unknown Error")),
    );
  }
}
