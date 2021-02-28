import 'dart:convert';

import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../WebClient.dart';

const urlClients = baseUrl + 'clients';

class ClientWebClient {
  Future<ClientDto> findPhoneNumber(String phoneNumber) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlClients + "/phoneNumber=" + phoneNumber,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final ClientDto data = ClientDto.fromJson(jsonDecode(response.body));
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<ClientDto> findById(int id) async {
    String token = await getToken();
    final Response response = await webClient.get(
      urlClients + "/" + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final ClientDto data = ClientDto.fromJson(jsonDecode(response.body));
      return data;
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<int> save(ClientForm client) async {
    final String clientJson = jsonEncode(client.toJson());

    final Response response = await webClient.post(urlClients,
        headers: {'Content-type': 'application/json'}, body: clientJson);
    return response.statusCode;
  }

  Future<int> update(ClientForm clientForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlClients + '/' + id.toString();

    final String serviceJson = json.encode(clientForm.toJson());

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
