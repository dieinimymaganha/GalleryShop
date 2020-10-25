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
      print('nickNameLogin >>> $nickNameLogin');
    });
  }

  @observable
  String phoneNumberLogin = '';

  @observable
  String nickNameLogin = '';

  @action
  Future<void> setPhoneNumberLogin() async {
    phoneNumberLogin = await getPhoneNumber();
    await getEmployee();
    nickNameLogin = await getNickName();
  }

  @action
  Future<String> getPhoneNumber() async {
    var prefs = await SharedPreferences.getInstance();
    String phoneNumber = (prefs.getString("phoneNumber") ?? "");
    return phoneNumber;
  }

  @action
  Future<String> getNickName() async {
    var prefs = await SharedPreferences.getInstance();
    String nickName = (prefs.getString("nickName") ?? "");
    return nickName;
  }

  @action
  Future<EmployeeDto> getEmployee() async {
    employeeDto = await employeeWebClient.findPhoneNumber(phoneNumberLogin);
    var prefs = await SharedPreferences.getInstance();
    if (employeeDto != null) {
      prefs.setInt("idEmployee", employeeDto.id);
      prefs.setString("nickName", employeeDto.nickname);
    }
  }
}
