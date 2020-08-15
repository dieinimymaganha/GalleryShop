import 'dart:convert';

import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlClients = baseUrl + 'clients';

class ClientWebClient {
  Future<List<ClientModel>> findAll() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    final Response response = await webClient.get(
      urlClients,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
          decodeJson.map((dynamic json) => ClientModel.fromJson(json)).toList();
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(ClientModelForm client) async {
    final String clientJson = jsonEncode(client.toJson());

    final Response response = await webClient.post(urlClients,
        headers: {'Content-type': 'application/json'}, body: clientJson);
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
