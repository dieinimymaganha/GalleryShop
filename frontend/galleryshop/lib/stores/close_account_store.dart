import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_account_client.dart';
import 'package:galleryshop/http/webclients/webclient_account_employee.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:galleryshop/models/account_employee.dart';
import 'package:galleryshop/models/close_account.dart';
import 'package:mobx/mobx.dart';

part 'close_account_store.g.dart';

class CloseAccountStore = _CloseAccountStore with _$CloseAccountStore;

abstract class _CloseAccountStore with Store {
  final int idClient;
  final int idEmployee;

  _CloseAccountStore({this.idEmployee, this.idClient});

  FinancialWebClient financialWebClient = FinancialWebClient();
  AccountEmployeeWebClient accountEmployeeWebClient =
      AccountEmployeeWebClient();
  AccountClientWebClient accountClientWebClient = AccountClientWebClient();

  //fechar conta

  @observable
  bool card = false;

  @observable
  bool money = true;

  @action
  void alterCard() {
    card = !card;
  }

  @action
  void alterMoney() {
    money = !money;
    flagCardPaymentDtoOK = false;
    valueSelectFlag = null;
    credit = false;
    debit = false;
  }

  @observable
  bool debit = false;

  @observable
  bool credit = false;

  @observable
  bool habilitPaid = false;

  @action
  void alterCredit() => credit = !credit;

  @action
  void alterDebit() => debit = !debit;

  @observable
  bool sending = false;

  @observable
  List<dynamic> listFlagCards = List();

  @action
  Future<void> getListFlagsCards() async {
    listFlagCards = await financialWebClient.findAll();
  }

  @observable
  FlagCardPaymentDto flagCardPaymentDto = FlagCardPaymentDto();

  @observable
  int valueSelectFlag;

  @observable
  bool flagCardPaymentDtoOK = false;

  @observable
  TextEditingController controllerFieldValuePaidOut = TextEditingController();

  @observable
  double paidOut = 0.0;

  @action
  void setPaidOut(String value) {
    if (value.isEmpty) {
      paidOut = 0.0;
    } else {
      value = value.replaceAll('.', '');
      value = value.replaceAll(',', '.');
      paidOut = double.parse(value);
    }
  }

  @action
  void setValueSelectFlag(int value) {
    flagCardPaymentDtoOK = true;
    valueSelectFlag = value;
    listFlagCards.forEach((element) {
      if (element.id == valueSelectFlag) {
        flagCardPaymentDto = element;
      }
    });
    setValuesCards();
  }

  @action
  void setValuesCards() {
    if (flagCardPaymentDto.credit && flagCardPaymentDto.debit) {
      credit = true;
      debit = false;
    } else if (flagCardPaymentDto.credit && !flagCardPaymentDto.debit) {
      credit = true;
      debit = false;
    } else if (!flagCardPaymentDto.credit && flagCardPaymentDto.debit) {
      debit = true;
      credit = false;
    }
  }

  @observable
  bool loading = false;

  @observable
  bool notService = false;

  @observable
  AccountClientDto accountClientDto;

  @observable
  AccountEmployeeDto accountEmployeeDto;

  @action
  Future<void> getClient() async {
    if (idClient != null) {
      accountClientDto = await accountClientWebClient.findById(idClient);
    } else if (idEmployee != null) {
      accountEmployeeDto = await accountEmployeeWebClient.findById(idEmployee);
    }
  }

  @observable
  bool balanceNegative = false;

  @observable
  bool balanceZero = false;

  @action
  Future<void> iniPageCloseAccount() async {
    loading = true;
    notService = true;
    await getClient();
    if (idClient != null) {
      if (accountClientDto.balance < 0) {
        balanceNegative = true;
      } else if (accountClientDto.balance == 0) {
        balanceZero = true;
      }
    } else if (idEmployee != null) {
      if (accountEmployeeDto.balance < 0) {
        balanceNegative = true;
      } else if (accountEmployeeDto.balance == 0) {
        balanceZero = true;
      }
    }

    calculateTotalPayable();
    await getListFlagsCards();
    loading = false;
  }

  @observable
  double totalPayable;

  @action
  Future<void> calculateTotalPayable() async {
    if (idClient != null) {
      totalPayable = accountClientDto.amount - accountClientDto.amountPaid;
    } else if (idEmployee != null) {
      totalPayable = accountEmployeeDto.amount - accountEmployeeDto.amountPaid;
    }
    if (totalPayable < 0.0) {
      totalPayable = 0.0;
    }
  }

  @observable
  bool closeAccountOK = false;

  @observable
  bool closeAccountError = false;

  @observable
  bool accountClientProcess = true;

  @action
  Future<void> closeAccount() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    CloseAccountForm closeAccountForm = CloseAccountForm();
    if (idClient != null) {
      closeAccountForm = CloseAccountForm(
          idAccountClient: accountClientDto.id,
          value: paidOut,
          card: card,
          creditCard: credit,
          debitCard: debit,
          idFlagCardPayment: flagCardPaymentDto.id,
          useBalance: true);
    } else if (idEmployee != null) {
      accountClientProcess = false;
      closeAccountForm = CloseAccountForm(
          idAccountEmployee: accountEmployeeDto.id,
          value: paidOut,
          card: card,
          creditCard: credit,
          debitCard: debit,
          idFlagCardPayment: flagCardPaymentDto.id,
          useBalance: true);
    }

//    int response = 200;
    int response = await accountClientWebClient.closeAccount(closeAccountForm);

    if (response == 200) {
      closeAccountOK = true;
    } else {
      closeAccountError = true;
    }
    await Future.delayed(Duration(seconds: 2));
    closeAccountOK = false;
    closeAccountError = false;
  }

  @computed
  bool get valueCreditIsValid => credit == true;

  @computed
  bool get valueDebitIsValid => debit == true;

  @computed
  bool get valuePaidIsValid => paidOut > 0.0;

  @computed
  bool get valueMoneyIsValid => money == true;

  @computed
  bool get fieldsCloseAccountIsValid =>
      valuePaidIsValid &&
      (valueCreditIsValid || valueDebitIsValid || valueMoneyIsValid);

  @computed
  Function get buttonCloseAccountPressed =>
      fieldsCloseAccountIsValid ? closeAccount : null;
}
