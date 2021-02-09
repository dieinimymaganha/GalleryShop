import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:http/http.dart';

const urlSaleProduct = baseUrl + 'sales';

class SaleProductWebClient {
  Future<int> save(SaleForm saleForm) async {
    String token = await getToken();
    final String employeeJson = jsonEncode(saleForm.toJson());
    final Response response = await webClient.post(urlSaleProduct,
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: employeeJson);

    return response.statusCode;
  }

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
  Future<List<SaleDto>> findByEmployeeId(int id) async {
    String token = await getToken();
    final response = await webClient.get(
      urlSaleProduct + "/employeeId=" + id.toString(),
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

  Future<int> exclude(int id) async {
    String token = await getToken();
    String urlExclude = urlSaleProduct + '/' + id.toString();
    final Response response = await webClient.delete(
      urlExclude,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    return response.statusCode;
  }

  Future<int> update(SaleForm saleForm, int id) async {
    String token = await getToken();
    String urlUpdate = urlSaleProduct + '/productSold/' + id.toString();

    final String serviceJson = json.encode(saleForm.toJson());

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
