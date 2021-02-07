import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/models/account_employee.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlAccountEmployee = baseUrl + 'accountEmployee';

const urlCloseAccount = baseUrl + 'closeAccount';

class AccountEmployeeWebClient {
  Future<List<AccountEmployeeDto>> findAll() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");

    final response = await webClient.get(
      urlAccountEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => AccountEmployeeDto.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<AccountEmployeeDto> findById(int id) async {
    String token = await getToken();
    final response = await webClient.get(
      urlAccountEmployee + "/employeeId=" + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final AccountEmployeeDto data =
          AccountEmployeeDto.fromJson(jsonDecode(response.body));
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
