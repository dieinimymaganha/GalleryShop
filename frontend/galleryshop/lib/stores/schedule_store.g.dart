// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_ScheduleStore.fieldsValid'))
          .value;
  Computed<Function> _$buttonEnableSchedulePressedComputed;

  @override
  Function get buttonEnableSchedulePressed =>
      (_$buttonEnableSchedulePressedComputed ??= Computed<Function>(
              () => super.buttonEnableSchedulePressed,
              name: '_ScheduleStore.buttonEnableSchedulePressed'))
          .value;
  Computed<bool> _$isValueSelectEmployeeValidComputed;

  @override
  bool get isValueSelectEmployeeValid =>
      (_$isValueSelectEmployeeValidComputed ??= Computed<bool>(
              () => super.isValueSelectEmployeeValid,
              name: '_ScheduleStore.isValueSelectEmployeeValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_ScheduleStore.sendPressed'))
          .value;
  Computed<bool> _$isValidFieldFindScheduleComputed;

  @override
  bool get isValidFieldFindSchedule => (_$isValidFieldFindScheduleComputed ??=
          Computed<bool>(() => super.isValidFieldFindSchedule,
              name: '_ScheduleStore.isValidFieldFindSchedule'))
      .value;
  Computed<bool> _$isValueSelectTypeEmployeeValidComputed;

  @override
  bool get isValueSelectTypeEmployeeValid =>
      (_$isValueSelectTypeEmployeeValidComputed ??= Computed<bool>(
              () => super.isValueSelectTypeEmployeeValid,
              name: '_ScheduleStore.isValueSelectTypeEmployeeValid'))
          .value;

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

  final _$eventsNotConcludedAtom =
      Atom(name: '_ScheduleStore.eventsNotConcluded');

  @override
  Map<DateTime, List<dynamic>> get eventsNotConcluded {
    _$eventsNotConcludedAtom.reportRead();
    return super.eventsNotConcluded;
  }

  @override
  set eventsNotConcluded(Map<DateTime, List<dynamic>> value) {
    _$eventsNotConcludedAtom.reportWrite(value, super.eventsNotConcluded, () {
      super.eventsNotConcluded = value;
    });
  }

  final _$eventsConcludedAtom = Atom(name: '_ScheduleStore.eventsConcluded');

  @override
  Map<DateTime, List<dynamic>> get eventsConcluded {
    _$eventsConcludedAtom.reportRead();
    return super.eventsConcluded;
  }

  @override
  set eventsConcluded(Map<DateTime, List<dynamic>> value) {
    _$eventsConcludedAtom.reportWrite(value, super.eventsConcluded, () {
      super.eventsConcluded = value;
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

  final _$selectedEventsNotConcludedAtom =
      Atom(name: '_ScheduleStore.selectedEventsNotConcluded');

  @override
  List<dynamic> get selectedEventsNotConcluded {
    _$selectedEventsNotConcludedAtom.reportRead();
    return super.selectedEventsNotConcluded;
  }

  @override
  set selectedEventsNotConcluded(List<dynamic> value) {
    _$selectedEventsNotConcludedAtom
        .reportWrite(value, super.selectedEventsNotConcluded, () {
      super.selectedEventsNotConcluded = value;
    });
  }

  final _$selectedEventsConcludedAtom =
      Atom(name: '_ScheduleStore.selectedEventsConcluded');

  @override
  List<dynamic> get selectedEventsConcluded {
    _$selectedEventsConcludedAtom.reportRead();
    return super.selectedEventsConcluded;
  }

  @override
  set selectedEventsConcluded(List<dynamic> value) {
    _$selectedEventsConcludedAtom
        .reportWrite(value, super.selectedEventsConcluded, () {
      super.selectedEventsConcluded = value;
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

  final _$typeEmployeeDtoAtom = Atom(name: '_ScheduleStore.typeEmployeeDto');

  @override
  TypeEmployeeDto get typeEmployeeDto {
    _$typeEmployeeDtoAtom.reportRead();
    return super.typeEmployeeDto;
  }

  @override
  set typeEmployeeDto(TypeEmployeeDto value) {
    _$typeEmployeeDtoAtom.reportWrite(value, super.typeEmployeeDto, () {
      super.typeEmployeeDto = value;
    });
  }

  final _$errorListAtom = Atom(name: '_ScheduleStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_ScheduleStore.listEmpty');

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

  final _$errorLoadingTypeEmployeeAtom =
      Atom(name: '_ScheduleStore.errorLoadingTypeEmployee');

  @override
  bool get errorLoadingTypeEmployee {
    _$errorLoadingTypeEmployeeAtom.reportRead();
    return super.errorLoadingTypeEmployee;
  }

  @override
  set errorLoadingTypeEmployee(bool value) {
    _$errorLoadingTypeEmployeeAtom
        .reportWrite(value, super.errorLoadingTypeEmployee, () {
      super.errorLoadingTypeEmployee = value;
    });
  }

  final _$errorLoadingOptionsMyScheduleAtom =
      Atom(name: '_ScheduleStore.errorLoadingOptionsMySchedule');

  @override
  bool get errorLoadingOptionsMySchedule {
    _$errorLoadingOptionsMyScheduleAtom.reportRead();
    return super.errorLoadingOptionsMySchedule;
  }

  @override
  set errorLoadingOptionsMySchedule(bool value) {
    _$errorLoadingOptionsMyScheduleAtom
        .reportWrite(value, super.errorLoadingOptionsMySchedule, () {
      super.errorLoadingOptionsMySchedule = value;
    });
  }

  final _$loadingOptionsScheduleTypeEmployeeAtom =
      Atom(name: '_ScheduleStore.loadingOptionsScheduleTypeEmployee');

  @override
  bool get loadingOptionsScheduleTypeEmployee {
    _$loadingOptionsScheduleTypeEmployeeAtom.reportRead();
    return super.loadingOptionsScheduleTypeEmployee;
  }

  @override
  set loadingOptionsScheduleTypeEmployee(bool value) {
    _$loadingOptionsScheduleTypeEmployeeAtom
        .reportWrite(value, super.loadingOptionsScheduleTypeEmployee, () {
      super.loadingOptionsScheduleTypeEmployee = value;
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

  final _$controllerDayInitAtom =
      Atom(name: '_ScheduleStore.controllerDayInit');

  @override
  TextEditingController get controllerDayInit {
    _$controllerDayInitAtom.reportRead();
    return super.controllerDayInit;
  }

  @override
  set controllerDayInit(TextEditingController value) {
    _$controllerDayInitAtom.reportWrite(value, super.controllerDayInit, () {
      super.controllerDayInit = value;
    });
  }

  final _$dayInitAtom = Atom(name: '_ScheduleStore.dayInit');

  @override
  String get dayInit {
    _$dayInitAtom.reportRead();
    return super.dayInit;
  }

  @override
  set dayInit(String value) {
    _$dayInitAtom.reportWrite(value, super.dayInit, () {
      super.dayInit = value;
    });
  }

  final _$controllerAttendanceTimeAtom =
      Atom(name: '_ScheduleStore.controllerAttendanceTime');

  @override
  TextEditingController get controllerAttendanceTime {
    _$controllerAttendanceTimeAtom.reportRead();
    return super.controllerAttendanceTime;
  }

  @override
  set controllerAttendanceTime(TextEditingController value) {
    _$controllerAttendanceTimeAtom
        .reportWrite(value, super.controllerAttendanceTime, () {
      super.controllerAttendanceTime = value;
    });
  }

  final _$attendanceTimeAtom = Atom(name: '_ScheduleStore.attendanceTime');

  @override
  DateTime get attendanceTime {
    _$attendanceTimeAtom.reportRead();
    return super.attendanceTime;
  }

  @override
  set attendanceTime(DateTime value) {
    _$attendanceTimeAtom.reportWrite(value, super.attendanceTime, () {
      super.attendanceTime = value;
    });
  }

  final _$quantityDaysAtom = Atom(name: '_ScheduleStore.quantityDays');

  @override
  int get quantityDays {
    _$quantityDaysAtom.reportRead();
    return super.quantityDays;
  }

  @override
  set quantityDays(int value) {
    _$quantityDaysAtom.reportWrite(value, super.quantityDays, () {
      super.quantityDays = value;
    });
  }

  final _$sendingAtom = Atom(name: '_ScheduleStore.sending');

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

  final _$controllerQuantityDaysAtom =
      Atom(name: '_ScheduleStore.controllerQuantityDays');

  @override
  TextEditingController get controllerQuantityDays {
    _$controllerQuantityDaysAtom.reportRead();
    return super.controllerQuantityDays;
  }

  @override
  set controllerQuantityDays(TextEditingController value) {
    _$controllerQuantityDaysAtom
        .reportWrite(value, super.controllerQuantityDays, () {
      super.controllerQuantityDays = value;
    });
  }

  final _$enableScheduleSendingAtom =
      Atom(name: '_ScheduleStore.enableScheduleSending');

  @override
  bool get enableScheduleSending {
    _$enableScheduleSendingAtom.reportRead();
    return super.enableScheduleSending;
  }

  @override
  set enableScheduleSending(bool value) {
    _$enableScheduleSendingAtom.reportWrite(value, super.enableScheduleSending,
        () {
      super.enableScheduleSending = value;
    });
  }

  final _$enableScheduleOkAtom = Atom(name: '_ScheduleStore.enableScheduleOk');

  @override
  bool get enableScheduleOk {
    _$enableScheduleOkAtom.reportRead();
    return super.enableScheduleOk;
  }

  @override
  set enableScheduleOk(bool value) {
    _$enableScheduleOkAtom.reportWrite(value, super.enableScheduleOk, () {
      super.enableScheduleOk = value;
    });
  }

  final _$enableScheduleErrorAtom =
      Atom(name: '_ScheduleStore.enableScheduleError');

  @override
  bool get enableScheduleError {
    _$enableScheduleErrorAtom.reportRead();
    return super.enableScheduleError;
  }

  @override
  set enableScheduleError(bool value) {
    _$enableScheduleErrorAtom.reportWrite(value, super.enableScheduleError, () {
      super.enableScheduleError = value;
    });
  }

  final _$enableScheduleDuplicateAtom =
      Atom(name: '_ScheduleStore.enableScheduleDuplicate');

  @override
  bool get enableScheduleDuplicate {
    _$enableScheduleDuplicateAtom.reportRead();
    return super.enableScheduleDuplicate;
  }

  @override
  set enableScheduleDuplicate(bool value) {
    _$enableScheduleDuplicateAtom
        .reportWrite(value, super.enableScheduleDuplicate, () {
      super.enableScheduleDuplicate = value;
    });
  }

  final _$showConcludedAtom = Atom(name: '_ScheduleStore.showConcluded');

  @override
  bool get showConcluded {
    _$showConcludedAtom.reportRead();
    return super.showConcluded;
  }

  @override
  set showConcluded(bool value) {
    _$showConcludedAtom.reportWrite(value, super.showConcluded, () {
      super.showConcluded = value;
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

  final _$scheduleNotAvailableAtom =
      Atom(name: '_ScheduleStore.scheduleNotAvailable');

  @override
  bool get scheduleNotAvailable {
    _$scheduleNotAvailableAtom.reportRead();
    return super.scheduleNotAvailable;
  }

  @override
  set scheduleNotAvailable(bool value) {
    _$scheduleNotAvailableAtom.reportWrite(value, super.scheduleNotAvailable,
        () {
      super.scheduleNotAvailable = value;
    });
  }

  final _$scheduleConflitAtom = Atom(name: '_ScheduleStore.scheduleConflit');

  @override
  bool get scheduleConflit {
    _$scheduleConflitAtom.reportRead();
    return super.scheduleConflit;
  }

  @override
  set scheduleConflit(bool value) {
    _$scheduleConflitAtom.reportWrite(value, super.scheduleConflit, () {
      super.scheduleConflit = value;
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

  final _$saveScheduleAsyncAction = AsyncAction('_ScheduleStore.saveSchedule');

  @override
  Future<void> saveSchedule() {
    return _$saveScheduleAsyncAction.run(() => super.saveSchedule());
  }

  final _$sendEnableScheduleAsyncAction =
      AsyncAction('_ScheduleStore.sendEnableSchedule');

  @override
  Future<void> sendEnableSchedule(ScheduleEnableScheduleForm form) {
    return _$sendEnableScheduleAsyncAction
        .run(() => super.sendEnableSchedule(form));
  }

  final _$setOptionsMyScheduleAsyncAction =
      AsyncAction('_ScheduleStore.setOptionsMySchedule');

  @override
  Future<void> setOptionsMySchedule() {
    return _$setOptionsMyScheduleAsyncAction
        .run(() => super.setOptionsMySchedule());
  }

  final _$realoadListOptionsMyScheduleAsyncAction =
      AsyncAction('_ScheduleStore.realoadListOptionsMySchedule');

  @override
  Future<void> realoadListOptionsMySchedule() {
    return _$realoadListOptionsMyScheduleAsyncAction
        .run(() => super.realoadListOptionsMySchedule());
  }

  final _$setListMyScheduleAsyncAction =
      AsyncAction('_ScheduleStore.setListMySchedule');

  @override
  Future<void> setListMySchedule() {
    return _$setListMyScheduleAsyncAction.run(() => super.setListMySchedule());
  }

  final _$loadingInitOptionsScheduleAsyncAction =
      AsyncAction('_ScheduleStore.loadingInitOptionsSchedule');

  @override
  Future<void> loadingInitOptionsSchedule() {
    return _$loadingInitOptionsScheduleAsyncAction
        .run(() => super.loadingInitOptionsSchedule());
  }

  final _$createInfoScheduleAsyncAction =
      AsyncAction('_ScheduleStore.createInfoSchedule');

  @override
  Future<void> createInfoSchedule() {
    return _$createInfoScheduleAsyncAction
        .run(() => super.createInfoSchedule());
  }

  final _$loagingPageInitAsyncAction =
      AsyncAction('_ScheduleStore.loagingPageInit');

  @override
  Future<void> loagingPageInit() {
    return _$loagingPageInitAsyncAction.run(() => super.loagingPageInit());
  }

  final _$reloadListAsyncAction = AsyncAction('_ScheduleStore.reloadList');

  @override
  Future<void> reloadList() {
    return _$reloadListAsyncAction.run(() => super.reloadList());
  }

  final _$createScheduleAppointmentFormAsyncAction =
      AsyncAction('_ScheduleStore.createScheduleAppointmentForm');

  @override
  Future<ScheduleAppointmentForm> createScheduleAppointmentForm() {
    return _$createScheduleAppointmentFormAsyncAction
        .run(() => super.createScheduleAppointmentForm());
  }

  final _$sendConfirmScheduleEmployeeAsyncAction =
      AsyncAction('_ScheduleStore.sendConfirmScheduleEmployee');

  @override
  Future<void> sendConfirmScheduleEmployee(int idSchedule) {
    return _$sendConfirmScheduleEmployeeAsyncAction
        .run(() => super.sendConfirmScheduleEmployee(idSchedule));
  }

  final _$buttonPressedAsyncAction =
      AsyncAction('_ScheduleStore.buttonPressed');

  @override
  Future<void> buttonPressed() {
    return _$buttonPressedAsyncAction.run(() => super.buttonPressed());
  }

  final _$setIdTypeEmployeeConsultAsyncAction =
      AsyncAction('_ScheduleStore.setIdTypeEmployeeConsult');

  @override
  Future<void> setIdTypeEmployeeConsult(String value) {
    return _$setIdTypeEmployeeConsultAsyncAction
        .run(() => super.setIdTypeEmployeeConsult(value));
  }

  final _$getEmployeeTypeEmployeeAsyncAction =
      AsyncAction('_ScheduleStore.getEmployeeTypeEmployee');

  @override
  Future<void> getEmployeeTypeEmployee(int id) {
    return _$getEmployeeTypeEmployeeAsyncAction
        .run(() => super.getEmployeeTypeEmployee(id));
  }

  final _$_ScheduleStoreActionController =
      ActionController(name: '_ScheduleStore');

  @override
  void setControllerQuantityDays(int value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setControllerQuantityDays');
    try {
      return super.setControllerQuantityDays(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantityDays(String value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setQuantityDays');
    try {
      return super.setQuantityDays(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAttendanceTime(TextEditingController controller) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setAttendanceTime');
    try {
      return super.setAttendanceTime(controller);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDayIniController(String value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setDayIniController');
    try {
      return super.setDayIniController(value);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDayIni(String value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setDayIni');
    try {
      return super.setDayIni(value);
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
  Map<DateTime, List<dynamic>> fromModelToEventAppointmentConcluded(
      List<ScheduleDtoAppointment> events) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.fromModelToEventAppointmentConcluded');
    try {
      return super.fromModelToEventAppointmentConcluded(events);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointmentNotConcluded(
      List<ScheduleDtoAppointment> events) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.fromModelToEventAppointmentNotConcluded');
    try {
      return super.fromModelToEventAppointmentNotConcluded(events);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectEventsConcluded(DateTime date) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setSelectEventsConcluded');
    try {
      return super.setSelectEventsConcluded(date);
    } finally {
      _$_ScheduleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdTypeEmployee(String value) {
    final _$actionInfo = _$_ScheduleStoreActionController.startAction(
        name: '_ScheduleStore.setIdTypeEmployee');
    try {
      return super.setIdTypeEmployee(value);
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
employeeDto: ${employeeDto},
calendarController: ${calendarController},
dataSchedule: ${dataSchedule},
eventsNotConcluded: ${eventsNotConcluded},
eventsConcluded: ${eventsConcluded},
events: ${events},
selectedEvents: ${selectedEvents},
selectedEventsNotConcluded: ${selectedEventsNotConcluded},
selectedEventsConcluded: ${selectedEventsConcluded},
optionsMySchedule: ${optionsMySchedule},
loadingPageScheduleTime: ${loadingPageScheduleTime},
typeEmployeeDto: ${typeEmployeeDto},
errorList: ${errorList},
listEmpty: ${listEmpty},
errorLoadingTypeEmployee: ${errorLoadingTypeEmployee},
errorLoadingOptionsMySchedule: ${errorLoadingOptionsMySchedule},
loadingOptionsScheduleTypeEmployee: ${loadingOptionsScheduleTypeEmployee},
valueSelectTypeEmployee: ${valueSelectTypeEmployee},
controllerDayInit: ${controllerDayInit},
dayInit: ${dayInit},
controllerAttendanceTime: ${controllerAttendanceTime},
attendanceTime: ${attendanceTime},
quantityDays: ${quantityDays},
sending: ${sending},
controllerQuantityDays: ${controllerQuantityDays},
enableScheduleSending: ${enableScheduleSending},
enableScheduleOk: ${enableScheduleOk},
enableScheduleError: ${enableScheduleError},
enableScheduleDuplicate: ${enableScheduleDuplicate},
showConcluded: ${showConcluded},
scheduleSend: ${scheduleSend},
scheduleOk: ${scheduleOk},
scheduleDuplicate: ${scheduleDuplicate},
scheduleNotAvailable: ${scheduleNotAvailable},
scheduleConflit: ${scheduleConflit},
scheduleFail: ${scheduleFail},
sendEmployee: ${sendEmployee},
loadingListEmployee: ${loadingListEmployee},
loadingValues: ${loadingValues},
valueSelectEmployee: ${valueSelectEmployee},
listEmployee: ${listEmployee},
dataServices: ${dataServices},
fieldsValid: ${fieldsValid},
buttonEnableSchedulePressed: ${buttonEnableSchedulePressed},
isValueSelectEmployeeValid: ${isValueSelectEmployeeValid},
sendPressed: ${sendPressed},
isValidFieldFindSchedule: ${isValidFieldFindSchedule},
isValueSelectTypeEmployeeValid: ${isValueSelectTypeEmployeeValid}
    ''';
  }
}
