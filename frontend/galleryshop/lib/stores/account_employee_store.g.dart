// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountEmployeeStore on _AccountEmployeeStore, Store {
  Computed<List<AccountEmployeeDto>> _$lisFilteredComputed;

  @override
  List<AccountEmployeeDto> get lisFiltered => (_$lisFilteredComputed ??=
          Computed<List<AccountEmployeeDto>>(() => super.lisFiltered,
              name: '_AccountEmployeeStore.lisFiltered'))
      .value;
  Computed<bool> _$valueCreditIsValidComputed;

  @override
  bool get valueCreditIsValid => (_$valueCreditIsValidComputed ??=
          Computed<bool>(() => super.valueCreditIsValid,
              name: '_AccountEmployeeStore.valueCreditIsValid'))
      .value;
  Computed<bool> _$valueDebitIsValidComputed;

  @override
  bool get valueDebitIsValid => (_$valueDebitIsValidComputed ??= Computed<bool>(
          () => super.valueDebitIsValid,
          name: '_AccountEmployeeStore.valueDebitIsValid'))
      .value;
  Computed<bool> _$valuePaidIsValidComputed;

  @override
  bool get valuePaidIsValid => (_$valuePaidIsValidComputed ??= Computed<bool>(
          () => super.valuePaidIsValid,
          name: '_AccountEmployeeStore.valuePaidIsValid'))
      .value;
  Computed<bool> _$valueMoneyIsValidComputed;

  @override
  bool get valueMoneyIsValid => (_$valueMoneyIsValidComputed ??= Computed<bool>(
          () => super.valueMoneyIsValid,
          name: '_AccountEmployeeStore.valueMoneyIsValid'))
      .value;
  Computed<bool> _$fieldsCloseAccountIsValidComputed;

  @override
  bool get fieldsCloseAccountIsValid => (_$fieldsCloseAccountIsValidComputed ??=
          Computed<bool>(() => super.fieldsCloseAccountIsValid,
              name: '_AccountEmployeeStore.fieldsCloseAccountIsValid'))
      .value;
  Computed<Function> _$buttonCloseAccountPressedComputed;

  @override
  Function get buttonCloseAccountPressed =>
      (_$buttonCloseAccountPressedComputed ??= Computed<Function>(
              () => super.buttonCloseAccountPressed,
              name: '_AccountEmployeeStore.buttonCloseAccountPressed'))
          .value;
  Computed<bool> _$quantityIsValidComputed;

  @override
  bool get quantityIsValid =>
      (_$quantityIsValidComputed ??= Computed<bool>(() => super.quantityIsValid,
              name: '_AccountEmployeeStore.quantityIsValid'))
          .value;
  Computed<bool> _$fieldsSaleIsValidComputed;

  @override
  bool get fieldsSaleIsValid => (_$fieldsSaleIsValidComputed ??= Computed<bool>(
          () => super.fieldsSaleIsValid,
          name: '_AccountEmployeeStore.fieldsSaleIsValid'))
      .value;
  Computed<bool> _$productIsValidComputed;

  @override
  bool get productIsValid =>
      (_$productIsValidComputed ??= Computed<bool>(() => super.productIsValid,
              name: '_AccountEmployeeStore.productIsValid'))
          .value;
  Computed<Function> _$buttonRegisterSalePressedComputed;

  @override
  Function get buttonRegisterSalePressed =>
      (_$buttonRegisterSalePressedComputed ??= Computed<Function>(
              () => super.buttonRegisterSalePressed,
              name: '_AccountEmployeeStore.buttonRegisterSalePressed'))
          .value;
  Computed<Function> _$buttonUpdateSalePressedComputed;

  @override
  Function get buttonUpdateSalePressed => (_$buttonUpdateSalePressedComputed ??=
          Computed<Function>(() => super.buttonUpdateSalePressed,
              name: '_AccountEmployeeStore.buttonUpdateSalePressed'))
      .value;

  final _$listClientAtom = Atom(name: '_AccountEmployeeStore.listClient');

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

  final _$filterAtom = Atom(name: '_AccountEmployeeStore.filter');

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

  final _$loadingAtom = Atom(name: '_AccountEmployeeStore.loading');

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

  final _$errorListAtom = Atom(name: '_AccountEmployeeStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_AccountEmployeeStore.listEmpty');

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
      Atom(name: '_AccountEmployeeStore.listAccountClient');

  @override
  ObservableList<AccountEmployeeDto> get listAccountClient {
    _$listAccountClientAtom.reportRead();
    return super.listAccountClient;
  }

  @override
  set listAccountClient(ObservableList<AccountEmployeeDto> value) {
    _$listAccountClientAtom.reportWrite(value, super.listAccountClient, () {
      super.listAccountClient = value;
    });
  }

  final _$accountClientDtoAtom =
      Atom(name: '_AccountEmployeeStore.accountClientDto');

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
      Atom(name: '_AccountEmployeeStore.accountEmployeeDto');

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
      Atom(name: '_AccountEmployeeStore.balanceNegative');

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

  final _$balanceZeroAtom = Atom(name: '_AccountEmployeeStore.balanceZero');

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

  final _$totalPayableAtom = Atom(name: '_AccountEmployeeStore.totalPayable');

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

  final _$eventsAtom = Atom(name: '_AccountEmployeeStore.events');

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

  final _$selectedEventsAtom =
      Atom(name: '_AccountEmployeeStore.selectedEvents');

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
      Atom(name: '_AccountEmployeeStore.selectedEventsSales');

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
      Atom(name: '_AccountEmployeeStore.calendarController');

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

  final _$events2Atom = Atom(name: '_AccountEmployeeStore.events2');

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

  final _$amountDayAtom = Atom(name: '_AccountEmployeeStore.amountDay');

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

  final _$discountDayAtom = Atom(name: '_AccountEmployeeStore.discountDay');

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
      Atom(name: '_AccountEmployeeStore.amountPayableServices');

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
      Atom(name: '_AccountEmployeeStore.amountPayableSales');

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

  final _$notServiceAtom = Atom(name: '_AccountEmployeeStore.notService');

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

  final _$notSaleAtom = Atom(name: '_AccountEmployeeStore.notSale');

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

  final _$valueTodayAtom = Atom(name: '_AccountEmployeeStore.valueToday');

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

  final _$totalDayAtom = Atom(name: '_AccountEmployeeStore.totalDay');

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

  final _$cardAtom = Atom(name: '_AccountEmployeeStore.card');

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

  final _$moneyAtom = Atom(name: '_AccountEmployeeStore.money');

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

  final _$debitAtom = Atom(name: '_AccountEmployeeStore.debit');

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

  final _$creditAtom = Atom(name: '_AccountEmployeeStore.credit');

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

  final _$habilitPaidAtom = Atom(name: '_AccountEmployeeStore.habilitPaid');

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

  final _$sendingAtom = Atom(name: '_AccountEmployeeStore.sending');

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

  final _$listFlagCardsAtom = Atom(name: '_AccountEmployeeStore.listFlagCards');

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
      Atom(name: '_AccountEmployeeStore.flagCardPaymentDto');

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
      Atom(name: '_AccountEmployeeStore.valueSelectFlag');

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
      Atom(name: '_AccountEmployeeStore.flagCardPaymentDtoOK');

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
      Atom(name: '_AccountEmployeeStore.controllerFieldValuePaidOut');

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

  final _$paidOutAtom = Atom(name: '_AccountEmployeeStore.paidOut');

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

  final _$closeAccountOKAtom =
      Atom(name: '_AccountEmployeeStore.closeAccountOK');

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
      Atom(name: '_AccountEmployeeStore.closeAccountError');

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

  final _$listPaymentsAtom = Atom(name: '_AccountEmployeeStore.listPayments');

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

  final _$listProductsAtom = Atom(name: '_AccountEmployeeStore.listProducts');

  @override
  List<dynamic> get listProducts {
    _$listProductsAtom.reportRead();
    return super.listProducts;
  }

  @override
  set listProducts(List<dynamic> value) {
    _$listProductsAtom.reportWrite(value, super.listProducts, () {
      super.listProducts = value;
    });
  }

  final _$valueSelectProductAtom =
      Atom(name: '_AccountEmployeeStore.valueSelectProduct');

  @override
  int get valueSelectProduct {
    _$valueSelectProductAtom.reportRead();
    return super.valueSelectProduct;
  }

  @override
  set valueSelectProduct(int value) {
    _$valueSelectProductAtom.reportWrite(value, super.valueSelectProduct, () {
      super.valueSelectProduct = value;
    });
  }

  final _$controllerFieldValueProductAtom =
      Atom(name: '_AccountEmployeeStore.controllerFieldValueProduct');

  @override
  TextEditingController get controllerFieldValueProduct {
    _$controllerFieldValueProductAtom.reportRead();
    return super.controllerFieldValueProduct;
  }

  @override
  set controllerFieldValueProduct(TextEditingController value) {
    _$controllerFieldValueProductAtom
        .reportWrite(value, super.controllerFieldValueProduct, () {
      super.controllerFieldValueProduct = value;
    });
  }

  final _$controllerFieldQtdProductAtom =
      Atom(name: '_AccountEmployeeStore.controllerFieldQtdProduct');

  @override
  TextEditingController get controllerFieldQtdProduct {
    _$controllerFieldQtdProductAtom.reportRead();
    return super.controllerFieldQtdProduct;
  }

  @override
  set controllerFieldQtdProduct(TextEditingController value) {
    _$controllerFieldQtdProductAtom
        .reportWrite(value, super.controllerFieldQtdProduct, () {
      super.controllerFieldQtdProduct = value;
    });
  }

  final _$quantityAtom = Atom(name: '_AccountEmployeeStore.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$valueProductAtom = Atom(name: '_AccountEmployeeStore.valueProduct');

  @override
  double get valueProduct {
    _$valueProductAtom.reportRead();
    return super.valueProduct;
  }

  @override
  set valueProduct(double value) {
    _$valueProductAtom.reportWrite(value, super.valueProduct, () {
      super.valueProduct = value;
    });
  }

  final _$createdAtom = Atom(name: '_AccountEmployeeStore.created');

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

  final _$updateProductAtom = Atom(name: '_AccountEmployeeStore.updateProduct');

  @override
  bool get updateProduct {
    _$updateProductAtom.reportRead();
    return super.updateProduct;
  }

  @override
  set updateProduct(bool value) {
    _$updateProductAtom.reportWrite(value, super.updateProduct, () {
      super.updateProduct = value;
    });
  }

  final _$errorSendingAtom = Atom(name: '_AccountEmployeeStore.errorSending');

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

  final _$changeAtom = Atom(name: '_AccountEmployeeStore.change');

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

  final _$productDifAtom = Atom(name: '_AccountEmployeeStore.productDif');

  @override
  bool get productDif {
    _$productDifAtom.reportRead();
    return super.productDif;
  }

  @override
  set productDif(bool value) {
    _$productDifAtom.reportWrite(value, super.productDif, () {
      super.productDif = value;
    });
  }

  final _$updatedUnauthorizedAtom =
      Atom(name: '_AccountEmployeeStore.updatedUnauthorized');

  @override
  bool get updatedUnauthorized {
    _$updatedUnauthorizedAtom.reportRead();
    return super.updatedUnauthorized;
  }

  @override
  set updatedUnauthorized(bool value) {
    _$updatedUnauthorizedAtom.reportWrite(value, super.updatedUnauthorized, () {
      super.updatedUnauthorized = value;
    });
  }

  final _$setListAsyncAction = AsyncAction('_AccountEmployeeStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  final _$getEmployeeAsyncAction =
      AsyncAction('_AccountEmployeeStore.getEmployee');

  @override
  Future<void> getEmployee() {
    return _$getEmployeeAsyncAction.run(() => super.getEmployee());
  }

  final _$iniPageEmployeeAsyncAction =
      AsyncAction('_AccountEmployeeStore.iniPageEmployee');

  @override
  Future<void> iniPageEmployee() {
    return _$iniPageEmployeeAsyncAction.run(() => super.iniPageEmployee());
  }

  final _$calculateTotalPayableAsyncAction =
      AsyncAction('_AccountEmployeeStore.calculateTotalPayable');

  @override
  Future<void> calculateTotalPayable() {
    return _$calculateTotalPayableAsyncAction
        .run(() => super.calculateTotalPayable());
  }

  final _$setCalendarAsyncAction =
      AsyncAction('_AccountEmployeeStore.setCalendar');

  @override
  Future<void> setCalendar() {
    return _$setCalendarAsyncAction.run(() => super.setCalendar());
  }

  final _$reloadListAsyncAction =
      AsyncAction('_AccountEmployeeStore.reloadList');

  @override
  Future<void> reloadList() {
    return _$reloadListAsyncAction.run(() => super.reloadList());
  }

  final _$getListFlagsCardsAsyncAction =
      AsyncAction('_AccountEmployeeStore.getListFlagsCards');

  @override
  Future<void> getListFlagsCards() {
    return _$getListFlagsCardsAsyncAction.run(() => super.getListFlagsCards());
  }

  final _$iniPageCloseAccountAsyncAction =
      AsyncAction('_AccountEmployeeStore.iniPageCloseAccount');

  @override
  Future<void> iniPageCloseAccount() {
    return _$iniPageCloseAccountAsyncAction
        .run(() => super.iniPageCloseAccount());
  }

  final _$closeAccountAsyncAction =
      AsyncAction('_AccountEmployeeStore.closeAccount');

  @override
  Future<void> closeAccount() {
    return _$closeAccountAsyncAction.run(() => super.closeAccount());
  }

  final _$setListCalendarPaymentsAsyncAction =
      AsyncAction('_AccountEmployeeStore.setListCalendarPayments');

  @override
  Future<void> setListCalendarPayments() {
    return _$setListCalendarPaymentsAsyncAction
        .run(() => super.setListCalendarPayments());
  }

  final _$validServicesAsyncAction =
      AsyncAction('_AccountEmployeeStore.validServices');

  @override
  Future<void> validServices() {
    return _$validServicesAsyncAction.run(() => super.validServices());
  }

  final _$reloadPagePaymentsAsyncAction =
      AsyncAction('_AccountEmployeeStore.reloadPagePayments');

  @override
  Future<void> reloadPagePayments() {
    return _$reloadPagePaymentsAsyncAction
        .run(() => super.reloadPagePayments());
  }

  final _$setDataInitialRegisterSaleAsyncAction =
      AsyncAction('_AccountEmployeeStore.setDataInitialRegisterSale');

  @override
  Future<void> setDataInitialRegisterSale() {
    return _$setDataInitialRegisterSaleAsyncAction
        .run(() => super.setDataInitialRegisterSale());
  }

  final _$setValueProductAsyncAction =
      AsyncAction('_AccountEmployeeStore.setValueProduct');

  @override
  Future<void> setValueProduct(int value) {
    return _$setValueProductAsyncAction.run(() => super.setValueProduct(value));
  }

  final _$registerSaleAsyncAction =
      AsyncAction('_AccountEmployeeStore.registerSale');

  @override
  Future<void> registerSale() {
    return _$registerSaleAsyncAction.run(() => super.registerSale());
  }

  final _$initEditSaleAsyncAction =
      AsyncAction('_AccountEmployeeStore.initEditSale');

  @override
  Future<void> initEditSale() {
    return _$initEditSaleAsyncAction.run(() => super.initEditSale());
  }

  final _$updateSaleAsyncAction =
      AsyncAction('_AccountEmployeeStore.updateSale');

  @override
  Future<void> updateSale() {
    return _$updateSaleAsyncAction.run(() => super.updateSale());
  }

  final _$_AccountEmployeeStoreActionController =
      ActionController(name: '_AccountEmployeeStore');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListAccountClient() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setListAccountClient');
    try {
      return super.setListAccountClient();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ServiceRecordDto> events) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.fromModelToEvent');
    try {
      return super.fromModelToEvent(events);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEventProduct(List<SaleDto> events) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.fromModelToEventProduct');
    try {
      return super.fromModelToEventProduct(events);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.calculateTotalAndSetSelectEvents');
    try {
      return super.calculateTotalAndSetSelectEvents(events);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEventsSales(DateTime date) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setSelectedEventsSales');
    try {
      return super.setSelectedEventsSales(date);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalSales() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.calculateTotalSales');
    try {
      return super.calculateTotalSales();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalDay() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.calculateTotalDay');
    try {
      return super.calculateTotalDay();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterCard() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.alterCard');
    try {
      return super.alterCard();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterMoney() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.alterMoney');
    try {
      return super.alterMoney();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterCredit() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.alterCredit');
    try {
      return super.alterCredit();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterDebit() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.alterDebit');
    try {
      return super.alterDebit();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaidOut(String value) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setPaidOut');
    try {
      return super.setPaidOut(value);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueSelectFlag(int value) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setValueSelectFlag');
    try {
      return super.setValueSelectFlag(value);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValuesCards() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setValuesCards');
    try {
      return super.setValuesCards();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<PaymentDto> events) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.fromModelToEventAppointment');
    try {
      return super.fromModelToEventAppointment(events);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(String price) {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setValue');
    try {
      return super.setValue(price);
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setControllerValue() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setControllerValue');
    try {
      return super.setControllerValue();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionProductSold() {
    final _$actionInfo = _$_AccountEmployeeStoreActionController.startAction(
        name: '_AccountEmployeeStore.setDescriptionProductSold');
    try {
      return super.setDescriptionProductSold();
    } finally {
      _$_AccountEmployeeStoreActionController.endAction(_$actionInfo);
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
accountEmployeeDto: ${accountEmployeeDto},
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
listProducts: ${listProducts},
valueSelectProduct: ${valueSelectProduct},
controllerFieldValueProduct: ${controllerFieldValueProduct},
controllerFieldQtdProduct: ${controllerFieldQtdProduct},
quantity: ${quantity},
valueProduct: ${valueProduct},
created: ${created},
updateProduct: ${updateProduct},
errorSending: ${errorSending},
change: ${change},
productDif: ${productDif},
updatedUnauthorized: ${updatedUnauthorized},
lisFiltered: ${lisFiltered},
valueCreditIsValid: ${valueCreditIsValid},
valueDebitIsValid: ${valueDebitIsValid},
valuePaidIsValid: ${valuePaidIsValid},
valueMoneyIsValid: ${valueMoneyIsValid},
fieldsCloseAccountIsValid: ${fieldsCloseAccountIsValid},
buttonCloseAccountPressed: ${buttonCloseAccountPressed},
quantityIsValid: ${quantityIsValid},
fieldsSaleIsValid: ${fieldsSaleIsValid},
productIsValid: ${productIsValid},
buttonRegisterSalePressed: ${buttonRegisterSalePressed},
buttonUpdateSalePressed: ${buttonUpdateSalePressed}
    ''';
  }
}
