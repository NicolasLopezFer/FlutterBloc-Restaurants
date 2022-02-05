import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class HttpRequest {
  HttpRequest._privateConstructor();

  static final HttpRequest _instance = HttpRequest._privateConstructor();

  factory HttpRequest() {
    return _instance;
  }

  Future<dynamic> getRequest(String domain, String path,
      {Map<String, dynamic>? queryParameters}) async {
    Response response;

    try {
      Uri uri = Uri.https(domain, path, queryParameters);
      response = await get(uri);
      var res = jsonDecode(utf8.decode(response.bodyBytes));

      return res;
    } on SocketException {
      throw "SocketException";
    }
  }
}
