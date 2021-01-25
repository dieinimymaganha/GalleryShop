import 'dart:convert';

import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/models/product.dart';
import 'package:http/http.dart';

const urlProduct = baseUrl + "products";

class ProductWebClient {
  Future<int> save(ProductForm productForm) async {
    String token = await getToken();
    final String employeeJson = jsonEncode(productForm.toJson());
    final Response response = await webClient.post(urlProduct,
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
