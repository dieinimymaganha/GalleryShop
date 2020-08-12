// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmployeeStore on _EmployeeStore, Store {
  Computed<Function> _$buttonChangePressedComputed;

  @override
  Function get buttonChangePressed => (_$buttonChangePressedComputed ??=
          Computed<Function>(() => super.buttonChangePressed,
              name: '_EmployeeStore.buttonChangePressed'))
      .value;
  Computed<bool> _$nameIsValidComputed;

  @override
  bool get nameIsValid =>
      (_$nameIsValidComputed ??= Computed<bool>(() => super.nameIsValid,
              name: '_EmployeeStore.nameIsValid'))
          .value;
  Computed<bool> _$lastNameIsValidComputed;

  @override
  bool get lastNameIsValid =>
      (_$lastNameIsValidComputed ??= Computed<bool>(() => super.lastNameIsValid,
              name: '_EmployeeStore.lastNameIsValid'))
          .value;
  Computed<bool> _$nickNameIsValidComputed;

  @override
  bool get nickNameIsValid =>
      (_$nickNameIsValidComputed ??= Computed<bool>(() => super.nickNameIsValid,
              name: '_EmployeeStore.nickNameIsValid'))
          .value;
  Computed<bool> _$birthDateIsValidComputed;

  @override
  bool get birthDateIsValid => (_$birthDateIsValidComputed ??= Computed<bool>(
          () => super.birthDateIsValid,
          name: '_EmployeeStore.birthDateIsValid'))
      .value;
  Computed<bool> _$phoneNumberIsValidComputed;

  @override
  bool get phoneNumberIsValid => (_$phoneNumberIsValidComputed ??=
          Computed<bool>(() => super.phoneNumberIsValid,
              name: '_EmployeeStore.phoneNumberIsValid'))
      .value;
  Computed<bool> _$rgIsValidComputed;

  @override
  bool get rgIsValid =>
      (_$rgIsValidComputed ??= Computed<bool>(() => super.rgIsValid,
              name: '_EmployeeStore.rgIsValid'))
          .value;
  Computed<bool> _$cpfIsValidComputed;

  @override
  bool get cpfIsValid =>
      (_$cpfIsValidComputed ??= Computed<bool>(() => super.cpfIsValid,
              name: '_EmployeeStore.cpfIsValid'))
          .value;
  Computed<bool> _$comissionRateIsValidComputed;

  @override
  bool get comissionRateIsValid => (_$comissionRateIsValidComputed ??=
          Computed<bool>(() => super.comissionRateIsValid,
              name: '_EmployeeStore.comissionRateIsValid'))
      .value;
  Computed<bool> _$fieldIsValidComputed;

  @override
  bool get fieldIsValid =>
      (_$fieldIsValidComputed ??= Computed<bool>(() => super.fieldIsValid,
              name: '_EmployeeStore.fieldIsValid'))
          .value;
  Computed<Function> _$buttonSavePressedComputed;

  @override
  Function get buttonSavePressed => (_$buttonSavePressedComputed ??=
          Computed<Function>(() => super.buttonSavePressed,
              name: '_EmployeeStore.buttonSavePressed'))
      .value;
  Computed<Function> _$buttomExcludePressedComputed;

  @override
  Function get buttomExcludePressed => (_$buttomExcludePressedComputed ??=
          Computed<Function>(() => super.buttomExcludePressed,
              name: '_EmployeeStore.buttomExcludePressed'))
      .value;

  final _$dataTypeEmployeeAtom = Atom(name: '_EmployeeStore.dataTypeEmployee');

  @override
  List<dynamic> get dataTypeEmployee {
    _$dataTypeEmployeeAtom.reportRead();
    return super.dataTypeEmployee;
  }

  @override
  set dataTypeEmployee(List<dynamic> value) {
    _$dataTypeEmployeeAtom.reportWrite(value, super.dataTypeEmployee, () {
      super.dataTypeEmployee = value;
    });
  }

  final _$dataTypeEmployeeOldAtom =
      Atom(name: '_EmployeeStore.dataTypeEmployeeOld');

  @override
  List<dynamic> get dataTypeEmployeeOld {
    _$dataTypeEmployeeOldAtom.reportRead();
    return super.dataTypeEmployeeOld;
  }

  @override
  set dataTypeEmployeeOld(List<dynamic> value) {
    _$dataTypeEmployeeOldAtom.reportWrite(value, super.dataTypeEmployeeOld, () {
      super.dataTypeEmployeeOld = value;
    });
  }

  final _$formStateAtom = Atom(name: '_EmployeeStore.formState');

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

  final _$employeeCreatedAtom = Atom(name: '_EmployeeStore.employeeCreated');

  @override
  EmployeeForm get employeeCreated {
    _$employeeCreatedAtom.reportRead();
    return super.employeeCreated;
  }

  @override
  set employeeCreated(EmployeeForm value) {
    _$employeeCreatedAtom.reportWrite(value, super.employeeCreated, () {
      super.employeeCreated = value;
    });
  }

  final _$nameAtom = Atom(name: '_EmployeeStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$controllerFieldNameAtom =
      Atom(name: '_EmployeeStore.controllerFieldName');

  @override
  TextEditingController get controllerFieldName {
    _$controllerFieldNameAtom.reportRead();
    return super.controllerFieldName;
  }

  @override
  set controllerFieldName(TextEditingController value) {
    _$controllerFieldNameAtom.reportWrite(value, super.controllerFieldName, () {
      super.controllerFieldName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_EmployeeStore.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$controllerFieldLastNameAtom =
      Atom(name: '_EmployeeStore.controllerFieldLastName');

  @override
  TextEditingController get controllerFieldLastName {
    _$controllerFieldLastNameAtom.reportRead();
    return super.controllerFieldLastName;
  }

  @override
  set controllerFieldLastName(TextEditingController value) {
    _$controllerFieldLastNameAtom
        .reportWrite(value, super.controllerFieldLastName, () {
      super.controllerFieldLastName = value;
    });
  }

  final _$nicknameAtom = Atom(name: '_EmployeeStore.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$controllerFieldNickNameAtom =
      Atom(name: '_EmployeeStore.controllerFieldNickName');

  @override
  TextEditingController get controllerFieldNickName {
    _$controllerFieldNickNameAtom.reportRead();
    return super.controllerFieldNickName;
  }

  @override
  set controllerFieldNickName(TextEditingController value) {
    _$controllerFieldNickNameAtom
        .reportWrite(value, super.controllerFieldNickName, () {
      super.controllerFieldNickName = value;
    });
  }

  final _$cpfAtom = Atom(name: '_EmployeeStore.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$controllerFieldCpfAtom =
      Atom(name: '_EmployeeStore.controllerFieldCpf');

  @override
  MaskedTextController get controllerFieldCpf {
    _$controllerFieldCpfAtom.reportRead();
    return super.controllerFieldCpf;
  }

  @override
  set controllerFieldCpf(MaskedTextController value) {
    _$controllerFieldCpfAtom.reportWrite(value, super.controllerFieldCpf, () {
      super.controllerFieldCpf = value;
    });
  }

  final _$birthDateAtom = Atom(name: '_EmployeeStore.birthDate');

  @override
  String get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$controllerFieldBirthDateAtom =
      Atom(name: '_EmployeeStore.controllerFieldBirthDate');

  @override
  TextEditingController get controllerFieldBirthDate {
    _$controllerFieldBirthDateAtom.reportRead();
    return super.controllerFieldBirthDate;
  }

  @override
  set controllerFieldBirthDate(TextEditingController value) {
    _$controllerFieldBirthDateAtom
        .reportWrite(value, super.controllerFieldBirthDate, () {
      super.controllerFieldBirthDate = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_EmployeeStore.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$controllerFieldPhoneNumberAtom =
      Atom(name: '_EmployeeStore.controllerFieldPhoneNumber');

  @override
  MaskedTextController get controllerFieldPhoneNumber {
    _$controllerFieldPhoneNumberAtom.reportRead();
    return super.controllerFieldPhoneNumber;
  }

  @override
  set controllerFieldPhoneNumber(MaskedTextController value) {
    _$controllerFieldPhoneNumberAtom
        .reportWrite(value, super.controllerFieldPhoneNumber, () {
      super.controllerFieldPhoneNumber = value;
    });
  }

  final _$rgAtom = Atom(name: '_EmployeeStore.rg');

  @override
  String get rg {
    _$rgAtom.reportRead();
    return super.rg;
  }

  @override
  set rg(String value) {
    _$rgAtom.reportWrite(value, super.rg, () {
      super.rg = value;
    });
  }

  final _$controllerFieldRgAtom =
      Atom(name: '_EmployeeStore.controllerFieldRg');

  @override
  TextEditingController get controllerFieldRg {
    _$controllerFieldRgAtom.reportRead();
    return super.controllerFieldRg;
  }

  @override
  set controllerFieldRg(TextEditingController value) {
    _$controllerFieldRgAtom.reportWrite(value, super.controllerFieldRg, () {
      super.controllerFieldRg = value;
    });
  }

  final _$comissionRateAtom = Atom(name: '_EmployeeStore.comissionRate');

  @override
  int get comissionRate {
    _$comissionRateAtom.reportRead();
    return super.comissionRate;
  }

  @override
  set comissionRate(int value) {
    _$comissionRateAtom.reportWrite(value, super.comissionRate, () {
      super.comissionRate = value;
    });
  }

  final _$changeAtom = Atom(name: '_EmployeeStore.change');

  @override
  bool get change {
    _$changeAtom.reportRead();
    return super.change;
  }

  @override
  set change(bool value) {
    _$changeAtom.reportWrite(value, super.change, () {
      super.change = value;
    });
  }

  final _$sendingAtom = Atom(name: '_EmployeeStore.sending');

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

  final _$errorSendingAtom = Atom(name: '_EmployeeStore.errorSending');

  @override
  bool get errorSending {
    _$errorSendingAtom.reportRead();
    return super.errorSending;
  }

  @override
  set errorSending(bool value) {
    _$errorSendingAtom.reportWrite(value, super.errorSending, () {
      super.errorSending = value;
    });
  }

  final _$duplicateAtom = Atom(name: '_EmployeeStore.duplicate');

  @override
  bool get duplicate {
    _$duplicateAtom.reportRead();
    return super.duplicate;
  }

  @override
  set duplicate(bool value) {
    _$duplicateAtom.reportWrite(value, super.duplicate, () {
      super.duplicate = value;
    });
  }

  final _$createdAtom = Atom(name: '_EmployeeStore.created');

  @override
  bool get created {
    _$createdAtom.reportRead();
    return super.created;
  }

  @override
  set created(bool value) {
    _$createdAtom.reportWrite(value, super.created, () {
      super.created = value;
    });
  }

  final _$controllerFieldComissionRateAtom =
      Atom(name: '_EmployeeStore.controllerFieldComissionRate');

  @override
  TextEditingController get controllerFieldComissionRate {
    _$controllerFieldComissionRateAtom.reportRead();
    return super.controllerFieldComissionRate;
  }

  @override
  set controllerFieldComissionRate(TextEditingController value) {
    _$controllerFieldComissionRateAtom
        .reportWrite(value, super.controllerFieldComissionRate, () {
      super.controllerFieldComissionRate = value;
    });
  }

  final _$passwordAtom = Atom(name: '_EmployeeStore.password');

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

  final _$controllerFieldPasswordAtom =
      Atom(name: '_EmployeeStore.controllerFieldPassword');

  @override
  TextEditingController get controllerFieldPassword {
    _$controllerFieldPasswordAtom.reportRead();
    return super.controllerFieldPassword;
  }

  @override
  set controllerFieldPassword(TextEditingController value) {
    _$controllerFieldPasswordAtom
        .reportWrite(value, super.controllerFieldPassword, () {
      super.controllerFieldPassword = value;
    });
  }

  final _$loadingTypeEmployeeAtom =
      Atom(name: '_EmployeeStore.loadingTypeEmployee');

  @override
  bool get loadingTypeEmployee {
    _$loadingTypeEmployeeAtom.reportRead();
    return super.loadingTypeEmployee;
  }

  @override
  set loadingTypeEmployee(bool value) {
    _$loadingTypeEmployeeAtom.reportWrite(value, super.loadingTypeEmployee, () {
      super.loadingTypeEmployee = value;
    });
  }

  final _$excludedAtom = Atom(name: '_EmployeeStore.excluded');

  @override
  bool get excluded {
    _$excludedAtom.reportRead();
    return super.excluded;
  }

  @override
  set excluded(bool value) {
    _$excludedAtom.reportWrite(value, super.excluded, () {
      super.excluded = value;
    });
  }

  final _$excludedFailAtom = Atom(name: '_EmployeeStore.excludedFail');

  @override
  bool get excludedFail {
    _$excludedFailAtom.reportRead();
    return super.excludedFail;
  }

  @override
  set excludedFail(bool value) {
    _$excludedFailAtom.reportWrite(value, super.excludedFail, () {
      super.excludedFail = value;
    });
  }

  final _$validaTesteAsyncAction = AsyncAction('_EmployeeStore.validaTeste');

  @override
  Future<String> validaTeste(String value) {
    return _$validaTesteAsyncAction.run(() => super.validaTeste(value));
  }

  final _$saveEmployeeAsyncAction = AsyncAction('_EmployeeStore.saveEmployee');

  @override
  Future<void> saveEmployee() {
    return _$saveEmployeeAsyncAction.run(() => super.saveEmployee());
  }

  final _$sendNewEmployeeAsyncAction =
      AsyncAction('_EmployeeStore.sendNewEmployee');

  @override
  Future<void> sendNewEmployee(EmployeeForm employeeForm) {
    return _$sendNewEmployeeAsyncAction
        .run(() => super.sendNewEmployee(employeeForm));
  }

  final _$excludeEmployeeAsyncAction =
      AsyncAction('_EmployeeStore.excludeEmployee');

  @override
  Future<void> excludeEmployee() {
    return _$excludeEmployeeAsyncAction.run(() => super.excludeEmployee());
  }

  final _$_EmployeeStoreActionController =
      ActionController(name: '_EmployeeStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickName(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setNickName');
    try {
      return super.setNickName(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDateController(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setBirthDateController');
    try {
      return super.setBirthDateController(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRg(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setRg');
    try {
      return super.setRg(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComissionRate(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setComissionRate');
    try {
      return super.setComissionRate(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInitial() {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setDataInitial');
    try {
      return super.setDataInitial();
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataTypeEmployee: ${dataTypeEmployee},
dataTypeEmployeeOld: ${dataTypeEmployeeOld},
formState: ${formState},
employeeCreated: ${employeeCreated},
name: ${name},
controllerFieldName: ${controllerFieldName},
lastName: ${lastName},
controllerFieldLastName: ${controllerFieldLastName},
nickname: ${nickname},
controllerFieldNickName: ${controllerFieldNickName},
cpf: ${cpf},
controllerFieldCpf: ${controllerFieldCpf},
birthDate: ${birthDate},
controllerFieldBirthDate: ${controllerFieldBirthDate},
phoneNumber: ${phoneNumber},
controllerFieldPhoneNumber: ${controllerFieldPhoneNumber},
rg: ${rg},
controllerFieldRg: ${controllerFieldRg},
comissionRate: ${comissionRate},
change: ${change},
sending: ${sending},
errorSending: ${errorSending},
duplicate: ${duplicate},
created: ${created},
controllerFieldComissionRate: ${controllerFieldComissionRate},
password: ${password},
controllerFieldPassword: ${controllerFieldPassword},
loadingTypeEmployee: ${loadingTypeEmployee},
excluded: ${excluded},
excludedFail: ${excludedFail},
buttonChangePressed: ${buttonChangePressed},
nameIsValid: ${nameIsValid},
lastNameIsValid: ${lastNameIsValid},
nickNameIsValid: ${nickNameIsValid},
birthDateIsValid: ${birthDateIsValid},
phoneNumberIsValid: ${phoneNumberIsValid},
rgIsValid: ${rgIsValid},
cpfIsValid: ${cpfIsValid},
comissionRateIsValid: ${comissionRateIsValid},
fieldIsValid: ${fieldIsValid},
buttonSavePressed: ${buttonSavePressed},
buttomExcludePressed: ${buttomExcludePressed}
    ''';
  }
}
