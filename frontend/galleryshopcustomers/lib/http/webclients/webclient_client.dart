import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:http/http.dart';

import '../WebClient.dart';

const urlClients = baseUrl +'clients';


class ClientWebClient {
  Future<List<ClientModel>> findAll() async {
    final Response response = await webClient.get(urlClients);
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => ClientModel.fromJson(json))
        .toList();
  }

  Future<ClientModel> save(ClientModel client) async {
    final String clientJson = jsonEncode(client.toJson());

    final Response response = await webClient.post(urlClients,
        headers: {'Content-type': 'application/json'}, body: clientJson);
    if (response.statusCode == 200) {
      return ClientModel.fromJson(jsonDecode(response.body));
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
