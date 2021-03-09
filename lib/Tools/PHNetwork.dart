import 'dart:convert';

import 'package:dio/dio.dart';

class PHNetwork {
  static Dio _dio = Dio();

  static Future get(String path) async {
    try {
      Response response = await _dio.get(path);
      print("uri = ${response.request.uri}");
      // print("data = ${response.data}");
      return response.data;
    } catch (e) {
      print("error = $e");
    }
  }
}
