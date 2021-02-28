// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientStore on _ClientStore, Store {
  Computed<bool> _$isPasswordFirstValidComputed;

  @override
  bool get isPasswordFirstValid => (_$isPasswordFirstValidComputed ??=
          Computed<bool>(() => super.isPasswordFirstValid,
              name: '_ClientStore.isPasswordFirstValid'))
      .value;
  Computed<bool> _$isPasswordSecondValidComputed;

  @override
  bool get isPasswordSecondValid => (_$isPasswordSecondValidComputed ??=
          Computed<bool>(() => super.isPasswordSecondValid,
              name: '_ClientStore.isPasswordSecondValid'))
      .value;
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_ClientStore.fieldsValid'))
          .value;
  Computed<bool> _$identicalComputed;

  @override
  bool get identical => (_$identicalComputed ??=
          Computed<bool>(() => super.identical, name: '_ClientStore.identical'))
      .value;
  Computed<bool> _$nameIsValidComputed;

  @override
  bool get nameIsValid =>
      (_$nameIsValidComputed ??= Computed<bool>(() => super.nameIsValid,
              name: '_ClientStore.nameIsValid'))
          .value;
  Computed<bool> _$lastNameIsValidComputed;

  @override
  bool get lastNameIsValid =>
      (_$lastNameIsValidComputed ??= Computed<bool>(() => super.lastNameIsValid,
              name: '_ClientStore.lastNameIsValid'))
          .value;
  Computed<bool> _$nickNameIsValidComputed;

  @override
  bool get nickNameIsValid =>
      (_$nickNameIsValidComputed ??= Computed<bool>(() => super.nickNameIsValid,
              name: '_ClientStore.nickNameIsValid'))
          .value;
  Computed<bool> _$birthDateIsValidComputed;

  @override
  bool get birthDateIsValid => (_$birthDateIsValidComputed ??= Computed<bool>(
          () => super.birthDateIsValid,
          name: '_ClientStore.birthDateIsValid'))
      .value;
  Computed<bool> _$phoneNumberIsValidComputed;

  @override
  bool get phoneNumberIsValid => (_$phoneNumberIsValidComputed ??=
          Computed<bool>(() => super.phoneNumberIsValid,
              name: '_ClientStore.phoneNumberIsValid'))
      .value;
  Computed<bool> _$cpfIsValidComputed;

  @override
  bool get cpfIsValid =>
      (_$cpfIsValidComputed ??= Computed<bool>(() => super.cpfIsValid,
              name: '_ClientStore.cpfIsValid'))
          .value;
  Computed<bool> _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_ClientStore.emailIsValid'))
          .value;
  Computed<bool> _$fieldIsValidComputed;

  @override
  bool get fieldIsValid =>
      (_$fieldIsValidComputed ??= Computed<bool>(() => super.fieldIsValid,
              name: '_ClientStore.fieldIsValid'))
          .value;
  Computed<Function> _$buttomSavePressedComputed;

  @override
  Function get buttomSavePressed => (_$buttomSavePressedComputed ??=
          Computed<Function>(() => super.buttomSavePressed,
              name: '_ClientStore.buttomSavePressed'))
      .value;
  Computed<List<ClientDto>> _$lisFilteredComputed;

  @override
  List<ClientDto> get lisFiltered => (_$lisFilteredComputed ??=
          Computed<List<ClientDto>>(() => super.lisFiltered,
              name: '_ClientStore.lisFiltered'))
      .value;
  Computed<List<ClientDto>> _$listFilteredComputed;

  @override
  List<ClientDto> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ClientDto>>(() => super.listFiltered,
              name: '_ClientStore.listFiltered'))
      .value;

  final _$formStateAtom = Atom(name: '_ClientStore.formState');

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

  final _$nameAtom = Atom(name: '_ClientStore.name');

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
      Atom(name: '_ClientStore.controllerFieldName');

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

  final _$lastNameAtom = Atom(name: '_ClientStore.lastName');

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
      Atom(name: '_ClientStore.controllerFieldLastName');

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

  final _$nicknameAtom = Atom(name: '_ClientStore.nickname');

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
      Atom(name: '_ClientStore.controllerFieldNickName');

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

  final _$cpfAtom = Atom(name: '_ClientStore.cpf');

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
      Atom(name: '_ClientStore.controllerFieldCpf');

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

  final _$birthDateAtom = Atom(name: '_ClientStore.birthDate');

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
      Atom(name: '_ClientStore.controllerFieldBirthDate');

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

  final _$phoneNumberAtom = Atom(name: '_ClientStore.phoneNumber');

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
      Atom(name: '_ClientStore.controllerFieldPhoneNumber');

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

  final _$emailAtom = Atom(name: '_ClientStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$controllerFieldEmailAtom =
      Atom(name: '_ClientStore.controllerFieldEmail');

  @override
  TextEditingController get controllerFieldEmail {
    _$controllerFieldEmailAtom.reportRead();
    return super.controllerFieldEmail;
  }

  @override
  set controllerFieldEmail(TextEditingController value) {
    _$controllerFieldEmailAtom.reportWrite(value, super.controllerFieldEmail,
        () {
      super.controllerFieldEmail = value;
    });
  }

  final _$controllerFirstPassAtom =
      Atom(name: '_ClientStore.controllerFirstPass');

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

  final _$firstPassAtom = Atom(name: '_ClientStore.firstPass');

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
      Atom(name: '_ClientStore.controllerSecondPass');

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

  final _$secondPassAtom = Atom(name: '_ClientStore.secondPass');

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

  final _$sendingAtom = Atom(name: '_ClientStore.sending');

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

  final _$createdAtom = Atom(name: '_ClientStore.created');

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

  final _$duplicateAtom = Atom(name: '_ClientStore.duplicate');

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

  final _$errorSendingAtom = Atom(name: '_ClientStore.errorSending');

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

  final _$loadingAtom = Atom(name: '_ClientStore.loading');

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

  final _$errorListAtom = Atom(name: '_ClientStore.errorList');

  @override
  bool get errorList {
    _$errorListAtom.reportRead();
    return super.errorList;
  }

  @override
  set errorList(bool value) {
    _$errorListAtom.reportWrite(value, super.errorList, () {
      super.errorList = value;
    });
  }

  final _$listEmptyAtom = Atom(name: '_ClientStore.listEmpty');

  @override
  bool get listEmpty {
    _$listEmptyAtom.reportRead();
    return super.listEmpty;
  }

  @override
  set listEmpty(bool value) {
    _$listEmptyAtom.reportWrite(value, super.listEmpty, () {
      super.listEmpty = value;
    });
  }

  final _$listClientAtom = Atom(name: '_ClientStore.listClient');

  @override
  List<dynamic> get listClient {
    _$listClientAtom.reportRead();
    return super.listClient;
  }

  @override
  set listClient(List<dynamic> value) {
    _$listClientAtom.reportWrite(value, super.listClient, () {
      super.listClient = value;
    });
  }

  final _$listClientDtoAtom = Atom(name: '_ClientStore.listClientDto');

  @override
  ObservableList<ClientDto> get listClientDto {
    _$listClientDtoAtom.reportRead();
    return super.listClientDto;
  }

  @override
  set listClientDto(ObservableList<ClientDto> value) {
    _$listClientDtoAtom.reportWrite(value, super.listClientDto, () {
      super.listClientDto = value;
    });
  }

  final _$filterAtom = Atom(name: '_ClientStore.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$obscureFirstAtom = Atom(name: '_ClientStore.obscureFirst');

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

  final _$obscureSecondAtom = Atom(name: '_ClientStore.obscureSecond');

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

  final _$saveClientAsyncAction = AsyncAction('_ClientStore.saveClient');

  @override
  Future<void> saveClient() {
    return _$saveClientAsyncAction.run(() => super.saveClient());
  }

  final _$setListAsyncAction = AsyncAction('_ClientStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  final _$reloadListAsyncAction = AsyncAction('_ClientStore.reloadList');

  @override
  Future<void> reloadList() {
    return _$reloadListAsyncAction.run(() => super.reloadList());
  }

  final _$_ClientStoreActionController = ActionController(name: '_ClientStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickName(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setNickName');
    try {
      return super.setNickName(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo =
        _$_ClientStoreActionController.startAction(name: '_ClientStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDateController(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setBirthDateController');
    try {
      return super.setBirthDateController(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirst(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setFirst');
    try {
      return super.setFirst(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondPass(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setSecondPass');
    try {
      return super.setSecondPass(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureFirst() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setObscureFirst');
    try {
      return super.setObscureFirst();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureSecond() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setObscureSecond');
    try {
      return super.setObscureSecond();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListDto() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setListDto');
    try {
      return super.setListDto();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formState: ${formState},
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
email: ${email},
controllerFieldEmail: ${controllerFieldEmail},
controllerFirstPass: ${controllerFirstPass},
firstPass: ${firstPass},
controllerSecondPass: ${controllerSecondPass},
secondPass: ${secondPass},
sending: ${sending},
created: ${created},
duplicate: ${duplicate},
errorSending: ${errorSending},
loading: ${loading},
errorList: ${errorList},
listEmpty: ${listEmpty},
listClient: ${listClient},
listClientDto: ${listClientDto},
filter: ${filter},
obscureFirst: ${obscureFirst},
obscureSecond: ${obscureSecond},
isPasswordFirstValid: ${isPasswordFirstValid},
isPasswordSecondValid: ${isPasswordSecondValid},
fieldsValid: ${fieldsValid},
identical: ${identical},
nameIsValid: ${nameIsValid},
lastNameIsValid: ${lastNameIsValid},
nickNameIsValid: ${nickNameIsValid},
birthDateIsValid: ${birthDateIsValid},
phoneNumberIsValid: ${phoneNumberIsValid},
cpfIsValid: ${cpfIsValid},
emailIsValid: ${emailIsValid},
fieldIsValid: ${fieldIsValid},
buttomSavePressed: ${buttomSavePressed},
lisFiltered: ${lisFiltered},
listFiltered: ${listFiltered}
    ''';
  }
}
