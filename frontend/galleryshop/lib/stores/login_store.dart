import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
//      print(isFormValid);
      print(loading);
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

  @action
  void setObscure() => obscure = !obscure;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;

  }

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isPhoneValid => phone.length >6;


  @computed
  bool get isFormValid => isPhoneValid && isPasswordValid;
}
