import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/models/service.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlService = baseUrl + 'services';

class ServicesWebClient {
  Future<List<ServiceDto>> findAll() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    final Response response = await webClient.get(
      urlService,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      return decodeJson
          .map((dynamic json) => ServiceDto.fromJson(json))
          .toList();
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(ServiceForm service) async {
    String token = await getToken();
    final String serviceJson = jsonEncode(service.toJson());
    final Response response = await webClient.post(
      urlService,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: serviceJson,
    );
    return response.statusCode;
  }

  Future<int> update(ServiceForm serviceForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlService + '/' + id.toString();

    final String serviceJson = json.encode(serviceForm.toJson());

    final Response response = await webClient.put(urlUpdate,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: serviceJson);

    return response.statusCode;
  }

  Future<int> exclude(ServiceDto serviceModel) async {
    String token = await getToken();
    String id = serviceModel.id.toString();
    String urlExclude = urlService + '/' + id;

    final Response response = await webClient.delete(
      urlExclude,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    return response.statusCode;
  }

  Future<List<ServiceDto>> findByTypeEmployeeId(int id) async {
    String token = await getToken();
    String url = urlService + "/typeEmployee=" + id.toString();
    final Response response = await webClient.get(
      url,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      return decodeJson
          .map((dynamic json) => ServiceDto.fromJson(json))
          .toList();
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
