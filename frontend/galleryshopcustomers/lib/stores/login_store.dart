import 'package:galleryshopcustomers/http/webclients/webclient_client.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_login.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:galleryshopcustomers/models/login.dart';
import 'package:galleryshopcustomers/models/token.dart';
import 'package:http/http.dart';
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

  @observable
  bool forbidden = false;

  @observable
  bool notFound = true;

  @action
  Future<void> login() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('idClient');
    await prefs.remove('phoneNumber');
    await prefs.remove('nickName');
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    final LoginModel loginModel =
        LoginModel(phoneNumber: phone, password: password);
    try {
      Response response = await _webClient.sendUser(loginModel);
      if (response.statusCode == 200) {
        await setPhoneNumberLogin();
        if (clienteDto != null) {
          loggedIn = true;
        } else {
          forbidden = true;
        }
      } else if (response.statusCode == 400) {
        notFound = true;
      }
    } on Exception catch (_) {
      errorLogin = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorLogin = false;
    notFound = false;
    forbidden = false;
    loading = false;
  }

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isPhoneValid => phone.length > 6;

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    await getClient();
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @action
  Future<void> getClient() async {
    try {
      clienteDto = await clientWebClient.findPhoneNumber(phoneNumberLogin);
      var prefs = await SharedPreferences.getInstance();
      if (clienteDto != null) {
        prefs.setInt("idClient", clienteDto.id);
        prefs.setString("nickName", clienteDto.nickname);
      }
    } on Exception catch (_) {
      clienteDto = null;
    }
  }

  @computed
  Function get loginPressed =>
      (isPhoneValid && isPasswordValid && !loading) ? login : null;
}
