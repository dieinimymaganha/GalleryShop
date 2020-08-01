import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:galleryshop/models/service.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlService = baseUrl + 'services';

class ServicesWebClient {
  Future<List<ServiceModel>> findAll() async {
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
          .map((dynamic json) => ServiceModel.fromJson(json))
          .toList();
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<ServiceModel> save(ServiceForm service) async {
    String token = await get_token();
    final String serviceJson = jsonEncode(service.toJson());
    final Response response = await webClient.post(
      urlService,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: serviceJson,
    );
    if (response.statusCode == 201) {
      return ServiceModel.fromJson(jsonDecode(response.body));
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

  Future<String> get_token() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    return token;
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
