import 'package:flutter/material.dart';
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
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Env": "production",
        },
      ),
    );

    // 🔥 Add dynamic headers via interceptor
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPreferencesHelper.getSecureString(
            SharedPreferenceKeys.userToken,
          );
          final refreshToken = await SharedPreferencesHelper.getSecureString(
            SharedPreferenceKeys.refreshToken,
          );

          debugPrint('🔑 Token from Storage: $token');

          options.headers.addAll({
            "MobileSecret": 'zIwfTeW6BOphToEX2AdmRPgMZw==',
            "Authorization": token,
            "refresh_token": refreshToken,
          });

          return handler.next(options);
        },
      ),
    );

    // Add LogInterceptor for network debugging
    _dio!.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

    return _dio!;
  }
}
