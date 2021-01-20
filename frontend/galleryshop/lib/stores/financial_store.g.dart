// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinancialStore on _FinancialStore, Store {
  Computed<bool> _$taxCreditValidComputed;

  @override
  bool get taxCreditValid =>
      (_$taxCreditValidComputed ??= Computed<bool>(() => super.taxCreditValid,
              name: '_FinancialStore.taxCreditValid'))
          .value;
  Computed<bool> _$taxDebitValidComputed;

  @override
  bool get taxDebitValid =>
      (_$taxDebitValidComputed ??= Computed<bool>(() => super.taxDebitValid,
              name: '_FinancialStore.taxDebitValid'))
          .value;
  Computed<bool> _$descriptionIsValidComputed;

  @override
  bool get descriptionIsValid => (_$descriptionIsValidComputed ??=
          Computed<bool>(() => super.descriptionIsValid,
              name: '_FinancialStore.descriptionIsValid'))
      .value;
  Computed<bool> _$creditDebitIsValidComputed;

  @override
  bool get creditDebitIsValid => (_$creditDebitIsValidComputed ??=
          Computed<bool>(() => super.creditDebitIsValid,
              name: '_FinancialStore.creditDebitIsValid'))
      .value;
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_FinancialStore.fieldsValid'))
          .value;
  Computed<Function> _$buttonPressedComputed;

  @override
  Function get buttonPressed =>
      (_$buttonPressedComputed ??= Computed<Function>(() => super.buttonPressed,
              name: '_FinancialStore.buttonPressed'))
          .value;

  final _$controllerFieldCreditTaxAtom =
      Atom(name: '_FinancialStore.controllerFieldCreditTax');

  @override
  TextEditingController get controllerFieldCreditTax {
    _$controllerFieldCreditTaxAtom.reportRead();
    return super.controllerFieldCreditTax;
  }

  @override
  set controllerFieldCreditTax(TextEditingController value) {
    _$controllerFieldCreditTaxAtom
        .reportWrite(value, super.controllerFieldCreditTax, () {
      super.controllerFieldCreditTax = value;
    });
  }

  final _$controllerFieldDebitTaxAtom =
      Atom(name: '_FinancialStore.controllerFieldDebitTax');

  @override
  TextEditingController get controllerFieldDebitTax {
    _$controllerFieldDebitTaxAtom.reportRead();
    return super.controllerFieldDebitTax;
  }

  @override
  set controllerFieldDebitTax(TextEditingController value) {
    _$controllerFieldDebitTaxAtom
        .reportWrite(value, super.controllerFieldDebitTax, () {
      super.controllerFieldDebitTax = value;
    });
  }

  final _$controllerFieldDescriptionAtom =
      Atom(name: '_FinancialStore.controllerFieldDescription');

  @override
  TextEditingController get controllerFieldDescription {
    _$controllerFieldDescriptionAtom.reportRead();
    return super.controllerFieldDescription;
  }

  @override
  set controllerFieldDescription(TextEditingController value) {
    _$controllerFieldDescriptionAtom
        .reportWrite(value, super.controllerFieldDescription, () {
      super.controllerFieldDescription = value;
    });
  }

  final _$formStateAtom = Atom(name: '_FinancialStore.formState');

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

  final _$autoValidateFormAtom = Atom(name: '_FinancialStore.autoValidateForm');

  @override
  bool get autoValidateForm {
    _$autoValidateFormAtom.reportRead();
    return super.autoValidateForm;
  }

  @override
  set autoValidateForm(bool value) {
    _$autoValidateFormAtom.reportWrite(value, super.autoValidateForm, () {
      super.autoValidateForm = value;
    });
  }

  final _$dataFlagCardPaymentAtom =
      Atom(name: '_FinancialStore.dataFlagCardPayment');

  @override
  List<dynamic> get dataFlagCardPayment {
    _$dataFlagCardPaymentAtom.reportRead();
    return super.dataFlagCardPayment;
  }

  @override
  set dataFlagCardPayment(List<dynamic> value) {
    _$dataFlagCardPaymentAtom.reportWrite(value, super.dataFlagCardPayment, () {
      super.dataFlagCardPayment = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_FinancialStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$creditAtom = Atom(name: '_FinancialStore.credit');

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

  final _$taxCreditAtom = Atom(name: '_FinancialStore.taxCredit');

  @override
  double get taxCredit {
    _$taxCreditAtom.reportRead();
    return super.taxCredit;
  }

  @override
  set taxCredit(double value) {
    _$taxCreditAtom.reportWrite(value, super.taxCredit, () {
      super.taxCredit = value;
    });
  }

  final _$debitAtom = Atom(name: '_FinancialStore.debit');

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

  final _$taxDebitAtom = Atom(name: '_FinancialStore.taxDebit');

  @override
  double get taxDebit {
    _$taxDebitAtom.reportRead();
    return super.taxDebit;
  }

  @override
  set taxDebit(double value) {
    _$taxDebitAtom.reportWrite(value, super.taxDebit, () {
      super.taxDebit = value;
    });
  }

  final _$sendingAtom = Atom(name: '_FinancialStore.sending');

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

  final _$createdAtom = Atom(name: '_FinancialStore.created');

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

  final _$duplicateAtom = Atom(name: '_FinancialStore.duplicate');

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

  final _$changeAtom = Atom(name: '_FinancialStore.change');

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

  final _$errorSendingAtom = Atom(name: '_FinancialStore.errorSending');

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

  final _$initListAsyncAction = AsyncAction('_FinancialStore.initList');

  @override
  Future<void> initList() {
    return _$initListAsyncAction.run(() => super.initList());
  }

  final _$createNewFlagAsyncAction =
      AsyncAction('_FinancialStore.createNewFlag');

  @override
  Future<void> createNewFlag() {
    return _$createNewFlagAsyncAction.run(() => super.createNewFlag());
  }

  final _$_FinancialStoreActionController =
      ActionController(name: '_FinancialStore');

  @override
  void setTaxCredit(String value) {
    final _$actionInfo = _$_FinancialStoreActionController.startAction(
        name: '_FinancialStore.setTaxCredit');
    try {
      return super.setTaxCredit(value);
    } finally {
      _$_FinancialStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaxDebit(String value) {
    final _$actionInfo = _$_FinancialStoreActionController.startAction(
        name: '_FinancialStore.setTaxDebit');
    try {
      return super.setTaxDebit(value);
    } finally {
      _$_FinancialStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_FinancialStoreActionController.startAction(
        name: '_FinancialStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_FinancialStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerFieldCreditTax: ${controllerFieldCreditTax},
controllerFieldDebitTax: ${controllerFieldDebitTax},
controllerFieldDescription: ${controllerFieldDescription},
formState: ${formState},
autoValidateForm: ${autoValidateForm},
dataFlagCardPayment: ${dataFlagCardPayment},
description: ${description},
credit: ${credit},
taxCredit: ${taxCredit},
debit: ${debit},
taxDebit: ${taxDebit},
sending: ${sending},
created: ${created},
duplicate: ${duplicate},
change: ${change},
errorSending: ${errorSending},
taxCreditValid: ${taxCreditValid},
taxDebitValid: ${taxDebitValid},
descriptionIsValid: ${descriptionIsValid},
creditDebitIsValid: ${creditDebitIsValid},
fieldsValid: ${fieldsValid},
buttonPressed: ${buttonPressed}
    ''';
  }
}
