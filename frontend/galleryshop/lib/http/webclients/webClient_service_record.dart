import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:http/http.dart';

const urlServiceRecord = baseUrl + 'serviceRecord';

class ServiceRecordWebClient {
  Future<int> save(ServiceRecordForm serviceRecordForm) async {
    String token = await getToken();
    final String employeeJson = jsonEncode(serviceRecordForm.toJson());
    final Response response = await webClient.post(urlServiceRecord,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: employeeJson);

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