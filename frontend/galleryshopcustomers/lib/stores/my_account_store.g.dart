// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAccountStore on _MyAccountStore, Store {
  Computed<Function> _$buttonLogoutPressedComputed;

  @override
  Function get buttonLogoutPressed => (_$buttonLogoutPressedComputed ??=
          Computed<Function>(() => super.buttonLogoutPressed,
              name: '_MyAccountStore.buttonLogoutPressed'))
      .value;
  Computed<bool> _$isPasswordFirstValidComputed;

  @override
  bool get isPasswordFirstValid => (_$isPasswordFirstValidComputed ??=
          Computed<bool>(() => super.isPasswordFirstValid,
              name: '_MyAccountStore.isPasswordFirstValid'))
      .value;
  Computed<bool> _$isPasswordSecondValidComputed;

  @override
  bool get isPasswordSecondValid => (_$isPasswordSecondValidComputed ??=
          Computed<bool>(() => super.isPasswordSecondValid,
              name: '_MyAccountStore.isPasswordSecondValid'))
      .value;
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_MyAccountStore.fieldsValid'))
          .value;
  Computed<bool> _$identicalComputed;

  @override
  bool get identical =>
      (_$identicalComputed ??= Computed<bool>(() => super.identical,
              name: '_MyAccountStore.identical'))
          .value;
  Computed<Function> _$buttonSavePressedComputed;

  @override
  Function get buttonSavePressed => (_$buttonSavePressedComputed ??=
          Computed<Function>(() => super.buttonSavePressed,
              name: '_MyAccountStore.buttonSavePressed'))
      .value;

  final _$clientDtoAtom = Atom(name: '_MyAccountStore.clientDto');

  @override
  ClientDto get clientDto {
    _$clientDtoAtom.reportRead();
    return super.clientDto;
  }

  @override
  set clientDto(ClientDto value) {
    _$clientDtoAtom.reportWrite(value, super.clientDto, () {
      super.clientDto = value;
    });
  }

  final _$phoneNumberLoginAtom = Atom(name: '_MyAccountStore.phoneNumberLogin');

  @override
  String get phoneNumberLogin {
    _$phoneNumberLoginAtom.reportRead();
    return super.phoneNumberLogin;
  }

  @override
  set phoneNumberLogin(String value) {
    _$phoneNumberLoginAtom.reportWrite(value, super.phoneNumberLogin, () {
      super.phoneNumberLogin = value;
    });
  }

  final _$nickNameLoginAtom = Atom(name: '_MyAccountStore.nickNameLogin');

  @override
  String get nickNameLogin {
    _$nickNameLoginAtom.reportRead();
    return super.nickNameLogin;
  }

  @override
  set nickNameLogin(String value) {
    _$nickNameLoginAtom.reportWrite(value, super.nickNameLogin, () {
      super.nickNameLogin = value;
    });
  }

  final _$idClientAtom = Atom(name: '_MyAccountStore.idClient');

  @override
  int get idClient {
    _$idClientAtom.reportRead();
    return super.idClient;
  }

  @override
  set idClient(int value) {
    _$idClientAtom.reportWrite(value, super.idClient, () {
      super.idClient = value;
    });
  }

  final _$loadingPageAtom = Atom(name: '_MyAccountStore.loadingPage');

  @override
  bool get loadingPage {
    _$loadingPageAtom.reportRead();
    return super.loadingPage;
  }

  @override
  set loadingPage(bool value) {
    _$loadingPageAtom.reportWrite(value, super.loadingPage, () {
      super.loadingPage = value;
    });
  }

  final _$logoutAtom = Atom(name: '_MyAccountStore.logout');

  @override
  bool get logout {
    _$logoutAtom.reportRead();
    return super.logout;
  }

  @override
  set logout(bool value) {
    _$logoutAtom.reportWrite(value, super.logout, () {
      super.logout = value;
    });
  }

  final _$logoutOKAtom = Atom(name: '_MyAccountStore.logoutOK');

  @override
  bool get logoutOK {
    _$logoutOKAtom.reportRead();
    return super.logoutOK;
  }

  @override
  set logoutOK(bool value) {
    _$logoutOKAtom.reportWrite(value, super.logoutOK, () {
      super.logoutOK = value;
    });
  }

  final _$formStateAtom = Atom(name: '_MyAccountStore.formState');

  @override
  GlobalKey<FormState> get formState {
    _$formStateAtom.reportRead();
    return super.formState;
  }

  @override
  set formState(GlobalKey<FormState> value) {
    _$formStateAtom.reportWrite(value, super.formState, () {
      super.formState = value;
    });
  }

  final _$alterOKAtom = Atom(name: '_MyAccountStore.alterOK');

  @override
  bool get alterOK {
    _$alterOKAtom.reportRead();
    return super.alterOK;
  }

  @override
  set alterOK(bool value) {
    _$alterOKAtom.reportWrite(value, super.alterOK, () {
      super.alterOK = value;
    });
  }

  final _$errorAtom = Atom(name: '_MyAccountStore.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$updatePassWordFormAtom =
      Atom(name: '_MyAccountStore.updatePassWordForm');

  @override
  UpdatePassWordForm get updatePassWordForm {
    _$updatePassWordFormAtom.reportRead();
    return super.updatePassWordForm;
  }

  @override
  set updatePassWordForm(UpdatePassWordForm value) {
    _$updatePassWordFormAtom.reportWrite(value, super.updatePassWordForm, () {
      super.updatePassWordForm = value;
    });
  }

  final _$sendingAtom = Atom(name: '_MyAccountStore.sending');

  @override
  bool get sending {
    _$sendingAtom.reportRead();
    return super.sending;
  }

  @override
  set sending(bool value) {
    _$sendingAtom.reportWrite(value, super.sending, () {
      super.sending = value;
    });
  }

  final _$controllerFirstPassAtom =
      Atom(name: '_MyAccountStore.controllerFirstPass');

  @override
  TextEditingController get controllerFirstPass {
    _$controllerFirstPassAtom.reportRead();
    return super.controllerFirstPass;
  }

  @override
  set controllerFirstPass(TextEditingController value) {
    _$controllerFirstPassAtom.reportWrite(value, super.controllerFirstPass, () {
      super.controllerFirstPass = value;
    });
  }

  final _$firstPassAtom = Atom(name: '_MyAccountStore.firstPass');

  @override
  String get firstPass {
    _$firstPassAtom.reportRead();
    return super.firstPass;
  }

  @override
  set firstPass(String value) {
    _$firstPassAtom.reportWrite(value, super.firstPass, () {
      super.firstPass = value;
    });
  }

  final _$controllerSecondPassAtom =
      Atom(name: '_MyAccountStore.controllerSecondPass');

  @override
  TextEditingController get controllerSecondPass {
    _$controllerSecondPassAtom.reportRead();
    return super.controllerSecondPass;
  }

  @override
  set controllerSecondPass(TextEditingController value) {
    _$controllerSecondPassAtom.reportWrite(value, super.controllerSecondPass,
        () {
      super.controllerSecondPass = value;
    });
  }

  final _$secondPassAtom = Atom(name: '_MyAccountStore.secondPass');

  @override
  String get secondPass {
    _$secondPassAtom.reportRead();
    return super.secondPass;
  }

  @override
  set secondPass(String value) {
    _$secondPassAtom.reportWrite(value, super.secondPass, () {
      super.secondPass = value;
    });
  }

  final _$obscureFirstAtom = Atom(name: '_MyAccountStore.obscureFirst');

  @override
  bool get obscureFirst {
    _$obscureFirstAtom.reportRead();
    return super.obscureFirst;
  }

  @override
  set obscureFirst(bool value) {
    _$obscureFirstAtom.reportWrite(value, super.obscureFirst, () {
      super.obscureFirst = value;
    });
  }

  final _$obscureSecondAtom = Atom(name: '_MyAccountStore.obscureSecond');

  @override
  bool get obscureSecond {
    _$obscureSecondAtom.reportRead();
    return super.obscureSecond;
  }

  @override
  set obscureSecond(bool value) {
    _$obscureSecondAtom.reportWrite(value, super.obscureSecond, () {
      super.obscureSecond = value;
    });
  }

  final _$setPhoneNumberLoginAsyncAction =
      AsyncAction('_MyAccountStore.setPhoneNumberLogin');

  @override
  Future<void> setPhoneNumberLogin() {
    return _$setPhoneNumberLoginAsyncAction
        .run(() => super.setPhoneNumberLogin());
  }

  final _$getPhoneNumberAsyncAction =
      AsyncAction('_MyAccountStore.getPhoneNumber');

  @override
  Future<String> getPhoneNumber() {
    return _$getPhoneNumberAsyncAction.run(() => super.getPhoneNumber());
  }

  final _$getIdClientAsyncAction = AsyncAction('_MyAccountStore.getIdClient');

  @override
  Future<int> getIdClient() {
    return _$getIdClientAsyncAction.run(() => super.getIdClient());
  }

  final _$getNickNameAsyncAction = AsyncAction('_MyAccountStore.getNickName');

  @override
  Future<String> getNickName() {
    return _$getNickNameAsyncAction.run(() => super.getNickName());
  }

  final _$getClientAsyncAction = AsyncAction('_MyAccountStore.getClient');

  @override
  Future<void> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$exitAppAsyncAction = AsyncAction('_MyAccountStore.exitApp');

  @override
  Future<void> exitApp() {
    return _$exitAppAsyncAction.run(() => super.exitApp());
  }

  final _$alterPassAsyncAction = AsyncAction('_MyAccountStore.alterPass');

  @override
  Future<void> alterPass() {
    return _$alterPassAsyncAction.run(() => super.alterPass());
  }

  final _$_MyAccountStoreActionController =
      ActionController(name: '_MyAccountStore');

  @override
  void setFirst(String value) {
    final _$actionInfo = _$_MyAccountStoreActionController.startAction(
        name: '_MyAccountStore.setFirst');
    try {
      return super.setFirst(value);
    } finally {
      _$_MyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondPass(String value) {
    final _$actionInfo = _$_MyAccountStoreActionController.startAction(
        name: '_MyAccountStore.setSecondPass');
    try {
      return super.setSecondPass(value);
    } finally {
      _$_MyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureFirst() {
    final _$actionInfo = _$_MyAccountStoreActionController.startAction(
        name: '_MyAccountStore.setObscureFirst');
    try {
      return super.setObscureFirst();
    } finally {
      _$_MyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureSecond() {
    final _$actionInfo = _$_MyAccountStoreActionController.startAction(
        name: '_MyAccountStore.setObscureSecond');
    try {
      return super.setObscureSecond();
    } finally {
      _$_MyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientDto: ${clientDto},
phoneNumberLogin: ${phoneNumberLogin},
nickNameLogin: ${nickNameLogin},
idClient: ${idClient},
loadingPage: ${loadingPage},
logout: ${logout},
logoutOK: ${logoutOK},
formState: ${formState},
alterOK: ${alterOK},
error: ${error},
updatePassWordForm: ${updatePassWordForm},
sending: ${sending},
controllerFirstPass: ${controllerFirstPass},
firstPass: ${firstPass},
controllerSecondPass: ${controllerSecondPass},
secondPass: ${secondPass},
obscureFirst: ${obscureFirst},
obscureSecond: ${obscureSecond},
buttonLogoutPressed: ${buttonLogoutPressed},
isPasswordFirstValid: ${isPasswordFirstValid},
isPasswordSecondValid: ${isPasswordSecondValid},
fieldsValid: ${fieldsValid},
identical: ${identical},
buttonSavePressed: ${buttonSavePressed}
    ''';
  }
}
