import 'dart:convert';

import 'package:galleryshop/models/type_employee_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlTypeEmployee = baseUrl + 'typeemployees';

class TypeEmployeeWebClient {
  Future<List<TypeEmployeeDto>> findAll() async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlTypeEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => TypeEmployeeDto.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(TypeEmployeeForm typeEmployee) async {
    String token = await getToken();
    final String typeEmployeeJson = jsonEncode(typeEmployee.toJson());
    final Response response = await webClient.post(
      urlTypeEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: typeEmployeeJson,
    );

    return response.statusCode;
  }

  Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    return token;
  }

  Future<int> update(TypeEmployeeForm typeEmployeeForm, int id) async {
    String urlUpdate = urlTypeEmployee + '/' + id.toString();

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString(("tokenjwt") ?? ''));
    final String typeEmployeeJson = jsonEncode(typeEmployeeForm.toJson());

    final Response response = await webClient.put(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: typeEmployeeJson);
    return response.statusCode;
  }

  Future<int> exclude(TypeEmployeeDto typeEmployeeModel) async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString(("tokenjwt") ?? ''));
    String id = typeEmployeeModel.id.toString();
    String urlExclude = urlTypeEmployee + '/' + id;

    final Response response = await webClient.delete(
      urlExclude,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );

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
