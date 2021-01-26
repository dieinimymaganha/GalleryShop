// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaleProductStore on _SaleProductStore, Store {
  Computed<Function> _$buttonExcludePressedComputed;

  @override
  Function get buttonExcludePressed => (_$buttonExcludePressedComputed ??=
          Computed<Function>(() => super.buttonExcludePressed,
              name: '_SaleProductStore.buttonExcludePressed'))
      .value;

  final _$eventsAtom = Atom(name: '_SaleProductStore.events');

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

  final _$listSalesAtom = Atom(name: '_SaleProductStore.listSales');

  @override
  List<dynamic> get listSales {
    _$listSalesAtom.reportRead();
    return super.listSales;
  }

  @override
  set listSales(List<dynamic> value) {
    _$listSalesAtom.reportWrite(value, super.listSales, () {
      super.listSales = value;
    });
  }

  final _$selectedEventsAtom = Atom(name: '_SaleProductStore.selectedEvents');

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

  final _$errorListAtom = Atom(name: '_SaleProductStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_SaleProductStore.listEmpty');

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

  final _$calendarControllerAtom =
      Atom(name: '_SaleProductStore.calendarController');

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

  final _$sendingAtom = Atom(name: '_SaleProductStore.sending');

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

  final _$excludedAtom = Atom(name: '_SaleProductStore.excluded');

  @override
  bool get excluded {
    _$excludedAtom.reportRead();
    return super.excluded;
  }

  @override
  set excluded(bool value) {
    _$excludedAtom.reportWrite(value, super.excluded, () {
      super.excluded = value;
    });
  }

  final _$excludedUnauthorizedAtom =
      Atom(name: '_SaleProductStore.excludedUnauthorized');

  @override
  bool get excludedUnauthorized {
    _$excludedUnauthorizedAtom.reportRead();
    return super.excludedUnauthorized;
  }

  @override
  set excludedUnauthorized(bool value) {
    _$excludedUnauthorizedAtom.reportWrite(value, super.excludedUnauthorized,
        () {
      super.excludedUnauthorized = value;
    });
  }

  final _$excludedFailAtom = Atom(name: '_SaleProductStore.excludedFail');

  @override
  bool get excludedFail {
    _$excludedFailAtom.reportRead();
    return super.excludedFail;
  }

  @override
  set excludedFail(bool value) {
    _$excludedFailAtom.reportWrite(value, super.excludedFail, () {
      super.excludedFail = value;
    });
  }

  final _$setListCalendarAsyncAction =
      AsyncAction('_SaleProductStore.setListCalendar');

  @override
  Future<void> setListCalendar() {
    return _$setListCalendarAsyncAction.run(() => super.setListCalendar());
  }

  final _$reloadPageSalesAsyncAction =
      AsyncAction('_SaleProductStore.reloadPageSales');

  @override
  Future<void> reloadPageSales() {
    return _$reloadPageSalesAsyncAction.run(() => super.reloadPageSales());
  }

  final _$excludeSaleAsyncAction = AsyncAction('_SaleProductStore.excludeSale');

  @override
  Future<void> excludeSale() {
    return _$excludeSaleAsyncAction.run(() => super.excludeSale());
  }

  final _$_SaleProductStoreActionController =
      ActionController(name: '_SaleProductStore');

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<SaleDto> events) {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.fromModelToEventAppointment');
    try {
      return super.fromModelToEventAppointment(events);
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events},
listSales: ${listSales},
selectedEvents: ${selectedEvents},
errorList: ${errorList},
listEmpty: ${listEmpty},
calendarController: ${calendarController},
sending: ${sending},
excluded: ${excluded},
excludedUnauthorized: ${excludedUnauthorized},
excludedFail: ${excludedFail},
buttonExcludePressed: ${buttonExcludePressed}
    ''';
  }
}
