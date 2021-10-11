import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler v) async {
    final resourcePath = _jsonDir + options.path + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );
    return {"status": 200, "data": map};
  }
}
