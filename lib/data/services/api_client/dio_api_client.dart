import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'api_client.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;
  final String baseUrl;

  DioApiClient({required this.baseUrl, })
      : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
  
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
    
        return handler.next(e);
      },
    ));
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(path, options: Options(headers: headers));
      return response.data is String
          ? jsonDecode(response.data)
          : response.data;
    } catch (e) {
      throw Exception('GET $path failed: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response =
          await _dio.post(path, data: body, options: Options(headers: headers));
      return response.data is String
          ? jsonDecode(response.data)
          : response.data;
    } catch (e) {
      throw Exception('POST $path failed: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.patch(path,
          data: body, options: Options(headers: headers));
      return response.data is String
          ? jsonDecode(response.data)
          : response.data;
    } catch (e) {
      throw Exception('PATCH $path failed: $e');
    }
  }

  @override
  Future<void> delete(
    String path, {
    Map<String, String>? headers,
  }) async {
    try {
      await _dio.delete(path, options: Options(headers: headers));
    } catch (e) {
      throw Exception('DELETE $path failed: $e');
    }
  }
}
