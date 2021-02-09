// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountClientStore on _AccountClientStore, Store {
  Computed<List<AccountClientDto>> _$lisFilteredComputed;

  @override
  List<AccountClientDto> get lisFiltered => (_$lisFilteredComputed ??=
          Computed<List<AccountClientDto>>(() => super.lisFiltered,
              name: '_AccountClientStore.lisFiltered'))
      .value;
  Computed<bool> _$valueCreditIsValidComputed;

  @override
  bool get valueCreditIsValid => (_$valueCreditIsValidComputed ??=
          Computed<bool>(() => super.valueCreditIsValid,
              name: '_AccountClientStore.valueCreditIsValid'))
      .value;
  Computed<bool> _$valueDebitIsValidComputed;

  @override
  bool get valueDebitIsValid => (_$valueDebitIsValidComputed ??= Computed<bool>(
          () => super.valueDebitIsValid,
          name: '_AccountClientStore.valueDebitIsValid'))
      .value;
  Computed<bool> _$valuePaidIsValidComputed;

  @override
  bool get valuePaidIsValid => (_$valuePaidIsValidComputed ??= Computed<bool>(
          () => super.valuePaidIsValid,
          name: '_AccountClientStore.valuePaidIsValid'))
      .value;
  Computed<bool> _$valueMoneyIsValidComputed;

  @override
  bool get valueMoneyIsValid => (_$valueMoneyIsValidComputed ??= Computed<bool>(
          () => super.valueMoneyIsValid,
          name: '_AccountClientStore.valueMoneyIsValid'))
      .value;
  Computed<bool> _$fieldsCloseAccountIsValidComputed;

  @override
  bool get fieldsCloseAccountIsValid => (_$fieldsCloseAccountIsValidComputed ??=
          Computed<bool>(() => super.fieldsCloseAccountIsValid,
              name: '_AccountClientStore.fieldsCloseAccountIsValid'))
      .value;
  Computed<Function> _$buttonCloseAccountPressedComputed;

  @override
  Function get buttonCloseAccountPressed =>
      (_$buttonCloseAccountPressedComputed ??= Computed<Function>(
              () => super.buttonCloseAccountPressed,
              name: '_AccountClientStore.buttonCloseAccountPressed'))
          .value;

  final _$listClientAtom = Atom(name: '_AccountClientStore.listClient');

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

  final _$filterAtom = Atom(name: '_AccountClientStore.filter');

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

  final _$loadingAtom = Atom(name: '_AccountClientStore.loading');

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

  final _$errorListAtom = Atom(name: '_AccountClientStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_AccountClientStore.listEmpty');

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

  final _$listAccountClientAtom =
      Atom(name: '_AccountClientStore.listAccountClient');

  @override
  ObservableList<AccountClientDto> get listAccountClient {
    _$listAccountClientAtom.reportRead();
    return super.listAccountClient;
  }

  @override
  set listAccountClient(ObservableList<AccountClientDto> value) {
    _$listAccountClientAtom.reportWrite(value, super.listAccountClient, () {
      super.listAccountClient = value;
    });
  }

  final _$accountClientDtoAtom =
      Atom(name: '_AccountClientStore.accountClientDto');

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

  final _$balanceNegativeAtom =
      Atom(name: '_AccountClientStore.balanceNegative');

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

  final _$balanceZeroAtom = Atom(name: '_AccountClientStore.balanceZero');

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

  final _$totalPayableAtom = Atom(name: '_AccountClientStore.totalPayable');

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

  final _$eventsAtom = Atom(name: '_AccountClientStore.events');

  @override
  Map<DateTime, List<dynamic>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(Map<DateTime, List<dynamic>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$selectedEventsAtom = Atom(name: '_AccountClientStore.selectedEvents');

  @override
  List<dynamic> get selectedEvents {
    _$selectedEventsAtom.reportRead();
    return super.selectedEvents;
  }

  @override
  set selectedEvents(List<dynamic> value) {
    _$selectedEventsAtom.reportWrite(value, super.selectedEvents, () {
      super.selectedEvents = value;
    });
  }

  final _$selectedEventsSalesAtom =
      Atom(name: '_AccountClientStore.selectedEventsSales');

  @override
  List<dynamic> get selectedEventsSales {
    _$selectedEventsSalesAtom.reportRead();
    return super.selectedEventsSales;
  }

  @override
  set selectedEventsSales(List<dynamic> value) {
    _$selectedEventsSalesAtom.reportWrite(value, super.selectedEventsSales, () {
      super.selectedEventsSales = value;
    });
  }

  final _$calendarControllerAtom =
      Atom(name: '_AccountClientStore.calendarController');

  @override
  CalendarController get calendarController {
    _$calendarControllerAtom.reportRead();
    return super.calendarController;
  }

  @override
  set calendarController(CalendarController value) {
    _$calendarControllerAtom.reportWrite(value, super.calendarController, () {
      super.calendarController = value;
    });
  }

  final _$events2Atom = Atom(name: '_AccountClientStore.events2');

  @override
  Map<DateTime, List<dynamic>> get events2 {
    _$events2Atom.reportRead();
    return super.events2;
  }

  @override
  set events2(Map<DateTime, List<dynamic>> value) {
    _$events2Atom.reportWrite(value, super.events2, () {
      super.events2 = value;
    });
  }

  final _$amountDayAtom = Atom(name: '_AccountClientStore.amountDay');

  @override
  double get amountDay {
    _$amountDayAtom.reportRead();
    return super.amountDay;
  }

  @override
  set amountDay(double value) {
    _$amountDayAtom.reportWrite(value, super.amountDay, () {
      super.amountDay = value;
    });
  }

  final _$discountDayAtom = Atom(name: '_AccountClientStore.discountDay');

  @override
  double get discountDay {
    _$discountDayAtom.reportRead();
    return super.discountDay;
  }

  @override
  set discountDay(double value) {
    _$discountDayAtom.reportWrite(value, super.discountDay, () {
      super.discountDay = value;
    });
  }

  final _$amountPayableServicesAtom =
      Atom(name: '_AccountClientStore.amountPayableServices');

  @override
  double get amountPayableServices {
    _$amountPayableServicesAtom.reportRead();
    return super.amountPayableServices;
  }

  @override
  set amountPayableServices(double value) {
    _$amountPayableServicesAtom.reportWrite(value, super.amountPayableServices,
        () {
      super.amountPayableServices = value;
    });
  }

  final _$amountPayableSalesAtom =
      Atom(name: '_AccountClientStore.amountPayableSales');

  @override
  double get amountPayableSales {
    _$amountPayableSalesAtom.reportRead();
    return super.amountPayableSales;
  }

  @override
  set amountPayableSales(double value) {
    _$amountPayableSalesAtom.reportWrite(value, super.amountPayableSales, () {
      super.amountPayableSales = value;
    });
  }

  final _$notServiceAtom = Atom(name: '_AccountClientStore.notService');

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

  final _$notSaleAtom = Atom(name: '_AccountClientStore.notSale');

  @override
  bool get notSale {
    _$notSaleAtom.reportRead();
    return super.notSale;
  }

  @override
  set notSale(bool value) {
    _$notSaleAtom.reportWrite(value, super.notSale, () {
      super.notSale = value;
    });
  }

  final _$valueTodayAtom = Atom(name: '_AccountClientStore.valueToday');

  @override
  bool get valueToday {
    _$valueTodayAtom.reportRead();
    return super.valueToday;
  }

  @override
  set valueToday(bool value) {
    _$valueTodayAtom.reportWrite(value, super.valueToday, () {
      super.valueToday = value;
    });
  }

  final _$totalDayAtom = Atom(name: '_AccountClientStore.totalDay');

  @override
  double get totalDay {
    _$totalDayAtom.reportRead();
    return super.totalDay;
  }

  @override
  set totalDay(double value) {
    _$totalDayAtom.reportWrite(value, super.totalDay, () {
      super.totalDay = value;
    });
  }

  final _$cardAtom = Atom(name: '_AccountClientStore.card');

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

  final _$moneyAtom = Atom(name: '_AccountClientStore.money');

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

  final _$debitAtom = Atom(name: '_AccountClientStore.debit');

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

  final _$creditAtom = Atom(name: '_AccountClientStore.credit');

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

  final _$habilitPaidAtom = Atom(name: '_AccountClientStore.habilitPaid');

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

  final _$sendingAtom = Atom(name: '_AccountClientStore.sending');

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

  final _$listFlagCardsAtom = Atom(name: '_AccountClientStore.listFlagCards');

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
      Atom(name: '_AccountClientStore.flagCardPaymentDto');

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
      Atom(name: '_AccountClientStore.valueSelectFlag');

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
      Atom(name: '_AccountClientStore.flagCardPaymentDtoOK');

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
      Atom(name: '_AccountClientStore.controllerFieldValuePaidOut');

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

  final _$paidOutAtom = Atom(name: '_AccountClientStore.paidOut');

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

  final _$closeAccountOKAtom = Atom(name: '_AccountClientStore.closeAccountOK');

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
      Atom(name: '_AccountClientStore.closeAccountError');

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

  final _$listPaymentsAtom = Atom(name: '_AccountClientStore.listPayments');

  @override
  List<dynamic> get listPayments {
    _$listPaymentsAtom.reportRead();
    return super.listPayments;
  }

  @override
  set listPayments(List<dynamic> value) {
    _$listPaymentsAtom.reportWrite(value, super.listPayments, () {
      super.listPayments = value;
    });
  }

  final _$setListAsyncAction = AsyncAction('_AccountClientStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  final _$getClientAsyncAction = AsyncAction('_AccountClientStore.getClient');

  @override
  Future<void> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$iniPageClientAsyncAction =
      AsyncAction('_AccountClientStore.iniPageClient');

  @override
  Future<void> iniPageClient() {
    return _$iniPageClientAsyncAction.run(() => super.iniPageClient());
  }

  final _$calculateTotalPayableAsyncAction =
      AsyncAction('_AccountClientStore.calculateTotalPayable');

  @override
  Future<void> calculateTotalPayable() {
    return _$calculateTotalPayableAsyncAction
        .run(() => super.calculateTotalPayable());
  }

  final _$setCalendarAsyncAction =
      AsyncAction('_AccountClientStore.setCalendar');

  @override
  Future<void> setCalendar() {
    return _$setCalendarAsyncAction.run(() => super.setCalendar());
  }

  final _$reloadListAsyncAction = AsyncAction('_AccountClientStore.reloadList');

  @override
  Future<void> reloadList() {
    return _$reloadListAsyncAction.run(() => super.reloadList());
  }

  final _$getListFlagsCardsAsyncAction =
      AsyncAction('_AccountClientStore.getListFlagsCards');

  @override
  Future<void> getListFlagsCards() {
    return _$getListFlagsCardsAsyncAction.run(() => super.getListFlagsCards());
  }

  final _$iniPageCloseAccountAsyncAction =
      AsyncAction('_AccountClientStore.iniPageCloseAccount');

  @override
  Future<void> iniPageCloseAccount() {
    return _$iniPageCloseAccountAsyncAction
        .run(() => super.iniPageCloseAccount());
  }

  final _$closeAccountAsyncAction =
      AsyncAction('_AccountClientStore.closeAccount');

  @override
  Future<void> closeAccount() {
    return _$closeAccountAsyncAction.run(() => super.closeAccount());
  }

  final _$setListCalendarPaymentsAsyncAction =
      AsyncAction('_AccountClientStore.setListCalendarPayments');

  @override
  Future<void> setListCalendarPayments() {
    return _$setListCalendarPaymentsAsyncAction
        .run(() => super.setListCalendarPayments());
  }

  final _$validServicesAsyncAction =
      AsyncAction('_AccountClientStore.validServices');

  @override
  Future<void> validServices() {
    return _$validServicesAsyncAction.run(() => super.validServices());
  }

  final _$reloadPagePaymentsAsyncAction =
      AsyncAction('_AccountClientStore.reloadPagePayments');

  @override
  Future<void> reloadPagePayments() {
    return _$reloadPagePaymentsAsyncAction
        .run(() => super.reloadPagePayments());
  }

  final _$_AccountClientStoreActionController =
      ActionController(name: '_AccountClientStore');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListAccountClient() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setListAccountClient');
    try {
      return super.setListAccountClient();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ServiceRecordDto> events) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.fromModelToEvent');
    try {
      return super.fromModelToEvent(events);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEventProduct(List<SaleDto> events) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.fromModelToEventProduct');
    try {
      return super.fromModelToEventProduct(events);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.calculateTotalAndSetSelectEvents');
    try {
      return super.calculateTotalAndSetSelectEvents(events);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEventsSales(DateTime date) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setSelectedEventsSales');
    try {
      return super.setSelectedEventsSales(date);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalSales() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.calculateTotalSales');
    try {
      return super.calculateTotalSales();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalDay() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.calculateTotalDay');
    try {
      return super.calculateTotalDay();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterCard() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.alterCard');
    try {
      return super.alterCard();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterMoney() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.alterMoney');
    try {
      return super.alterMoney();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterCredit() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.alterCredit');
    try {
      return super.alterCredit();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterDebit() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.alterDebit');
    try {
      return super.alterDebit();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaidOut(String value) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setPaidOut');
    try {
      return super.setPaidOut(value);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueSelectFlag(int value) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setValueSelectFlag');
    try {
      return super.setValueSelectFlag(value);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValuesCards() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setValuesCards');
    try {
      return super.setValuesCards();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<PaymentDto> events) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.fromModelToEventAppointment');
    try {
      return super.fromModelToEventAppointment(events);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listClient: ${listClient},
filter: ${filter},
loading: ${loading},
errorList: ${errorList},
listEmpty: ${listEmpty},
listAccountClient: ${listAccountClient},
accountClientDto: ${accountClientDto},
balanceNegative: ${balanceNegative},
balanceZero: ${balanceZero},
totalPayable: ${totalPayable},
events: ${events},
selectedEvents: ${selectedEvents},
selectedEventsSales: ${selectedEventsSales},
calendarController: ${calendarController},
events2: ${events2},
amountDay: ${amountDay},
discountDay: ${discountDay},
amountPayableServices: ${amountPayableServices},
amountPayableSales: ${amountPayableSales},
notService: ${notService},
notSale: ${notSale},
valueToday: ${valueToday},
totalDay: ${totalDay},
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
closeAccountOK: ${closeAccountOK},
closeAccountError: ${closeAccountError},
listPayments: ${listPayments},
lisFiltered: ${lisFiltered},
valueCreditIsValid: ${valueCreditIsValid},
valueDebitIsValid: ${valueDebitIsValid},
valuePaidIsValid: ${valuePaidIsValid},
valueMoneyIsValid: ${valueMoneyIsValid},
fieldsCloseAccountIsValid: ${fieldsCloseAccountIsValid},
buttonCloseAccountPressed: ${buttonCloseAccountPressed}
    ''';
  }
}
