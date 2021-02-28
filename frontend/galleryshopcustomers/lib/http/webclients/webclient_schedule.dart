import 'dart:convert';
import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:http/http.dart';

import '../WebClient.dart';

const urlSchedule = baseUrl + 'schedules';

class ScheduleWebClient {
  Future<List<ScheduleDtoAppointment>> findScheduleIdEmployee(
      String idEmployee, String idTypeEmployee) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlSchedule +
          "/current/employeeId=" +
          idEmployee +
          "&" +
          "typeEmployeeId=" +
          idTypeEmployee,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
          decodeJson.map((dynamic json) => ScheduleDtoAppointment.fromJson(json)).toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> scheduleAppointment(
      ScheduleAppointmentForm scheduleAppointmentForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlSchedule + '/' + id.toString();

    final String serviceJson = json.encode(scheduleAppointmentForm.toJson());

    final Response response = await webClient.patch(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
  }

  Future<int> cancelAppointment(int id) async {
    String token = await getToken();
    String urlCalncel = urlSchedule + '/cancel/' + id.toString();

    final Response response = await webClient.patch(
      urlCalncel,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );

    return response.statusCode;
  }

  Future<List<ScheduleDtoAppointment>> getAppointmentClient(String clientId) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlSchedule + "/clientId=" + clientId,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
          decodeJson.map((dynamic json) => ScheduleDtoAppointment.fromJson(json)).toList();
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
