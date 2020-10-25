import 'dart:convert';


import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/employee.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlEmployee = baseUrl + 'employees';

class EmployeeWebClient {
  Future<List<EmployeeDto>> findAll() async {
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
          decodeJson.map((dynamic json) => EmployeeDto.fromJson(json)).toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<EmployeeDto> findPhoneNumber(String phoneNumber) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlEmployee + "/phoneNumber=" + phoneNumber,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final EmployeeDto data = EmployeeDto.fromJson(jsonDecode(response.body));
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(EmployeeForm employeeForm) async {
    String token = await getToken();
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
    String token = await getToken();
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

  Future<int> exclude(EmployeeDto employeeModel) async {
    String token = await getToken();
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
