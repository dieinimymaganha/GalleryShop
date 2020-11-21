// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_ScheduleStore.sendPressed'))
          .value;

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

  final _$dataServicesAtom = Atom(name: '_ScheduleStore.dataServices');

  @override
  List<dynamic> get dataServices {
    _$dataServicesAtom.reportRead();
    return super.dataServices;
  }

  @override
  set dataServices(List<dynamic> value) {
    _$dataServicesAtom.reportWrite(value, super.dataServices, () {
      super.dataServices = value;
    });
  }

  final _$listEmployeeAtom = Atom(name: '_ScheduleStore.listEmployee');

  @override
  List<dynamic> get listEmployee {
    _$listEmployeeAtom.reportRead();
    return super.listEmployee;
  }

  @override
  set listEmployee(List<dynamic> value) {
    _$listEmployeeAtom.reportWrite(value, super.listEmployee, () {
      super.listEmployee = value;
    });
  }

  final _$idFindEmployeeAtom = Atom(name: '_ScheduleStore.idFindEmployee');

  @override
  int get idFindEmployee {
    _$idFindEmployeeAtom.reportRead();
    return super.idFindEmployee;
  }

  @override
  set idFindEmployee(int value) {
    _$idFindEmployeeAtom.reportWrite(value, super.idFindEmployee, () {
      super.idFindEmployee = value;
    });
  }

  final _$valueSelectEmployeeAtom =
      Atom(name: '_ScheduleStore.valueSelectEmployee');

  @override
  int get valueSelectEmployee {
    _$valueSelectEmployeeAtom.reportRead();
    return super.valueSelectEmployee;
  }

  @override
  set valueSelectEmployee(int value) {
    _$valueSelectEmployeeAtom.reportWrite(value, super.valueSelectEmployee, () {
      super.valueSelectEmployee = value;
    });
  }

  final _$loadingListEmployeeAtom =
      Atom(name: '_ScheduleStore.loadingListEmployee');

  @override
  bool get loadingListEmployee {
    _$loadingListEmployeeAtom.reportRead();
    return super.loadingListEmployee;
  }

  @override
  set loadingListEmployee(bool value) {
    _$loadingListEmployeeAtom.reportWrite(value, super.loadingListEmployee, () {
      super.loadingListEmployee = value;
    });
  }

  final _$valueSelectAtom = Atom(name: '_ScheduleStore.valueSelect');

  @override
  String get valueSelect {
    _$valueSelectAtom.reportRead();
    return super.valueSelect;
  }

  @override
  set valueSelect(String value) {
    _$valueSelectAtom.reportWrite(value, super.valueSelect, () {
      super.valueSelect = value;
    });
  }

  final _$loadingValuesAtom = Atom(name: '_ScheduleStore.loadingValues');

  @override
  bool get loadingValues {
    _$loadingValuesAtom.reportRead();
    return super.loadingValues;
  }

  @override
  set loadingValues(bool value) {
    _$loadingValuesAtom.reportWrite(value, super.loadingValues, () {
      super.loadingValues = value;
    });
  }

  final _$sendEmployeeAtom = Atom(name: '_ScheduleStore.sendEmployee');

  @override
  bool get sendEmployee {
    _$sendEmployeeAtom.reportRead();
    return super.sendEmployee;
  }

  @override
  set sendEmployee(bool value) {
    _$sendEmployeeAtom.reportWrite(value, super.sendEmployee, () {
      super.sendEmployee = value;
    });
  }

  final _$setListScheduleAsyncAction =
      AsyncAction('_ScheduleStore.setListSchedule');

  @override
  Future<void> setListSchedule() {
    return _$setListScheduleAsyncAction.run(() => super.setListSchedule());
  }

  final _$getEmployeeTypeEmployeeAsyncAction =
      AsyncAction('_ScheduleStore.getEmployeeTypeEmployee');

  @override
  Future<void> getEmployeeTypeEmployee(int id) {
    return _$getEmployeeTypeEmployeeAsyncAction
        .run(() => super.getEmployeeTypeEmployee(id));
  }

  final _$setIdTypeEmployeeAsyncAction =
      AsyncAction('_ScheduleStore.setIdTypeEmployee');

  @override
  Future<void> setIdTypeEmployee(String value) {
    return _$setIdTypeEmployeeAsyncAction
        .run(() => super.setIdTypeEmployee(value));
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
  void selectTypeService(String value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.selectTypeService');
    try {
      return super.selectTypeService(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEmployee() {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.resetEmployee');
    try {
      return super.resetEmployee();
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectEmployee(int value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.selectEmployee');
    try {
      return super.selectEmployee(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdEmployee(int value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setIdEmployee');
    try {
      return super.setIdEmployee(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> buttonPressed() {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.buttonPressed');
    try {
      return super.buttonPressed();
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
calendarController: ${calendarController},
dataSchedule: ${dataSchedule},
events: ${events},
selectedEvents: ${selectedEvents},
dataServices: ${dataServices},
listEmployee: ${listEmployee},
idFindEmployee: ${idFindEmployee},
valueSelectEmployee: ${valueSelectEmployee},
loadingListEmployee: ${loadingListEmployee},
valueSelect: ${valueSelect},
loadingValues: ${loadingValues},
sendEmployee: ${sendEmployee},
sendPressed: ${sendPressed}
    ''';
  }
}
