import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:mobx/mobx.dart';

part 'financial_store.g.dart';

class FinancialStore = _FinancialStore with _$FinancialStore;

abstract class _FinancialStore with Store {
  _FinancialStore() {
    autorun((_) {
      print('');
    });
  }

  FinancialWebClient financialWebClient = FinancialWebClient();

  @observable
  TextEditingController controllerFieldCreditTax = TextEditingController();

  @observable
  TextEditingController controllerFieldDebitTax = TextEditingController();

  @observable
  TextEditingController controllerFieldDescription = TextEditingController();

  @observable
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @observable
  bool autoValidateForm = false;

  @action
  void setTaxCredit(String value) {
    if (value.isEmpty) {
      flagCardPaymentForm.taxCredit = null;
    } else {
      flagCardPaymentForm.taxCredit = double.parse(value);
    }
  }

  @action
  void setTaxDebit(String value) {
    if (value.isEmpty) {
      flagCardPaymentForm.taxDebit = null;
    } else {
      flagCardPaymentForm.taxDebit = double.parse(value);
    }
  }

  @action
  void setDescription(String value) => flagCardPaymentForm.description = value;

  @observable
  FlagCardPaymentForm flagCardPaymentForm;

  @observable
  List<dynamic> dataFlagCardPayment = List();

  @action
  Future<void> initList() async {
    dataFlagCardPayment = await financialWebClient.findAll();
  }

  @observable
  String description = '';

  @observable
  bool credit = false;

  @observable
  double taxCredit;

  @observable
  bool debit = false;

  @observable
  double taxDebit;

  @action
  Future<void> initCreateNew() async {
    flagCardPaymentForm = FlagCardPaymentForm(
        description: description,
        credit: credit,
        taxCredit: taxCredit,
        debit: debit,
        taxDebit: taxDebit);
  }

  @computed
  bool get taxCreditValid {
    if (flagCardPaymentForm.credit) {
      if (flagCardPaymentForm.taxDebit != null) {
        return true;
      }
    }
    return false;
  }
}
