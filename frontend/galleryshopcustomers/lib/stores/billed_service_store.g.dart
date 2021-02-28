// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billed_service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BilledServiceStore on _BilledServiceStore, Store {
  final _$listServicesAtom = Atom(name: '_BilledServiceStore.listServices');

  @override
  List<dynamic> get listServices {
    _$listServicesAtom.reportRead();
    return super.listServices;
  }

  @override
  set listServices(List<dynamic> value) {
    _$listServicesAtom.reportWrite(value, super.listServices, () {
      super.listServices = value;
    });
  }

  final _$eventsAtom = Atom(name: '_BilledServiceStore.events');

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

  final _$selectedEventsAtom = Atom(name: '_BilledServiceStore.selectedEvents');

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
      Atom(name: '_BilledServiceStore.calendarController');

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

  final _$errorListAtom = Atom(name: '_BilledServiceStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_BilledServiceStore.listEmpty');

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

  final _$setListCalendarAsyncAction =
      AsyncAction('_BilledServiceStore.setListCalendar');

  @override
  Future<void> setListCalendar() {
    return _$setListCalendarAsyncAction.run(() => super.setListCalendar());
  }

  final _$reloadPageExcludeServiceAsyncAction =
      AsyncAction('_BilledServiceStore.reloadPageExcludeService');

  @override
  Future<void> reloadPageExcludeService() {
    return _$reloadPageExcludeServiceAsyncAction
        .run(() => super.reloadPageExcludeService());
  }

  final _$_BilledServiceStoreActionController =
      ActionController(name: '_BilledServiceStore');

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<ServiceRecordDto> events) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.fromModelToEventAppointment');
    try {
      return super.fromModelToEventAppointment(events);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listServices: ${listServices},
events: ${events},
selectedEvents: ${selectedEvents},
calendarController: ${calendarController},
errorList: ${errorList},
listEmpty: ${listEmpty}
    ''';
  }
}
