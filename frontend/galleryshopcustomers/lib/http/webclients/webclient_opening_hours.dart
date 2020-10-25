import 'dart:convert';
import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/opening_hours.dart';
import 'package:http/http.dart';

import '../WebClient.dart';

const urlOpeningHours = baseUrl + "openinghours";

class OpeningHoursWebClient {
  Future<List<OpeninigHoursDto>> findListOpeningHoursId(int id) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlOpeningHours + "/employee=" + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data = decodeJson
          .map((dynamic json) => OpeninigHoursDto.fromJson(json))
          .toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(OpeningHoursForm openingHoursForm) async {
    String token = await getToken();
    final String openingHoursJson = jsonEncode(openingHoursForm.toJson());
    final Response response = await webClient.post(urlOpeningHours,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: openingHoursJson);

    return response.statusCode;
  }

  Future<int> update(OpeningHoursForm openingHoursForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlOpeningHours + '/' + id.toString();

    final String serviceJson = json.encode(openingHoursForm.toJson());

    final Response response = await webClient.put(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
  }

  Future<int> exclude(OpeninigHoursDto openinigHoursDto) async {
    String token = await getToken();
    String id = openinigHoursDto.id.toString();
    String urlExclude = urlOpeningHours + '/' + id;

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
