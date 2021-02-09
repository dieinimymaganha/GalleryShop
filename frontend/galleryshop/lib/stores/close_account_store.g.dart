// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CloseAccountStore on _CloseAccountStore, Store {
  Computed<bool> _$valueCreditIsValidComputed;

  @override
  bool get valueCreditIsValid => (_$valueCreditIsValidComputed ??=
          Computed<bool>(() => super.valueCreditIsValid,
              name: '_CloseAccountStore.valueCreditIsValid'))
      .value;
  Computed<bool> _$valueDebitIsValidComputed;

  @override
  bool get valueDebitIsValid => (_$valueDebitIsValidComputed ??= Computed<bool>(
          () => super.valueDebitIsValid,
          name: '_CloseAccountStore.valueDebitIsValid'))
      .value;
  Computed<bool> _$valuePaidIsValidComputed;

  @override
  bool get valuePaidIsValid => (_$valuePaidIsValidComputed ??= Computed<bool>(
          () => super.valuePaidIsValid,
          name: '_CloseAccountStore.valuePaidIsValid'))
      .value;
  Computed<bool> _$valueMoneyIsValidComputed;

  @override
  bool get valueMoneyIsValid => (_$valueMoneyIsValidComputed ??= Computed<bool>(
          () => super.valueMoneyIsValid,
          name: '_CloseAccountStore.valueMoneyIsValid'))
      .value;
  Computed<bool> _$fieldsCloseAccountIsValidComputed;

  @override
  bool get fieldsCloseAccountIsValid => (_$fieldsCloseAccountIsValidComputed ??=
          Computed<bool>(() => super.fieldsCloseAccountIsValid,
              name: '_CloseAccountStore.fieldsCloseAccountIsValid'))
      .value;
  Computed<Function> _$buttonCloseAccountPressedComputed;

  @override
  Function get buttonCloseAccountPressed =>
      (_$buttonCloseAccountPressedComputed ??= Computed<Function>(
              () => super.buttonCloseAccountPressed,
              name: '_CloseAccountStore.buttonCloseAccountPressed'))
          .value;

  final _$cardAtom = Atom(name: '_CloseAccountStore.card');

  @override
  bool get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(bool value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$moneyAtom = Atom(name: '_CloseAccountStore.money');

  @override
  bool get money {
    _$moneyAtom.reportRead();
    return super.money;
  }

  @override
  set money(bool value) {
    _$moneyAtom.reportWrite(value, super.money, () {
      super.money = value;
    });
  }

  final _$debitAtom = Atom(name: '_CloseAccountStore.debit');

  @override
  bool get debit {
    _$debitAtom.reportRead();
    return super.debit;
  }

  @override
  set debit(bool value) {
    _$debitAtom.reportWrite(value, super.debit, () {
      super.debit = value;
    });
  }

  final _$creditAtom = Atom(name: '_CloseAccountStore.credit');

  @override
  bool get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(bool value) {
    _$creditAtom.reportWrite(value, super.credit, () {
      super.credit = value;
    });
  }

  final _$habilitPaidAtom = Atom(name: '_CloseAccountStore.habilitPaid');

  @override
  bool get habilitPaid {
    _$habilitPaidAtom.reportRead();
    return super.habilitPaid;
  }

  @override
  set habilitPaid(bool value) {
    _$habilitPaidAtom.reportWrite(value, super.habilitPaid, () {
      super.habilitPaid = value;
    });
  }

  final _$sendingAtom = Atom(name: '_CloseAccountStore.sending');

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

  final _$listFlagCardsAtom = Atom(name: '_CloseAccountStore.listFlagCards');

  @override
  List<dynamic> get listFlagCards {
    _$listFlagCardsAtom.reportRead();
    return super.listFlagCards;
  }

  @override
  set listFlagCards(List<dynamic> value) {
    _$listFlagCardsAtom.reportWrite(value, super.listFlagCards, () {
      super.listFlagCards = value;
    });
  }

  final _$flagCardPaymentDtoAtom =
      Atom(name: '_CloseAccountStore.flagCardPaymentDto');

  @override
  FlagCardPaymentDto get flagCardPaymentDto {
    _$flagCardPaymentDtoAtom.reportRead();
    return super.flagCardPaymentDto;
  }

  @override
  set flagCardPaymentDto(FlagCardPaymentDto value) {
    _$flagCardPaymentDtoAtom.reportWrite(value, super.flagCardPaymentDto, () {
      super.flagCardPaymentDto = value;
    });
  }

  final _$valueSelectFlagAtom =
      Atom(name: '_CloseAccountStore.valueSelectFlag');

  @override
  int get valueSelectFlag {
    _$valueSelectFlagAtom.reportRead();
    return super.valueSelectFlag;
  }

  @override
  set valueSelectFlag(int value) {
    _$valueSelectFlagAtom.reportWrite(value, super.valueSelectFlag, () {
      super.valueSelectFlag = value;
    });
  }

  final _$flagCardPaymentDtoOKAtom =
      Atom(name: '_CloseAccountStore.flagCardPaymentDtoOK');

  @override
  bool get flagCardPaymentDtoOK {
    _$flagCardPaymentDtoOKAtom.reportRead();
    return super.flagCardPaymentDtoOK;
  }

  @override
  set flagCardPaymentDtoOK(bool value) {
    _$flagCardPaymentDtoOKAtom.reportWrite(value, super.flagCardPaymentDtoOK,
        () {
      super.flagCardPaymentDtoOK = value;
    });
  }

  final _$controllerFieldValuePaidOutAtom =
      Atom(name: '_CloseAccountStore.controllerFieldValuePaidOut');

  @override
  TextEditingController get controllerFieldValuePaidOut {
    _$controllerFieldValuePaidOutAtom.reportRead();
    return super.controllerFieldValuePaidOut;
  }

  @override
  set controllerFieldValuePaidOut(TextEditingController value) {
    _$controllerFieldValuePaidOutAtom
        .reportWrite(value, super.controllerFieldValuePaidOut, () {
      super.controllerFieldValuePaidOut = value;
    });
  }

  final _$paidOutAtom = Atom(name: '_CloseAccountStore.paidOut');

  @override
  double get paidOut {
    _$paidOutAtom.reportRead();
    return super.paidOut;
  }

  @override
  set paidOut(double value) {
    _$paidOutAtom.reportWrite(value, super.paidOut, () {
      super.paidOut = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CloseAccountStore.loading');

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

  final _$notServiceAtom = Atom(name: '_CloseAccountStore.notService');

  @override
  bool get notService {
    _$notServiceAtom.reportRead();
    return super.notService;
  }

  @override
  set notService(bool value) {
    _$notServiceAtom.reportWrite(value, super.notService, () {
      super.notService = value;
    });
  }

  final _$accountClientDtoAtom =
      Atom(name: '_CloseAccountStore.accountClientDto');

  @override
  AccountClientDto get accountClientDto {
    _$accountClientDtoAtom.reportRead();
    return super.accountClientDto;
  }

  @override
  set accountClientDto(AccountClientDto value) {
    _$accountClientDtoAtom.reportWrite(value, super.accountClientDto, () {
      super.accountClientDto = value;
    });
  }

  final _$accountEmployeeDtoAtom =
      Atom(name: '_CloseAccountStore.accountEmployeeDto');

  @override
  AccountEmployeeDto get accountEmployeeDto {
    _$accountEmployeeDtoAtom.reportRead();
    return super.accountEmployeeDto;
  }

  @override
  set accountEmployeeDto(AccountEmployeeDto value) {
    _$accountEmployeeDtoAtom.reportWrite(value, super.accountEmployeeDto, () {
      super.accountEmployeeDto = value;
    });
  }

  final _$balanceNegativeAtom =
      Atom(name: '_CloseAccountStore.balanceNegative');

  @override
  bool get balanceNegative {
    _$balanceNegativeAtom.reportRead();
    return super.balanceNegative;
  }

  @override
  set balanceNegative(bool value) {
    _$balanceNegativeAtom.reportWrite(value, super.balanceNegative, () {
      super.balanceNegative = value;
    });
  }

  final _$balanceZeroAtom = Atom(name: '_CloseAccountStore.balanceZero');

  @override
  bool get balanceZero {
    _$balanceZeroAtom.reportRead();
    return super.balanceZero;
  }

  @override
  set balanceZero(bool value) {
    _$balanceZeroAtom.reportWrite(value, super.balanceZero, () {
      super.balanceZero = value;
    });
  }

  final _$totalPayableAtom = Atom(name: '_CloseAccountStore.totalPayable');

  @override
  double get totalPayable {
    _$totalPayableAtom.reportRead();
    return super.totalPayable;
  }

  @override
  set totalPayable(double value) {
    _$totalPayableAtom.reportWrite(value, super.totalPayable, () {
      super.totalPayable = value;
    });
  }

  final _$closeAccountOKAtom = Atom(name: '_CloseAccountStore.closeAccountOK');

  @override
  bool get closeAccountOK {
    _$closeAccountOKAtom.reportRead();
    return super.closeAccountOK;
  }

  @override
  set closeAccountOK(bool value) {
    _$closeAccountOKAtom.reportWrite(value, super.closeAccountOK, () {
      super.closeAccountOK = value;
    });
  }

  final _$closeAccountErrorAtom =
      Atom(name: '_CloseAccountStore.closeAccountError');

  @override
  bool get closeAccountError {
    _$closeAccountErrorAtom.reportRead();
    return super.closeAccountError;
  }

  @override
  set closeAccountError(bool value) {
    _$closeAccountErrorAtom.reportWrite(value, super.closeAccountError, () {
      super.closeAccountError = value;
    });
  }

  final _$accountClientProcessAtom =
      Atom(name: '_CloseAccountStore.accountClientProcess');

  @override
  bool get accountClientProcess {
    _$accountClientProcessAtom.reportRead();
    return super.accountClientProcess;
  }

  @override
  set accountClientProcess(bool value) {
    _$accountClientProcessAtom.reportWrite(value, super.accountClientProcess,
        () {
      super.accountClientProcess = value;
    });
  }

  final _$getListFlagsCardsAsyncAction =
      AsyncAction('_CloseAccountStore.getListFlagsCards');

  @override
  Future<void> getListFlagsCards() {
    return _$getListFlagsCardsAsyncAction.run(() => super.getListFlagsCards());
  }

  final _$getClientAsyncAction = AsyncAction('_CloseAccountStore.getClient');

  @override
  Future<void> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$iniPageCloseAccountAsyncAction =
      AsyncAction('_CloseAccountStore.iniPageCloseAccount');

  @override
  Future<void> iniPageCloseAccount() {
    return _$iniPageCloseAccountAsyncAction
        .run(() => super.iniPageCloseAccount());
  }

  final _$calculateTotalPayableAsyncAction =
      AsyncAction('_CloseAccountStore.calculateTotalPayable');

  @override
  Future<void> calculateTotalPayable() {
    return _$calculateTotalPayableAsyncAction
        .run(() => super.calculateTotalPayable());
  }

  final _$closeAccountAsyncAction =
      AsyncAction('_CloseAccountStore.closeAccount');

  @override
  Future<void> closeAccount() {
    return _$closeAccountAsyncAction.run(() => super.closeAccount());
  }

  final _$_CloseAccountStoreActionController =
      ActionController(name: '_CloseAccountStore');

  @override
  void alterCard() {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.alterCard');
    try {
      return super.alterCard();
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterMoney() {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.alterMoney');
    try {
      return super.alterMoney();
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterCredit() {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.alterCredit');
    try {
      return super.alterCredit();
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterDebit() {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.alterDebit');
    try {
      return super.alterDebit();
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaidOut(String value) {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.setPaidOut');
    try {
      return super.setPaidOut(value);
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueSelectFlag(int value) {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.setValueSelectFlag');
    try {
      return super.setValueSelectFlag(value);
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValuesCards() {
    final _$actionInfo = _$_CloseAccountStoreActionController.startAction(
        name: '_CloseAccountStore.setValuesCards');
    try {
      return super.setValuesCards();
    } finally {
      _$_CloseAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card},
money: ${money},
debit: ${debit},
credit: ${credit},
habilitPaid: ${habilitPaid},
sending: ${sending},
listFlagCards: ${listFlagCards},
flagCardPaymentDto: ${flagCardPaymentDto},
valueSelectFlag: ${valueSelectFlag},
flagCardPaymentDtoOK: ${flagCardPaymentDtoOK},
controllerFieldValuePaidOut: ${controllerFieldValuePaidOut},
paidOut: ${paidOut},
loading: ${loading},
notService: ${notService},
accountClientDto: ${accountClientDto},
accountEmployeeDto: ${accountEmployeeDto},
balanceNegative: ${balanceNegative},
balanceZero: ${balanceZero},
totalPayable: ${totalPayable},
closeAccountOK: ${closeAccountOK},
closeAccountError: ${closeAccountError},
accountClientProcess: ${accountClientProcess},
valueCreditIsValid: ${valueCreditIsValid},
valueDebitIsValid: ${valueDebitIsValid},
valuePaidIsValid: ${valuePaidIsValid},
valueMoneyIsValid: ${valueMoneyIsValid},
fieldsCloseAccountIsValid: ${fieldsCloseAccountIsValid},
buttonCloseAccountPressed: ${buttonCloseAccountPressed}
    ''';
  }
}
