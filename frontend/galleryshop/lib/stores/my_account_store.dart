import 'package:galleryshop/http/WebClient.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_account_store.g.dart';

class MyAccountStore = _MyAccountStore with _$MyAccountStore;

abstract class _MyAccountStore with Store {
  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  @observable
  EmployeeDto employeeDto = EmployeeDto();

  _MyAccountStore() {
    autorun((_) {
      print('phoneNumberLogin >>> $phoneNumberLogin');
      print('employeeDto >>> ${employeeDto.toString()}');
    });
  }

  @observable
  String phoneNumberLogin = '';

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    await getEmployee();
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @action
  Future<EmployeeDto> getEmployee() async {
    employeeDto = await employeeWebClient.findPhoneNumber(phoneNumberLogin);
  }
}
