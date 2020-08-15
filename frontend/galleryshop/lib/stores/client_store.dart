import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/http/webclients/webclient_client.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/profile.dart';
import 'package:mobx/mobx.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore with Store {
  ClientWebClient webClient = ClientWebClient();

  _ClientStore() {
    autorun((_) {
      print('phoneNumber >>> $phoneNumber');
    });
  }

  @observable
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @observable
  String name = '';

  @observable
  TextEditingController controllerFieldName = TextEditingController();

  @action
  void setName(String value) => name = value;

  @observable
  String lastName = '';

  @observable
  TextEditingController controllerFieldLastName = TextEditingController();

  @action
  void setLastName(String value) => lastName = value;

  @observable
  String nickname = '';

  @action
  void setNickName(String value) => nickname = value;

  @observable
  TextEditingController controllerFieldNickName = TextEditingController();

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  MaskedTextController controllerFieldCpf =
      MaskedTextController(mask: '000.000.000-00');

  @observable
  String birthDate = '';

  @observable
  TextEditingController controllerFieldBirthDate = TextEditingController();

  @action
  void setBirthDate(String value) => birthDate = value;

  @action
  void setBirthDateController(String value) =>
      controllerFieldBirthDate.text = value;

  @observable
  String phoneNumber = '';

  @observable
  MaskedTextController controllerFieldPhoneNumber =
      MaskedTextController(mask: '(000) 00000-0000');

  @action
  void setPhoneNumber(String value) => phoneNumber = value;

  @observable
  String email = '';

  @observable
  TextEditingController controllerFieldEmail = TextEditingController();

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get nameIsValid => name.isNotEmpty;

  @computed
  bool get lastNameIsValid => lastName.isNotEmpty;

  @computed
  bool get nickNameIsValid => nickname.isNotEmpty;

  @computed
  bool get birthDateIsValid => birthDate.isNotEmpty;

  @computed
  bool get phoneNumberIsValid => phoneNumber.isNotEmpty;

  @computed
  bool get cpfIsValid => cpf.isNotEmpty;

  @computed
  bool get emailIsValid => email.contains('.com');

  @computed
  bool get fieldIsValid =>
      nameIsValid &&
      lastNameIsValid &&
      nickNameIsValid &&
      birthDateIsValid &&
      phoneNumberIsValid &&
      cpfIsValid &&
      emailIsValid;

  @observable
  bool sending = false;
  @observable
  bool created = false;
  @observable
  bool duplicate = false;
  @observable
  bool errorSending = false;

  @action
  Future<void> saveClient() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    final listProfiles = new List<ListProfiles>();
    final String role = 'ROLE_EMPLOYEE';
    listProfiles.add(new ListProfiles(role: role));
    ClientForm clientForm = ClientForm(
        name: name,
        lastName: lastName,
        nickname: nickname,
        cpf: cpf,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        email: email,
        password: 'galleryShop',
        listProfiles: listProfiles);

    int response = await webClient.save(clientForm);

    if (response == 201) {
      created = true;
    } else if (response == 409) {
      duplicate = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;
  }

  @computed
  Function get buttomSavePressed => fieldIsValid ? saveClient : null;

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  List<dynamic> listClient = List();

  @action
  Future<void> setList() async {
    loading = true;
//    await Future.delayed(Duration(seconds: 2));
    try {
      listClient = await webClient.findAll();
      listClient.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
      if (listClient.isEmpty) {
        errorList = true;
        listEmpty = true;
        loading = false;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    loading = false;
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    setList();
  }
}
