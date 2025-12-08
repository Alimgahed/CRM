import 'package:crm/features/developers/data/repo/developers_repo.dart';
import 'package:crm/features/developers/logic/cubit/developer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeveloperCubit extends Cubit<DeveloperStates> {
  final DevelopersRepo developersRepo;

  DeveloperCubit({required this.developersRepo,}) : super(const DeveloperStates.initial());

  Future<void> fetchAllDevelopmentCompanies() async {
    emit(const DeveloperStates.loading());

    try {
      final companies = await developersRepo.getAllDevelopmentCompanies();
      emit(DeveloperStates.loaded(companies));
    } catch (e) {
      emit(DeveloperStates.error(e.toString()));
    }
  }
}
