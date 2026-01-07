import 'package:crm/Core/helpers/shared_preference_contatnt.dart';
import 'package:crm/Core/helpers/shared_preferences.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:dio/dio.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDioInstance() {
    if (_dio != null) return _dio!;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // <-- Add your base URL here
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization": SharedPreferencesHelper.getSecureString(
            SharedPreferenceKeys.userToken,
          ),
        },
      ),
    );

    // 🔥 Add dynamic headers via interceptor
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({
            "Env": "production",
            "Authorization": await SharedPreferencesHelper.getSecureString(
              SharedPreferenceKeys.userToken,
            ),
          });

          return handler.next(options);
        },
      ),
    );

    return _dio!;
  }
}
