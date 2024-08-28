import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

class ApiService {
  ApiService() {
    dio.options.baseUrl = "https://api.openweathermap.org/";
  }

  Future<dynamic> get({required String endPoint, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(endPoint, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  // Error handling method
  void _handleError(DioException e) {
    if (e.response != null) {
      print('Server Error: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } else {
      print('Client Error: ${e.message}');
    }
    throw e;
  }
}
