import 'package:collection/equality.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:mobx/mobx.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  final EmployeeModel employeeModel;

  TypeEmployeeWebClient _webClientTypeEmployee = TypeEmployeeWebClient();
  EmployeeWebClient _webClientEmployee = EmployeeWebClient();

  _EmployeeStore({this.employeeModel}) {
    autorun((_) {
      print('excludedFail ----> $excludedFail');
//      print('lastName ----> $lastName');
//      print('nickname ----> $nickname');
//      print('cpf ----> $cpf');//      print('rg ----> $rg');
//      print('birthDate ----> $birthDate');
//      print('comissionRate ----> $comissionRate');
//      print('phoneNumber ----> $phoneNumber');
    });
  }

  @observable
  List<dynamic> dataTypeEmployee = List();

  @observable
  List<dynamic> dataTypeEmployeeOld = List();

  @observable
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void getServices() async {
    dataTypeEmployee = await _webClientTypeEmployee.findAll();
    dataTypeEmployee.sort(
        (a, b) => a.description.toString().compareTo(b.description.toString()));

    dataTypeEmployeeOld = await _webClientTypeEmployee.findAll();
    dataTypeEmployeeOld.sort(
        (a, b) => a.description.toString().compareTo(b.description.toString()));

    loadingTypeEmployee = true;
  }

  void saveNew() async {
    dataTypeEmployeeOld = await _webClientTypeEmployee.findAll();
    dataTypeEmployeeOld.sort(
        (a, b) => a.description.toString().compareTo(b.description.toString()));
  }

  @observable
  EmployeeForm employeeCreated;

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
  MaskedTextController controllerFieldCpf =
      MaskedTextController(mask: '000.000.000-00');

  @observable
  String birthDate = '';

  @observable
  TextEditingController controllerFieldBirthDate = TextEditingController();

  @action
  void setBirthDate(String value) => birthDate = value;

  @action
  void setBirthDateController(String value) =>
      controllerFieldBirthDate.text = value;

  @observable
  String phoneNumber = '';

  @observable
  MaskedTextController controllerFieldPhoneNumber =
      MaskedTextController(mask: '(000) 00000-0000');

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
  Future<String> validaTeste(String value) async {
    if (comissionRate == null) {
      return 'Campo obrigatório';
    } else if (comissionRate != null) {
      try {
        return 'valido';
      } on Exception catch (_) {
        return 'Somente números, sem dígitos';
      }
    }
    return null;
  }

  @observable
  bool sending = false;

  @observable
  bool errorSending = false;

  @observable
  bool duplicate = false;

  @observable
  bool created = false;

  @action
  void setComissionRate(String value) {
    if (value.isEmpty) {
      comissionRate = null;
    }
    comissionRate = int.parse(value);
  }

  @observable
  TextEditingController controllerFieldComissionRate = TextEditingController();

  @observable
  String password;

  @observable
  TextEditingController controllerFieldPassword = TextEditingController();

  @observable
  bool loadingTypeEmployee = false;

  @action
  Future<void> saveEmployee() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    await createNewEmployee();
    await sendNewEmployee(employeeCreated);
  }

  @action
  Future<void> sendNewEmployee(EmployeeForm employeeForm) async {
    int response = await _webClientEmployee.save(employeeForm);
    if (response == 201) {
      created = true;
    } else if (response == 409) {
      duplicate = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;
  }

  void createNewEmployee() {
    List<dynamic> newDataTypeEmployee = List();
    newDataTypeEmployee =
        dataTypeEmployee.where((element) => element.select == true).toList();

    List<ListTypeEmployees> listTypeEmployee = List();

    newDataTypeEmployee.forEach((element) {
      ListTypeEmployees employeeSelect =
          ListTypeEmployees(description: element.description);
      listTypeEmployee.add(employeeSelect);
    });

    final listProfiles = new List<ListProfiles>();
    final String role = 'ROLE_EMPLOYEE';
    listProfiles.add(new ListProfiles(role: role));

    employeeCreated = EmployeeForm(
      name: name,
      lastName: lastName,
      nickname: nickname,
      birthDate: birthDate,
      phoneNumber: phoneNumber,
      rg: rg,
      cpf: cpf,
      commissionRate: comissionRate,
      password: 'galleryShop',
      listProfiles: listProfiles,
      listTypeEmployees: listTypeEmployee,
    );
  }

  @computed
  bool get nameIsValid => name.isNotEmpty;

  @computed
  bool get lastNameIsValid => lastName.isNotEmpty;

  @computed
  bool get nickNameIsValid => nickname.isNotEmpty;

  @computed
  bool get birthDateIsValid => birthDate.isNotEmpty;

  @computed
  bool get phoneNumberIsValid => phoneNumber.isNotEmpty;

  @computed
  bool get rgIsValid => rg.isNotEmpty;

  @computed
  bool get cpfIsValid => cpf.isNotEmpty;

  @computed
  bool get comissionRateIsValid => comissionRate != null;

  @computed
  bool get fieldIsValid =>
      nameIsValid &&
      lastNameIsValid &&
      nickNameIsValid &&
      birthDateIsValid &&
      phoneNumberIsValid &&
      rgIsValid &&
      cpfIsValid &&
      comissionRateIsValid;

  @computed
  Function get buttonSavePressed => fieldIsValid ? saveEmployee : null;

  @computed
  Function get buttomExcludePressed => excludeEmployee;

  @observable
  bool excluded = false;

  @observable
  bool excludedFail = false;

  @action
  Future<void> excludeEmployee() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response = await _webClientEmployee.exclude(employeeModel);
    if (response == 200) {
      excluded = true;
      await Future.delayed(Duration(seconds: 2));
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      excludedFail = false;
      sending = false;
    }
  }
}
