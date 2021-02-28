import 'dart:convert';


import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/my_account.dart';
import 'package:http/http.dart';

import '../WebClient.dart';

const urlMyAccount = baseUrl + 'users';

class MyAccountWebClient {
  Future<int> update(UpdatePassWordForm updatePassWordForm) async {
    String token = await getToken();

    final String serviceJson = json.encode(updatePassWordForm.toJson());

    final Response response = await webClient.put(urlMyAccount,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
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
