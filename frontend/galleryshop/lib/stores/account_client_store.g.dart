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

  final _$amountPayableAtom = Atom(name: '_AccountClientStore.amountPayable');

  @override
  double get amountPayable {
    _$amountPayableAtom.reportRead();
    return super.amountPayable;
  }

  @override
  set amountPayable(double value) {
    _$amountPayableAtom.reportWrite(value, super.amountPayable, () {
      super.amountPayable = value;
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
  void calculateTotalAndSetselectEvents(List<dynamic> events) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.calculateTotalAndSetselectEvents');
    try {
      return super.calculateTotalAndSetselectEvents(events);
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
events: ${events},
selectedEvents: ${selectedEvents},
calendarController: ${calendarController},
amountDay: ${amountDay},
discountDay: ${discountDay},
amountPayable: ${amountPayable},
notService: ${notService},
lisFiltered: ${lisFiltered}
    ''';
  }
}
