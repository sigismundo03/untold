import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'api_client.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;
  final String baseUrl;

  DioApiClient({
    required this.baseUrl,
  }) : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (options.extra['skipAuth'] != true && token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        log('➡️ [${options.method}] ${options.uri}');
        log('Headers: ${options.headers}');
        if (options.data != null) {
          log('Body: ${options.data}');
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        log(e.toString());
        log(handler.toString());
        return handler.next(e);
      },
    ));
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, String>? headers,
    bool hasNoToken = false,
  }) async {
    try {
      final response = await _dio.get(
        path,
        options: Options(headers: headers, extra: {'skipAuth': hasNoToken}),
      );
      return response;
    } catch (e) {
      throw Exception('GET $path failed: $e');
    }
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool hasNoToken = false,
  }) async {
    try {
      final Response response = await _dio.post(path,
          data: body,
          options: Options(headers: headers, extra: {'skipAuth': hasNoToken}));
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('POST $path failed: $e');
    }
  }

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool hasNoToken = false,
  }) async {
    try {
      final response = await _dio.patch(path,
          data: body,
          options: Options(headers: headers, extra: {'skipAuth': hasNoToken}));
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('PATCH $path failed: $e');
    }
  }

  @override
  Future<void> delete(
    String path, {
    Map<String, String>? headers,
    bool hasNoToken = false,
  }) async {
    try {
      await _dio.delete(path,
          options: Options(headers: headers, extra: {'skipAuth': hasNoToken}));
    } catch (e) {
      log(e.toString());
      throw Exception('DELETE $path failed: $e');
    }
  }
}
