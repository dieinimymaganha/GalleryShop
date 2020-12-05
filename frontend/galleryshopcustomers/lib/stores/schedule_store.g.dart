// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  Computed<bool> _$isValueSelectEmployeeValidComputed;

  @override
  bool get isValueSelectEmployeeValid =>
      (_$isValueSelectEmployeeValidComputed ??= Computed<bool>(
              () => super.isValueSelectEmployeeValid,
              name: '_ScheduleStore.isValueSelectEmployeeValid'))
          .value;
  Computed<bool> _$isValueSelectTypeEmployeeValidComputed;

  @override
  bool get isValueSelectTypeEmployeeValid =>
      (_$isValueSelectTypeEmployeeValidComputed ??= Computed<bool>(
              () => super.isValueSelectTypeEmployeeValid,
              name: '_ScheduleStore.isValueSelectTypeEmployeeValid'))
          .value;
  Computed<bool> _$isValidFieldFindScheduleComputed;

  @override
  bool get isValidFieldFindSchedule => (_$isValidFieldFindScheduleComputed ??=
          Computed<bool>(() => super.isValidFieldFindSchedule,
              name: '_ScheduleStore.isValidFieldFindSchedule'))
      .value;
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

  final _$valueSelectTypeEmployeeAtom =
      Atom(name: '_ScheduleStore.valueSelectTypeEmployee');

  @override
  String get valueSelectTypeEmployee {
    _$valueSelectTypeEmployeeAtom.reportRead();
    return super.valueSelectTypeEmployee;
  }

  @override
  set valueSelectTypeEmployee(String value) {
    _$valueSelectTypeEmployeeAtom
        .reportWrite(value, super.valueSelectTypeEmployee, () {
      super.valueSelectTypeEmployee = value;
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

  final _$scheduleOkAtom = Atom(name: '_ScheduleStore.scheduleOk');

  @override
  bool get scheduleOk {
    _$scheduleOkAtom.reportRead();
    return super.scheduleOk;
  }

  @override
  set scheduleOk(bool value) {
    _$scheduleOkAtom.reportWrite(value, super.scheduleOk, () {
      super.scheduleOk = value;
    });
  }

  final _$scheduleFailAtom = Atom(name: '_ScheduleStore.scheduleFail');

  @override
  bool get scheduleFail {
    _$scheduleFailAtom.reportRead();
    return super.scheduleFail;
  }

  @override
  set scheduleFail(bool value) {
    _$scheduleFailAtom.reportWrite(value, super.scheduleFail, () {
      super.scheduleFail = value;
    });
  }

  final _$scheduleDuplicateAtom =
      Atom(name: '_ScheduleStore.scheduleDuplicate');

  @override
  bool get scheduleDuplicate {
    _$scheduleDuplicateAtom.reportRead();
    return super.scheduleDuplicate;
  }

  @override
  set scheduleDuplicate(bool value) {
    _$scheduleDuplicateAtom.reportWrite(value, super.scheduleDuplicate, () {
      super.scheduleDuplicate = value;
    });
  }

  final _$scheduleSendAtom = Atom(name: '_ScheduleStore.scheduleSend');

  @override
  bool get scheduleSend {
    _$scheduleSendAtom.reportRead();
    return super.scheduleSend;
  }

  @override
  set scheduleSend(bool value) {
    _$scheduleSendAtom.reportWrite(value, super.scheduleSend, () {
      super.scheduleSend = value;
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

  final _$buttonPressedAsyncAction =
      AsyncAction('_ScheduleStore.buttonPressed');

  @override
  Future<void> buttonPressed() {
    return _$buttonPressedAsyncAction.run(() => super.buttonPressed());
  }

  final _$getIdClientAsyncAction = AsyncAction('_ScheduleStore.getIdClient');

  @override
  Future<int> getIdClient() {
    return _$getIdClientAsyncAction.run(() => super.getIdClient());
  }

  final _$createScheduleAppointmentFormAsyncAction =
      AsyncAction('_ScheduleStore.createScheduleAppointmentForm');

  @override
  Future<ScheduleAppointmentForm> createScheduleAppointmentForm() {
    return _$createScheduleAppointmentFormAsyncAction
        .run(() => super.createScheduleAppointmentForm());
  }

  final _$sendAsyncAction = AsyncAction('_ScheduleStore.send');

  @override
  Future<void> send(int value) {
    return _$sendAsyncAction.run(() => super.send(value));
  }

  final _$_ScheduleStoreActionController =
      ActionController(name: '_ScheduleStore');

  @override
  Future<void> createInfoSchedule() {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.createInfoSchedule');
    try {
      return super.createInfoSchedule();
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

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
valueSelectTypeEmployee: ${valueSelectTypeEmployee},
infoSchedule: ${infoSchedule},
loadingValues: ${loadingValues},
sendEmployee: ${sendEmployee},
scheduleOk: ${scheduleOk},
scheduleFail: ${scheduleFail},
scheduleDuplicate: ${scheduleDuplicate},
scheduleSend: ${scheduleSend},
isValueSelectEmployeeValid: ${isValueSelectEmployeeValid},
isValueSelectTypeEmployeeValid: ${isValueSelectTypeEmployeeValid},
isValidFieldFindSchedule: ${isValidFieldFindSchedule},
sendPressed: ${sendPressed}
    ''';
  }
}
