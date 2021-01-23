import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_account_client.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'account_client_store.g.dart';

class AccountClientStore = _AccountClientStore with _$AccountClientStore;

abstract class _AccountClientStore with Store {
  final int idClient;

  AccountClientWebClient accountClientWebClient = AccountClientWebClient();

  FinancialWebClient financialWebClient = FinancialWebClient();

  _AccountClientStore({this.idClient}) {
    autorun((_) {
      print('credit >>>>>>>>>>> $credit');
    });
  }

  @observable
  List<dynamic> listClient = List();

  @observable
  String filter = '';

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableList<AccountClientDto> listAccountClient =
      ObservableList<AccountClientDto>().asObservable();

  @action
  void setListAccountClient() {
    if (listClient.isEmpty) {
      print('vazia');
    } else {
      listClient.forEach((element) {
        if (element != null) {
          AccountClientDto cli = element;
          print(cli.toString());
          listAccountClient.add(element);
        }
      });
    }
  }

  @action
  Future<void> setList() async {
    loading = true;
//    await Future.delayed(Duration(seconds: 2));
    try {
      listClient = await accountClientWebClient.findAll();
      listClient.sort((a, b) =>
          a.clientDto.name.toString().compareTo(b.clientDto.name.toString()));
      if (listClient.isEmpty) {
        errorList = true;
        listEmpty = true;
        loading = false;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    setListAccountClient();
    loading = false;
  }

  @computed
  List<AccountClientDto> get lisFiltered {
    if (filter.isEmpty) {
      return listAccountClient;
    } else {
      return listAccountClient.where((element) {
        if (element.clientDto.cpf.contains(filter)) {
          return element.clientDto.cpf.contains(filter);
        } else if (element.clientDto.nickname
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          return element.clientDto.nickname
              .toLowerCase()
              .contains(filter.toLowerCase());
        } else if (element.clientDto.phoneNumber.contains(filter)) {
          return element.clientDto.phoneNumber.contains(filter);
        }
        return element.clientDto.name
            .toLowerCase()
            .contains(filter.toLowerCase());
      }).toList();
    }
  }

  @observable
  AccountClientDto accountClientDto;

  @action
  Future<void> getClient() async {
    accountClientDto = await accountClientWebClient.findById(idClient);
  }

  @observable
  bool balanceNegative = false;

  @observable
  bool balanceZero = false;

  @action
  Future<void> iniPageClient() async {
    loading = true;
    notService = true;
    await getClient();
    if (accountClientDto.balance < 0) {
      balanceNegative = true;
    } else if (accountClientDto.balance == 0) {
      balanceZero = true;
    }
    await setCalendar();
    calculateTotalPayable();
    loading = false;
  }

  //Calcula o valor a pagar

  @observable
  double totalPayable;

  @action
  Future<void> calculateTotalPayable() async {
    totalPayable = accountClientDto.amount - accountClientDto.amountPaid;
    if (totalPayable < 0.0) {
      totalPayable = 0.0;
    }
  }

  // Calendario
  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setCalendar() async {
    getClient();
    events = fromModelToEvent(accountClientDto.serviceRecordDto);
    calculateTotalPayable();
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ServiceRecordDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateService);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @observable
  double amountDay = 0.0;

  @observable
  double discountDay = 0.0;

  @observable
  double amountPayable = 0.0;

  @observable
  bool notService = false;

  @action
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    notService = false;
    selectedEvents = events;
    if (events.isNotEmpty) {
      amountDay = 0.0;
      discountDay = 0.0;
      amountPayable = 0.0;
      selectedEvents.forEach((element) {
        amountDay = amountDay + element.billedServiceDto.value;
        discountDay = discountDay + element.billedServiceDto.discount;
        amountPayable = amountPayable + element.billedServiceDto.valueFinal;
      });
    } else {
      notService = true;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loading = false;
    iniPageClient();
  }

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

  @action
  Future<void> iniPageCloseAccount() async {
    loading = true;
    notService = true;
    await getClient();
    if (accountClientDto.balance < 0) {
      balanceNegative = true;
    } else if (accountClientDto.balance == 0) {
      balanceZero = true;
    }
    calculateTotalPayable();
    await getListFlagsCards();
    loading = false;
  }

  @observable
  bool closeAccountOK = false;

  @observable
  bool closeAccountError = false;

  @action
  Future<void> closeAccount() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    CloseAccountClientForm closeAccountClientForm = CloseAccountClientForm(
        idAccountClient: accountClientDto.id,
        value: paidOut,
        card: card,
        creditCard: credit,
        debitCard: debit,
        idFlagCardPayment: flagCardPaymentDto.id,
        useBalance: true);
//    int response = 200;
    int response =
        await accountClientWebClient.closeAccount(closeAccountClientForm);

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
