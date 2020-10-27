import 'package:galleryshopcustomers/http/webclients/webclient_client.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_login.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:galleryshopcustomers/models/login.dart';
import 'package:galleryshopcustomers/models/token.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginWebClient _webClient = LoginWebClient();

  ClientWebClient clientWebClient = ClientWebClient();

  _LoginStore() {
    autorun((_) {
      print('phoneNumberLogin : $phoneNumberLogin');
    });
  }

  @observable
  ClientDto clienteDto = ClientDto();

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

  @observable
  String phoneNumberLogin = '';

  @observable
  String nickNameLogin = '';

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
      setPhoneNumberLogin();
    } else {
      errorLogin = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorLogin = false;
  }

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    await getClient();
  }

  Future<TokenModel> send(LoginModel loginModel) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('idClient');
    await prefs.remove('phoneNumber');

    final TokenModel tokenModel =
        await _webClient.sendUser(loginModel).catchError((e) {
      loggedIn = false;
      errorLogin = true;
      loading = false;
    });

    return tokenModel;
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @action
  Future<void> getClient() async {
    clienteDto = await clientWebClient.findPhoneNumber(phoneNumberLogin);
    var prefs = await SharedPreferences.getInstance();
    if (clienteDto != null) {
      prefs.setInt("idClient", clienteDto.id);
      prefs.setString("nickName", clienteDto.nickname);
    }
  }

  @computed
  Function get loginPressed =>
      (isPhoneValid && isPasswordValid && !loading) ? login : null;
}
