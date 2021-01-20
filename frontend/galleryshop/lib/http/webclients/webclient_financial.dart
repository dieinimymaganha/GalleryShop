import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

const urlFlagCardPayment = baseUrl + 'flagCardPayment';

class FinancialWebClient {
  Future<List<FlagCardPaymentDto>> findAll() async {
    String token = await getToken();

    final Response response = await webClient.get(
      urlFlagCardPayment,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => FlagCardPaymentDto.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(FlagCardPaymentForm flagCardPaymentForm) async {
    String token = await getToken();
    final String employeeJson = jsonEncode(flagCardPaymentForm.toJson());
    final Response response = await webClient.post(urlFlagCardPayment,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: employeeJson);

    return response.statusCode;
  }


  Future<int> update(FlagCardPaymentForm flagCardPaymentForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlFlagCardPayment + '/' + id.toString();

    final String serviceJson = json.encode(flagCardPaymentForm.toJson());

    final Response response = await webClient.put(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

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
