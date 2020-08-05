import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  TypeEmployeeWebClient _webClientTypeEmployee = TypeEmployeeWebClient();

  _EmployeeStore() {
    autorun((_) {
      print('name ----> $name');
      print('lastName ----> $lastName');
      print('nickname ----> $nickname');
      print('cpf ----> $cpf');
      print('rg ----> $rg');
      print('birthDate ----> $birthDate');
      print('comissionRate ----> $comissionRate');
      print('phoneNumber ----> $phoneNumber');
    });
  }

  @observable
  List<dynamic> dataTypeEmployee = List();

  void getServices() async {
    dataTypeEmployee = await _webClientTypeEmployee.findAll();
    loadingTypeEmployee = true;
  }

  @observable
  String name = '';

  @observable
  TextEditingController controllerFieldName = TextEditingController();

  @action
  void setName(String value) => name = value;

  @observable
  String lastName = '';

  @observable
  TextEditingController controllerFieldLastName = TextEditingController();

  @action
  void setLastName(String value) => lastName = value;

  @observable
  String nickname = '';

  @action
  void setNickName(String value) => nickname = value;

  @observable
  TextEditingController controllerFieldNickName = TextEditingController();

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  TextEditingController controllerFieldCpf = TextEditingController();

  @observable
  String birthDate = '';

  @observable
  TextEditingController controllerFieldBirthDate = TextEditingController();

  @action
  void setBirthDate(String value) => birthDate = value;

  @observable
  String phoneNumber = '';


  @observable
  TextEditingController controllerFieldPhoneNumber = TextEditingController();

  @action
  void setPhoneNumber(String value) => phoneNumber = value;


  @observable
  String rg = '';

  @observable
  TextEditingController controllerFieldRg = TextEditingController();

  @action
  void setRg(String value) => rg = value;


  @observable
  int comissionRate;

  @action
  void setComissionRate(String value) => comissionRate = int.parse(value);


  @observable
  TextEditingController controllerFieldComissionRate = TextEditingController();

  @observable
  String password;

  @observable
  TextEditingController controllerFieldPassword = TextEditingController();

  @observable
  bool loadingTypeEmployee = false;


}
