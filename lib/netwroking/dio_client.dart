import 'package:dio/dio.dart';
import 'package:ecom/netwroking/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options
      ..baseUrl = APIEndpoints.BaseUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..headers = {
        'Content-Type': 'application/json',
      };
  }

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      return await _dio.get(endPoint, queryParameters: queryParameter);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> post(String endPoint, {Map<String, dynamic>? body}) async {
    try {
      return await _dio.post(endPoint, data: body);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> put(String endPoint, {Map<String, dynamic>? body}) async {
    try {
      return await _dio.put(endPoint, data: body);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> delete(String endPoint) async {
    try {
      return await _dio.delete(endPoint);
    } catch (e) {
      return Future.error(e);
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) => DioClient());
