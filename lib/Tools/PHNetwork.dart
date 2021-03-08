import 'dart:convert';

import 'package:dio/dio.dart';

class PHNetwork {
  static Future<String> get(String path) async {
    try {
      Response response = await Dio().get(path);
      print("uri = ${response.request.uri}");
      // print("data = ${response.data}");
      return json.encode(response.data);
    } catch (e) {
      print("error = $e");
    }
  }
}
