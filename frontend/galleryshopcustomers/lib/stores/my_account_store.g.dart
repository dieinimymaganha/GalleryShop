// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAccountStore on _MyAccountStore, Store {
  final _$clienteDtoAtom = Atom(name: '_MyAccountStore.clienteDto');

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

  final _$getClientAsyncAction = AsyncAction('_MyAccountStore.getClient');

  @override
  Future<EmployeeDto> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  @override
  String toString() {
    return '''
clienteDto: ${clienteDto},
phoneNumberLogin: ${phoneNumberLogin},
nickNameLogin: ${nickNameLogin}
    ''';
  }
}
