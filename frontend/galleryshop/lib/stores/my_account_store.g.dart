// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAccountStore on _MyAccountStore, Store {
  final _$employeeDtoAtom = Atom(name: '_MyAccountStore.employeeDto');

  @override
  EmployeeDto get employeeDto {
    _$employeeDtoAtom.reportRead();
    return super.employeeDto;
  }

  @override
  set employeeDto(EmployeeDto value) {
    _$employeeDtoAtom.reportWrite(value, super.employeeDto, () {
      super.employeeDto = value;
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

  final _$getNickNameAsyncAction = AsyncAction('_MyAccountStore.getNickName');

  @override
  Future<String> getNickName() {
    return _$getNickNameAsyncAction.run(() => super.getNickName());
  }

  @override
  String toString() {
    return '''
employeeDto: ${employeeDto},
phoneNumberLogin: ${phoneNumberLogin},
nickNameLogin: ${nickNameLogin}
    ''';
  }
}
