
import 'dart:convert';

import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

const urlEmployee = baseUrl + 'employees';


class EmployeeWebClient {

  Future<List<EmployeeModel>> findAll() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    final Response response = await webClient.get(
      urlEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
      decodeJson.map((dynamic json) => EmployeeModel.fromJson(json)).toList();
      print('aqui: ${data}');
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
