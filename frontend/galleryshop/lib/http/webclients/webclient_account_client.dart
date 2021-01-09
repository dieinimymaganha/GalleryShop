import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../WebClient.dart';

const urlAccountClient = baseUrl + 'accountClient';

class AccountClientWebClient {
  Future<List<AccountClientDto>> findAll() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");

    final response = await webClient.get(
      urlAccountClient,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => AccountClientDto.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statuscode) {
    if (_statusCodeResponses.containsKey(statuscode)) {
      return _statusCodeResponses[statuscode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication fail',
    409: 'transaction always exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
