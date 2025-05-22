import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<Response> get(
    String path, {
    Map<String, String>? headers,
    bool hasNoToken = false,
  });
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool hasNoToken = false,
  });
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool hasNoToken = false,
  });
  Future<void> delete(
    String path, {
    Map<String, String>? headers,
    bool hasNoToken = false,
  });
}
