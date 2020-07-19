import 'dart:convert';

import 'package:galleryshop/models/type_employee_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlTypeEmployee = baseUrl + 'typeemployees';

class TypeEmployeeWebClient {
  Future<List<TypeEmployeeModel>> findAll() async {
    String token = await get_token();
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
          .map((dynamic json) => TypeEmployeeModel.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<TypeEmployeeModel> save(TypeEmployeeForm typeEmployee) async {
    print('ta aqui');
    String token = await get_token();
    final String typeEmployeeJson = jsonEncode(typeEmployee.toJson());
    final Response response = await webClient.post(
      urlTypeEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: typeEmployeeJson,
    );

    if (response.statusCode == 201) {
      return TypeEmployeeModel.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<String> get_token() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    return token;
  }

  Future<TypeEmployeeModel> update(TypeEmployeeModel typeEmployeeModel) async {
    String id = typeEmployeeModel.id.toString();
    String url_update = urlTypeEmployee + '/' + id;

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString(("tokenjwt") ?? ''));
    final String typeEmployeeJson = jsonEncode(typeEmployeeModel.toJson());

    final Response response = await webClient.put(url_update,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: typeEmployeeJson);

    if (response.statusCode == 200) {
      return TypeEmployeeModel.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<bool> exclude(TypeEmployeeModel typeEmployeeModel) async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString(("tokenjwt") ?? ''));
    String id = typeEmployeeModel.id.toString();
    String url_exclude = urlTypeEmployee + '/' + id;

    final Response response = await webClient.delete(
      url_exclude,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return true;
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
