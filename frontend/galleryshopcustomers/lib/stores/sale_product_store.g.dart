// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaleProductStore on _SaleProductStore, Store {
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
listSales: ${listSales},
errorList: ${errorList},
listEmpty: ${listEmpty},
events: ${events},
selectedEvents: ${selectedEvents},
calendarController: ${calendarController}
    ''';
  }
}
