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

  final _$flagCardPaymentFormAtom =
      Atom(name: '_FinancialStore.flagCardPaymentForm');

  @override
  FlagCardPaymentForm get flagCardPaymentForm {
    _$flagCardPaymentFormAtom.reportRead();
    return super.flagCardPaymentForm;
  }

  @override
  set flagCardPaymentForm(FlagCardPaymentForm value) {
    _$flagCardPaymentFormAtom.reportWrite(value, super.flagCardPaymentForm, () {
      super.flagCardPaymentForm = value;
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

  final _$initListAsyncAction = AsyncAction('_FinancialStore.initList');

  @override
  Future<void> initList() {
    return _$initListAsyncAction.run(() => super.initList());
  }

  final _$initCreateNewAsyncAction =
      AsyncAction('_FinancialStore.initCreateNew');

  @override
  Future<void> initCreateNew() {
    return _$initCreateNewAsyncAction.run(() => super.initCreateNew());
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
flagCardPaymentForm: ${flagCardPaymentForm},
dataFlagCardPayment: ${dataFlagCardPayment},
description: ${description},
credit: ${credit},
taxCredit: ${taxCredit},
debit: ${debit},
taxDebit: ${taxDebit},
taxCreditValid: ${taxCreditValid}
    ''';
  }
}
