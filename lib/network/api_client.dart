import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_constant.dart';
import 'error_response.dart';

enum RequestType {
  GET_REQUEST,
  POST_REQUEST,
  PUT_REQUEST,
}

Future<dynamic> apiCallService(
    {String ? apiUrl,
    RequestType? requestType,
    http.Client? client,
    String? sessionToken,
    dynamic requestBody,
    Function? getResponse}) async {
  logD('get url $apiUrl');
  http.Response? response;
  try {
    final result = await InternetAddress.lookup('google.com');
    var headers = sessionToken == null
        ? {
            'Content-Type': 'application/json',
            "Accept": 'application/json',
          }
        : {'Authorization': 'Bearer $sessionToken'};
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var url = Uri.parse(apiUrl!);
      try {
        if (requestType == RequestType.GET_REQUEST) {
          response = await http
              .get(url, headers: headers)
              .timeout(const Duration(seconds: 180));
        } else if (requestType == RequestType.POST_REQUEST) {

          try {
            response = await client!.post(url,
                body: requestBody ,headers: headers).timeout(const Duration(seconds: 180));

          } finally {
            client!.close();
          }
        } else if (requestType == RequestType.PUT_REQUEST) {
          try {
            response = await client!
                .put(url, headers: headers, body: requestBody)
                .timeout(const Duration(seconds: 180));
          }finally{
            client!.close();
          }
        }

        final statusCode = response!.statusCode;
        logD('statusCode $statusCode');
        logD('response ${response.body}');

        if (statusCode != 200) {
          logD('error response ${response.body}');
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: SERVER_ERROR, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            logD('######## error is $errorResponse');
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        return getResponse!(response.body);
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: e.message! + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SERVER_ERROR, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: SOCKET_EXCEPTION);
  }
}
