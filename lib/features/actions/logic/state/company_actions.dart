import 'package:crm/features/actions/data/model/company_actions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_actions.freezed.dart';

@freezed
class CompanyActionState<T> with _$CompanyActionState<T> {
  const factory CompanyActionState.initial() = CompanyActionStateInitial<T>;
  const factory CompanyActionState.loading() = CompanyActionStateLoading<T>;
  const factory CompanyActionState.loaded(List<CompanyActionsModel> data) =
      CompanyActionStateLoaded<T>;
  const factory CompanyActionState.error(String message) =
      CompanyActionStateError<T>;
}
