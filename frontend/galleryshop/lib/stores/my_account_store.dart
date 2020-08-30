import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_account_store.g.dart';

class MyAccountStore = _MyAccountStore with _$MyAccountStore;

abstract class _MyAccountStore with Store {
  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  _MyAccountStore() {
    autorun((_) {
      print('phoneNumberLogin >>> $phoneNumberLogin');
    });
  }

  @observable
  String phoneNumberLogin = '';

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }
}
