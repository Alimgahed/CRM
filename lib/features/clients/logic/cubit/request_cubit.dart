import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/repo/request_repo.dart';
import 'package:crm/features/clients/logic/states/request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestRepo requestRepo;

  RequestCubit({required this.requestRepo})
    : super(const RequestState.initial());

  Future<void> fetchRequests(int id) async {
    emit(const RequestState.loading());

    final result = await requestRepo.getBuyingRequests(id);

    result.when(
      success: (data) => emit(RequestState.loaded(data.data)),
      error: (error) =>
          emit(RequestState.error(error.error ?? "Unknown Error")),
    );
  }
}
