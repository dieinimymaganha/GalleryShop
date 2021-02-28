import 'dart:convert';
import 'package:galleryshopcustomers/models/login.dart';
import 'package:galleryshopcustomers/models/token.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlLogin = baseUrl + 'auth';

class LoginWebClient {
  Future<Response> sendUser(LoginModel loginModel) async {
    var prefs = await SharedPreferences.getInstance();
    final String loginJson = jsonEncode(loginModel.toJson());
    final Response response = await webClient.post(urlLogin,
        headers: {'Content-type': 'application/json'}, body: loginJson);

    if (response.statusCode == 200) {
      TokenModel token = TokenModel.fromJson(jsonDecode(response.body));
      prefs.setString("tokenjwt", token.token.toString());
      prefs.setString("phoneNumber", loginModel.phoneNumber.toString());
      return response;
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
