import 'dart:convert';

import 'package:http/http.dart';
import 'package:megatech/source/core/error.dart';

class ApiClient {
  final Client _client;
  static const _authorization = '93cbee82230c36913ef3b30b30415f52';
  ApiClient(this._client);
  dynamic get(Uri uri, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(uri,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw const ServerException();
    }
  }

  dynamic post(Uri uri, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      uri,
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':_authorization
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw const ServerException();
    } else {
      throw const ServerException();
    }
  }

}