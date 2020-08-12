import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
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
      final List<dynamic> data = decodeJson
          .map((dynamic json) => EmployeeModel.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(EmployeeForm employeeForm) async {
    String token = await get_token();
    final String employeeJson = jsonEncode(employeeForm.toJson());
    final Response response = await webClient.post(urlEmployee,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: employeeJson);

    return response.statusCode;
  }

  Future<int> update(EmployeeForm employeeForm, int id) async {
    String token = await get_token();
    String urlUpdate = urlEmployee + '/' + id.toString();

    final String serviceJson = json.encode(employeeForm.toJson());

    final Response response = await webClient.put(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
  }

  Future<int> exclude(EmployeeModel employeeModel) async {
    String token = await get_token();
    String id = employeeModel.id.toString();
    String urlExclude = urlEmployee + '/' + id;

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
