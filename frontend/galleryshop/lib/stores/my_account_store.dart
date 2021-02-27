import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_my_account.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/models/my_account.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_account_store.g.dart';

class MyAccountStore = _MyAccountStore with _$MyAccountStore;

abstract class _MyAccountStore with Store {
  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  @observable
  EmployeeDto employeeDto;

  _MyAccountStore() {
    autorun((_) {
      print('isPasswordFirstValid >>> $isPasswordFirstValid');
      print('isPasswordSecondValid >>> $isPasswordSecondValid');
    });
  }

  MyAccountWebClient myAccountWebClient = MyAccountWebClient();

  @observable
  bool loadingPage = false;

  @observable
  bool obscureFirst = false;

  @observable
  bool obscureSecond = false;

  @action
  void setObscureFirst() => obscureFirst = !obscureFirst;

  @action
  void setObscureSecond() => obscureSecond = !obscureSecond;

  @observable
  UpdatePassWordForm updatePassWordForm;

  @observable
  String phoneNumberLogin = '';

  @observable
  String nickNameLogin = '';

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    nickNameLogin = await getNickName();
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @action
  Future<void> getEmployee() async {
    loadingPage = true;
    await setPhoneNumberLogin();
    employeeDto = await employeeWebClient.findPhoneNumber(phoneNumberLogin);
    loadingPage = false;
  }

  @action
  Future<String> getNickName() async {
    var prefs = await SharedPreferences.getInstance();
    String nickName = (prefs.getString("nickName") ?? "");
    return nickName;
  }

  @observable
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @observable
  bool sending = false;

  @observable
  TextEditingController controllerFirstPass = TextEditingController();

  @observable
  String firstPass = '';

  @action
  void setFirst(String value) => firstPass = value;

  @observable
  TextEditingController controllerSecondPass = TextEditingController();

  @observable
  String secondPass = '';

  @action
  void setSecondPass(String value) => secondPass = value;

  @computed
  bool get isPasswordFirstValid => firstPass.length >= 6;

  @computed
  bool get isPasswordSecondValid => secondPass.length >= 6;

  @computed
  bool get fieldsValid =>
      isPasswordFirstValid && isPasswordSecondValid && identical;

  @computed
  bool get identical => firstPass == secondPass;

  @computed
  Function get buttonSavePressed => fieldsValid ? alterPass : null;

  @observable
  bool alterOK = false;

  @observable
  bool error = false;

  @action
  Future<void> alterPass() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    updatePassWordForm =
        UpdatePassWordForm(phoneNumber: phoneNumberLogin, password: secondPass);
    print(updatePassWordForm.toJson());
    try {
//    int response = await myAccountWebClient.update(updatePassWordForm);
      int response = 1;
      if (response == 200) {
        alterOK = true;
      } else {
        error = true;
      }
    } on Exception catch (_) {
      error = true;
    }

    await Future.delayed(Duration(seconds: 2));
    alterOK = false;
    error = false;
  }
}
