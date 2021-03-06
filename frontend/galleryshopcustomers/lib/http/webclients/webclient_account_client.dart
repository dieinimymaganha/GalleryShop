import 'dart:convert';


import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/AccountClient.dart';
import 'package:galleryshopcustomers/models/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlAccountClient = baseUrl + 'accountClient';

const urlCloseAccount = baseUrl + 'closeAccount';

class AccountClientWebClient {

  Future<AccountClientDto> findById(int id) async {
    String token = await getToken();
    final response = await webClient.get(
      urlAccountClient + "/clientId=" + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final AccountClientDto data =
          AccountClientDto.fromJson(jsonDecode(response.body));
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<AccountClientDto> findByAccountId(int id) async {
    String token = await getToken();
    final response = await webClient.get(
      urlAccountClient + "/"  + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final AccountClientDto data =
      AccountClientDto.fromJson(jsonDecode(response.body));
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<List<PaymentDto>> findPaymentsAccountId(int id) async {
    String token = await getToken();

    String url = urlAccountClient + '/payments/' + id.toString();

    final response = await webClient.get(
      url,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
          decodeJson.map((dynamic json) => PaymentDto.fromJson(json)).toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
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
