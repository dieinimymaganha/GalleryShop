import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_login.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/models/login.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginWebClient _webClient = LoginWebClient();

  _LoginStore() {
    autorun((_) {});
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

  @observable
  String phoneNumberLogin = '';

  @action
  Future<void> login() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('idEmployee');
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
        if (employeeDto != null) {
          loggedIn = true;
        } else {
          forbidden = true;
        }
      } else if (response.statusCode == 403) {
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

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    await getEmployee();
  }

  @observable
  EmployeeDto employeeDto;

  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  @action
  Future<void> getEmployee() async {
    try {
      employeeDto = await employeeWebClient.findPhoneNumber(phoneNumberLogin);
      var prefs = await SharedPreferences.getInstance();
      if (employeeDto != null) {
        prefs.setInt("idEmployee", employeeDto.id);
        prefs.setString("nickName", employeeDto.nickname);
      }
    } on Exception catch (_) {
      employeeDto = null;
    }
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @computed
  Function get loginPressed =>
      (isPhoneValid && isPasswordValid && !loading) ? login : null;
}
