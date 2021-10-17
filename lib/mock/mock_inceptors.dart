import 'dart:convert';

import 'package:flutter/services.dart';

class JsonMockInterceptor {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  static Future<Map<String, dynamic>> getData(String path) async {
    final resourcePath = _jsonDir + path + _jsonExtension;
    Map<String, dynamic> response = {};

    try {
      final data = await rootBundle.load(resourcePath);
      response = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );
    } catch (e) {
      response = {"status": 500, "message": e.toString()};
    } finally {
      return response;
    }
  }
}
