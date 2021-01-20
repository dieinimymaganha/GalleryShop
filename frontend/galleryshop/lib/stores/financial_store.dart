import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:mobx/mobx.dart';

part 'financial_store.g.dart';

class FinancialStore = _FinancialStore with _$FinancialStore;

abstract class _FinancialStore with Store {
  _FinancialStore() {
    autorun((_) {
      print('creditDebitIsValid >>>> $creditDebitIsValid');
      print('fields >>>> $fieldsValid');
      print('description >>>> $description');
      print('credit >>>> $credit');
      print('taxCredit >>>> $taxCredit');
      print('taxCreditValid >>>> $taxCreditValid');
      print('debit >>>> $debit');
      print('taxDebit >>>> $taxDebit');
      print('taxDebitValid >>>> $taxDebitValid');
      print('**************************************');
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
      taxCredit = null;
    } else {
      taxCredit = double.parse(value);
    }
  }

  @action
  void setTaxDebit(String value) {
    if (value.isEmpty) {
      taxDebit = null;
    } else {
      taxDebit = double.parse(value);
    }
  }

  @action
  void setDescription(String value) => description = value;

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

  @computed
  bool get taxCreditValid {
    if (credit) {
      if (taxCredit != null) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  @computed
  bool get taxDebitValid {
    if (debit) {
      if (taxDebit != null) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  @computed
  bool get descriptionIsValid {
    if (description.isNotEmpty) {
      if (credit || debit) {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }

  @computed
  bool get creditDebitIsValid => taxCreditValid && taxDebitValid;

  @computed
  bool get fieldsValid => descriptionIsValid && creditDebitIsValid;

  @action
  Future<void> createNewFlag() async {
    FlagCardPaymentForm form = FlagCardPaymentForm(
        description: description,
        credit: credit,
        taxCredit: taxCredit,
        debit: debit,
        taxDebit: taxDebit);

    print(form.toJson());
  }

  @computed
  Function get buttonPressed => fieldsValid ? createNewFlag : null;
}
