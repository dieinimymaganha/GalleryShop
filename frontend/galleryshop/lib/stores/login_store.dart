import 'package:galleryshop/http/webclients/webclient_login.dart';
import 'package:galleryshop/models/login.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isPhoneValid => phone.length > 6;

  @observable
  bool forbidden = false;

  @observable
  bool notFound = false;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    final LoginModel loginModel =
        LoginModel(phoneNumber: phone, password: password);

    try {
      Response response = await _webClient.sendUser(loginModel);
      if (response.statusCode == 200) {
        loggedIn = true;
      } else if (response.statusCode == 400) {
        notFound = true;
      }
    } on Exception catch (_) {
      errorLogin = true;
    }

    await Future.delayed(Duration(seconds: 2));
    errorLogin = false;
    notFound = false;
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('idEmployee');
    loading = false;
  }

  @computed
  Function get loginPressed =>
      (isPhoneValid && isPasswordValid && !loading) ? login : null;
}
