// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$saveAsyncAction = AsyncAction('_LoginStore.save');

  @override
  Future<void> save(LoginModel loginCreated) {
    return _$saveAsyncAction.run(() => super.save(loginCreated));
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
phone: ${phone},
password: ${password},
obscure: ${obscure},
loading: ${loading},
loggedIn: ${loggedIn},
errorLogin: ${errorLogin},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
loginPressed: ${loginPressed}
    ''';
  }
}
