import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_account_client.dart';
import 'package:galleryshopcustomers/models/AccountClient.dart';
import 'package:galleryshopcustomers/models/payment.dart';
import 'package:galleryshopcustomers/models/sale.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'account_client_store.g.dart';

class AccountClientStore = _AccountClientStore with _$AccountClientStore;

abstract class _AccountClientStore with Store {
  final int idClient;
  final int idAccount;
  final int idEmployee;
  final SaleDto saleDto;

  AccountClientWebClient accountClientWebClient = AccountClientWebClient();

  _AccountClientStore(
      {this.idClient, this.idAccount, this.saleDto, this.idEmployee}) {
    autorun((_) {
      print('productSoldDto >>>>>>>>>>> $saleDto');
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
  List<dynamic> selectedEventsSales = List();

  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setCalendar() async {
    getClient();
    events = fromModelToEvent(accountClientDto.serviceRecordDto);
    events2 = fromModelToEventProduct(accountClientDto.saleDto);
    calculateTotalPayable();
  }

  @observable
  Map<DateTime, List<dynamic>> events2 = {};

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

  @action
  Map<DateTime, List<dynamic>> fromModelToEventProduct(List<SaleDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateSale);
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
  double amountPayableServices = 0.0;

  @observable
  double amountPayableSales = 0.0;

  @observable
  bool notService = true;

  @observable
  bool notSale = true;

  @action
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    notService = false;
    selectedEvents = events;
    if (events.isNotEmpty) {
      amountDay = 0.0;
      discountDay = 0.0;
      amountPayableServices = 0.0;
      selectedEvents.forEach((element) {
        amountDay = amountDay + element.billedServiceDto.value;
        discountDay = discountDay + element.billedServiceDto.discount;
        amountPayableServices =
            amountPayableServices + element.billedServiceDto.valueFinal;
        calculateTotalDay();
      });
    } else {
      notService = true;
    }
  }

  @action
  void setSelectedEventsSales(DateTime date) {
    notSale = true;
    selectedEventsSales = [];
    events2.forEach((key, value) {
      final f = new DateFormat('yyyy-MM-dd');
      if (f.format(date) == f.format(key)) {
        selectedEventsSales = value;
        notSale = false;
      }
    });
    calculateTotalSales();
  }

  @action
  void calculateTotalSales() {
    amountPayableSales = 0.0;
    selectedEventsSales.forEach((element) {
      amountPayableSales =
          amountPayableSales + element.productSoldDto.valueTotal;
    });
    calculateTotalDay();
  }

  @observable
  bool valueToday = true;

  @observable
  double totalDay = 0.0;

  @action
  void calculateTotalDay() {
    valueToday = true;
    if (notService == false && notSale == false) {
      totalDay = amountPayableSales + amountPayableServices;
      valueToday = false;
    } else if (notService && notSale == false) {
      totalDay = amountPayableSales;
      valueToday = false;
    } else if (notSale && notService == false) {
      totalDay = amountPayableServices;
      valueToday = false;
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

  // Consultar pagamentos
  @observable
  List<dynamic> listPayments = List();

  @action
  Future<void> setListCalendarPayments() async {
    notService = true;
    try {
      listPayments =
          await accountClientWebClient.findPaymentsAccountId(idAccount);
      if (listPayments.isNotEmpty) {
        events = fromModelToEventAppointment(listPayments);
      } else {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    await validServices();
  }

  @action
  Future<void> validServices() async {
    if (selectedEvents.isEmpty) {
      notService = true;
    } else
      notService = false;
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<PaymentDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.datePayment);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });

    return data;
  }

  @action
  Future<void> reloadPagePayments() async {
    errorList = false;
    setListCalendarPayments();
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
