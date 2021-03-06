// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<bool> _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_LoginStore.isPhoneValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
          .value;

  final _$clienteDtoAtom = Atom(name: '_LoginStore.clienteDto');

  @override
  ClientDto get clienteDto {
    _$clienteDtoAtom.reportRead();
    return super.clienteDto;
  }

  @override
  set clienteDto(ClientDto value) {
    _$clienteDtoAtom.reportWrite(value, super.clienteDto, () {
      super.clienteDto = value;
    });
  }

  final _$phoneAtom = Atom(name: '_LoginStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$obscureAtom = Atom(name: '_LoginStore.obscure');

  @override
  bool get obscure {
    _$obscureAtom.reportRead();
    return super.obscure;
  }

  @override
  set obscure(bool value) {
    _$obscureAtom.reportWrite(value, super.obscure, () {
      super.obscure = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_LoginStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$errorLoginAtom = Atom(name: '_LoginStore.errorLogin');

  @override
  bool get errorLogin {
    _$errorLoginAtom.reportRead();
    return super.errorLogin;
  }

  @override
  set errorLogin(bool value) {
    _$errorLoginAtom.reportWrite(value, super.errorLogin, () {
      super.errorLogin = value;
    });
  }

  final _$phoneNumberLoginAtom = Atom(name: '_LoginStore.phoneNumberLogin');

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

  final _$nickNameLoginAtom = Atom(name: '_LoginStore.nickNameLogin');

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

  final _$forbiddenAtom = Atom(name: '_LoginStore.forbidden');

  @override
  bool get forbidden {
    _$forbiddenAtom.reportRead();
    return super.forbidden;
  }

  @override
  set forbidden(bool value) {
    _$forbiddenAtom.reportWrite(value, super.forbidden, () {
      super.forbidden = value;
    });
  }

  final _$notFoundAtom = Atom(name: '_LoginStore.notFound');

  @override
  bool get notFound {
    _$notFoundAtom.reportRead();
    return super.notFound;
  }

  @override
  set notFound(bool value) {
    _$notFoundAtom.reportWrite(value, super.notFound, () {
      super.notFound = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$setPhoneNumberLoginAsyncAction =
      AsyncAction('_LoginStore.setPhoneNumberLogin');

  @override
  Future<void> setPhoneNumberLogin() {
    return _$setPhoneNumberLoginAsyncAction
        .run(() => super.setPhoneNumberLogin());
  }

  final _$getPhoneNumberAsyncAction = AsyncAction('_LoginStore.getPhoneNumber');

  @override
  Future<String> getPhoneNumber() {
    return _$getPhoneNumberAsyncAction.run(() => super.getPhoneNumber());
  }

  final _$getClientAsyncAction = AsyncAction('_LoginStore.getClient');

  @override
  Future<void> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setObscure() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clienteDto: ${clienteDto},
phone: ${phone},
password: ${password},
obscure: ${obscure},
loading: ${loading},
loggedIn: ${loggedIn},
errorLogin: ${errorLogin},
phoneNumberLogin: ${phoneNumberLogin},
nickNameLogin: ${nickNameLogin},
forbidden: ${forbidden},
notFound: ${notFound},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
loginPressed: ${loginPressed}
    ''';
  }
}
