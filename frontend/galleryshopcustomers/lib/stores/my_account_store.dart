import 'package:galleryshopcustomers/http/webclients/webclient_client.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_account_store.g.dart';

class MyAccountStore = _MyAccountStore with _$MyAccountStore;

abstract class _MyAccountStore with Store {
  ClientWebClient clientWebClient = ClientWebClient();

  @observable
  ClientDto clienteDto = ClientDto();

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
}
