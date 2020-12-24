// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  final _$employeeDtoAtom = Atom(name: '_ScheduleStore.employeeDto');

  @override
  EmployeeDto get employeeDto {
    _$employeeDtoAtom.reportRead();
    return super.employeeDto;
  }

  @override
  set employeeDto(EmployeeDto value) {
    _$employeeDtoAtom.reportWrite(value, super.employeeDto, () {
      super.employeeDto = value;
    });
  }

  final _$calendarControllerAtom =
      Atom(name: '_ScheduleStore.calendarController');

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

  final _$dataScheduleAtom = Atom(name: '_ScheduleStore.dataSchedule');

  @override
  List<dynamic> get dataSchedule {
    _$dataScheduleAtom.reportRead();
    return super.dataSchedule;
  }

  @override
  set dataSchedule(List<dynamic> value) {
    _$dataScheduleAtom.reportWrite(value, super.dataSchedule, () {
      super.dataSchedule = value;
    });
  }

  final _$eventsAtom = Atom(name: '_ScheduleStore.events');

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

  final _$selectedEventsAtom = Atom(name: '_ScheduleStore.selectedEvents');

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

  final _$optionsMyScheduleAtom =
      Atom(name: '_ScheduleStore.optionsMySchedule');

  @override
  List<dynamic> get optionsMySchedule {
    _$optionsMyScheduleAtom.reportRead();
    return super.optionsMySchedule;
  }

  @override
  set optionsMySchedule(List<dynamic> value) {
    _$optionsMyScheduleAtom.reportWrite(value, super.optionsMySchedule, () {
      super.optionsMySchedule = value;
    });
  }

  final _$loadingPageScheduleTimeAtom =
      Atom(name: '_ScheduleStore.loadingPageScheduleTime');

  @override
  bool get loadingPageScheduleTime {
    _$loadingPageScheduleTimeAtom.reportRead();
    return super.loadingPageScheduleTime;
  }

  @override
  set loadingPageScheduleTime(bool value) {
    _$loadingPageScheduleTimeAtom
        .reportWrite(value, super.loadingPageScheduleTime, () {
      super.loadingPageScheduleTime = value;
    });
  }

  final _$infoScheduleAtom = Atom(name: '_ScheduleStore.infoSchedule');

  @override
  ScheduleDto get infoSchedule {
    _$infoScheduleAtom.reportRead();
    return super.infoSchedule;
  }

  @override
  set infoSchedule(ScheduleDto value) {
    _$infoScheduleAtom.reportWrite(value, super.infoSchedule, () {
      super.infoSchedule = value;
    });
  }

  final _$setOptionsMyScheduleAsyncAction =
      AsyncAction('_ScheduleStore.setOptionsMySchedule');

  @override
  Future<void> setOptionsMySchedule() {
    return _$setOptionsMyScheduleAsyncAction
        .run(() => super.setOptionsMySchedule());
  }

  final _$setListMyScheduleAsyncAction =
      AsyncAction('_ScheduleStore.setListMySchedule');

  @override
  Future<void> setListMySchedule() {
    return _$setListMyScheduleAsyncAction.run(() => super.setListMySchedule());
  }

  final _$loagingPageInitAsyncAction =
      AsyncAction('_ScheduleStore.loagingPageInit');

  @override
  Future<void> loagingPageInit() {
    return _$loagingPageInitAsyncAction.run(() => super.loagingPageInit());
  }

  final _$_ScheduleStoreActionController =
      ActionController(name: '_ScheduleStore');

  @override
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ScheduleDto> events) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.fromModelToEvent');
    try {
      return super.fromModelToEvent(events);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employeeDto: ${employeeDto},
calendarController: ${calendarController},
dataSchedule: ${dataSchedule},
events: ${events},
selectedEvents: ${selectedEvents},
optionsMySchedule: ${optionsMySchedule},
loadingPageScheduleTime: ${loadingPageScheduleTime},
infoSchedule: ${infoSchedule}
    ''';
  }
}
