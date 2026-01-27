import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/actions/data/repo/company_action_repo.dart';
import 'package:crm/features/actions/logic/state/company_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCompanyActionsCubit extends Cubit<CompanyActionState> {
  final CompanyActionRepo companyActionRepo;

  AllCompanyActionsCubit({required this.companyActionRepo})
    : super(const CompanyActionState.initial());

  Future<void> getCompanyActions() async {
    emit(const CompanyActionState.loading());

    final result = await companyActionRepo.getCompanyActions();

    result.when(
      success: (data) => emit(CompanyActionState.loaded(data.data!)),
      error: (e) => emit(CompanyActionState.error(e.error ?? 'Unknown error')),
    );
  }
}
