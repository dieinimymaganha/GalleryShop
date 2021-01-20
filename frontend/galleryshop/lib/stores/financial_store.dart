import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:mobx/mobx.dart';

part 'financial_store.g.dart';

class FinancialStore = _FinancialStore with _$FinancialStore;

abstract class _FinancialStore with Store {
  final FlagCardPaymentDto flagCardPaymentDto;

  _FinancialStore({this.flagCardPaymentDto}) {
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

  @observable
  bool sending = false;

  @observable
  bool created = false;

  @observable
  bool duplicate = false;

  @observable
  bool change = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> createNewFlag() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    FlagCardPaymentForm form = FlagCardPaymentForm(
        description: description,
        credit: credit,
        taxCredit: taxCredit,
        debit: debit,
        taxDebit: taxDebit);

    int response = await financialWebClient.save(form);

//    int response = 40;

    if (response == 201) {
      created = true;
    } else if (response == 409) {
      duplicate = true;
    } else {
      errorSending = true;
    }

    await Future.delayed(Duration(seconds: 2));
    created = false;
    duplicate = false;
    errorSending = false;
  }

  @computed
  Function get buttonPressed => fieldsValid ? createNewFlag : null;

  @action
  void setDataInitial() {
    if (flagCardPaymentDto != null) {
      change = true;
      description =
          controllerFieldDescription.text = flagCardPaymentDto.description;
      debit = flagCardPaymentDto.debit;
      taxDebit = flagCardPaymentDto.taxDebit;
      controllerFieldDebitTax.text = flagCardPaymentDto.taxDebit.toString();
      credit = flagCardPaymentDto.credit;
      taxCredit = flagCardPaymentDto.taxCredit;
      controllerFieldCreditTax.text = flagCardPaymentDto.taxCredit.toString();
    }
  }

  @action
  Future<void> updateFlag() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    FlagCardPaymentForm flagCardPaymentForm = FlagCardPaymentForm(
        description: description,
        credit: credit,
        taxCredit: taxCredit,
        debit: debit,
        taxDebit: taxDebit);
    int response = await financialWebClient.update(
        flagCardPaymentForm, flagCardPaymentDto.id);
    if (response == 200) {
      created = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    created = false;
    errorSending = false;
  }

  @computed
  Function get buttonChangePressed => updateFlag;
}
