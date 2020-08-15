import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_login.dart';
import 'package:galleryshop/models/login.dart';
import 'package:galleryshop/models/token.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginWebClient _webClient = LoginWebClient();

  _LoginStore() {
    autorun((_) {
      print('loading : $loading');
      print('loggedIn : $loggedIn');
      print("errorLogin : $errorLogin");
    });
  }

  @observable
  String phone = '';

  @observable
  String password = '';

  @observable
  bool obscure = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @observable
  bool errorLogin = false;

  @action
  void setObscure() => obscure = !obscure;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async {
    final LoginModel loginModel =
        LoginModel(phoneNumber: phone, password: password);
    await save(loginModel);
  }

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isPhoneValid => phone.length > 6;

  @action
  Future<void> save(LoginModel loginCreated) async {
    LoginModel loginModel = loginCreated;
    loading = true;
    await Future.delayed(Duration(seconds: 2));

    TokenModel tokenModel = await send(loginModel);

    if (tokenModel != null) {
      loggedIn = true;
    } else {
      errorLogin = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorLogin = false;
  }

  Future<TokenModel> send(LoginModel loginModel) async {
    final TokenModel tokenModel =
        await _webClient.sendUser(loginModel).catchError((e) {
      loggedIn = false;
      errorLogin = true;
      loading = false;
    });
    return tokenModel;
  }

  @computed
  Function get loginPressed =>
      (isPhoneValid && isPasswordValid && !loading) ? login : null;
}
