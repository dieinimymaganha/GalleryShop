import 'package:galleryshopcustomers/http/webclients/webclient_client.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:galleryshopcustomers/models/employee.dart';
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
}
