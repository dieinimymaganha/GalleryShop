import 'dart:convert';

import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/models/sale.dart';
import 'package:http/http.dart';

import '../WebClient.dart';

const urlSaleProduct = baseUrl + 'sales';

class SaleProductWebClient {
  Future<List<SaleDto>> findByClientId(int id) async {
    String token = await getToken();
    final response = await webClient.get(
      urlSaleProduct + "/clientId=" + id.toString(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeJson = jsonDecode(response.body);
      final List<dynamic> data =
          decodeJson.map((dynamic json) => SaleDto.fromJson(json)).toList();
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
