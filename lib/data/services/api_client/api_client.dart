import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<Response> get(String path, {Map<String, String>? headers});
  Future<Response> post(String path,
      {Map<String, dynamic>? body, Map<String, String>? headers});
  Future<Response> patch(String path,
      {Map<String, dynamic>? body, Map<String, String>? headers});
  Future<void> delete(String path, {Map<String, String>? headers});
}
