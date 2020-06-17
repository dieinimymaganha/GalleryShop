import 'package:flutter/cupertino.dart';

class LoginModel {
  String phoneNumber;
  String password;

  LoginModel({@required this.phoneNumber,@required this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}
