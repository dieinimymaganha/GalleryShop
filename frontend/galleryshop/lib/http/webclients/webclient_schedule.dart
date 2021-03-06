import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:http/http.dart';

const urlSchedule = baseUrl + 'schedules';

class ScheduleWebClient {
  Future<List<ScheduleDto>> findScheduleIdEmployee(
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
          decodeJson.map((dynamic json) => ScheduleDto.fromJson(json)).toList();
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

  Future<int> scheduleEnableSchedue(
      ScheduleEnableScheduleForm scheduleEnableScheduleForm) async {
    String token = await getToken();

    final String serviceJson = json.encode(scheduleEnableScheduleForm.toJson());

    final Response response = await webClient.post(urlSchedule,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
  }

  Future<List<ScheduleDtoAppointment>> scheduleFindMyAppointment(
      int idEmployee, int idTypeEmployee) async {
    String token = await getToken();
    String urlConsult = urlSchedule +
        '/available/employeeId=' +
        idEmployee.toString() +
        '&typeEmployeeId=' +
        idTypeEmployee.toString();

    final Response response = await webClient.get(
      urlConsult,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => ScheduleDtoAppointment.fromJson(json))
          .toList();
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
