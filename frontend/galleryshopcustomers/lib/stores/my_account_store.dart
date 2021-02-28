import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_client.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_my_account.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:galleryshopcustomers/models/my_account.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_account_store.g.dart';

class MyAccountStore = _MyAccountStore with _$MyAccountStore;

abstract class _MyAccountStore with Store {
  ClientWebClient clientWebClient = ClientWebClient();

  @observable
  ClientDto clientDto;

  _MyAccountStore() {
    autorun((_) {
      print('nickNameLogin >>> $nickNameLogin');
    });
  }

  @observable
  String phoneNumberLogin = '';

  @observable
  String nickNameLogin = '';

  @observable
  int idClient;

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
  Future<int> getIdClient() async {
    var prefs = await SharedPreferences.getInstance();
    int client = (prefs.getInt("idClient") ?? "");
    return client;
  }

  @action
  Future<String> getNickName() async {
    var prefs = await SharedPreferences.getInstance();
    String nickName = (prefs.getString("nickName") ?? "");
    return nickName;
  }

  @observable
  bool loadingPage = false;

  @action
  Future<void> getClient() async {
    loadingPage = true;
    await setPhoneNumberLogin();
    clientDto = await clientWebClient.findPhoneNumber(phoneNumberLogin);
    loadingPage = false;
  }

  @observable
  bool logout = false;

  @observable
  bool logoutOK = false;

  @action
  Future<void> exitApp() async {
    logout = true;
    await Future.delayed(Duration(seconds: 2));
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('idClient');
    await prefs.remove('phoneNumber');
    await prefs.remove('nickName');
    logoutOK = true;
    await Future.delayed(Duration(seconds: 2));
    logout = false;
    logoutOK = false;
  }

  @computed
  Function get buttonLogoutPressed => exitApp;

  @observable
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @observable
  bool alterOK = false;

  @observable
  bool error = false;

  @observable
  UpdatePassWordForm updatePassWordForm;


  MyAccountWebClient myAccountWebClient = MyAccountWebClient();

  @action
  Future<void> alterPass() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    updatePassWordForm =
        UpdatePassWordForm(phoneNumber: phoneNumberLogin, password: secondPass);
    print(updatePassWordForm.toJson());
    try {
      int response = await myAccountWebClient.update(updatePassWordForm);
//      int response = 1;
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
  bool obscureFirst = false;

  @observable
  bool obscureSecond = false;

  @action
  void setObscureFirst() => obscureFirst = !obscureFirst;

  @action
  void setObscureSecond() => obscureSecond = !obscureSecond;
}
