import 'package:crm/Core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = ApiResultSuccess<T>;
  const factory ApiResult.error(ApiErrorModel error) = ApiResultError<T>;
}
