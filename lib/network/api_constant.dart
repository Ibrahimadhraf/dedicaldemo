

import 'dart:developer';

const String SOCKET_EXCEPTION = "SocketError", SERVER_ERROR = "Api Error", CODE_401 = "401";
void logD(Object o) {
  assert(() {
    log("$o");
    return true;
  }());
}
