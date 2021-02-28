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
buttonLogoutPressed: ${buttonLogoutPressed}
    ''';
  }
}
