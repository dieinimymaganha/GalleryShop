// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpeningHoursStore on _OpeningHoursStore, Store {
  Computed<Function> _$buttoExcludePressedComputed;

  @override
  Function get buttoExcludePressed => (_$buttoExcludePressedComputed ??=
          Computed<Function>(() => super.buttoExcludePressed,
              name: '_OpeningHoursStore.buttoExcludePressed'))
      .value;
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_OpeningHoursStore.fieldsValid'))
          .value;
  Computed<Function> _$butttonSavePressedComputed;

  @override
  Function get butttonSavePressed => (_$butttonSavePressedComputed ??=
          Computed<Function>(() => super.butttonSavePressed,
              name: '_OpeningHoursStore.butttonSavePressed'))
      .value;

  final _$listDayOfWeekAtom = Atom(name: '_OpeningHoursStore.listDayOfWeek');

  @override
  List<DayOfTheWeek> get listDayOfWeek {
    _$listDayOfWeekAtom.reportRead();
    return super.listDayOfWeek;
  }

  @override
  set listDayOfWeek(List<DayOfTheWeek> value) {
    _$listDayOfWeekAtom.reportWrite(value, super.listDayOfWeek, () {
      super.listDayOfWeek = value;
    });
  }

  final _$changeAtom = Atom(name: '_OpeningHoursStore.change');

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

  final _$idEmployeeAtom = Atom(name: '_OpeningHoursStore.idEmployee');

  @override
  int get idEmployee {
    _$idEmployeeAtom.reportRead();
    return super.idEmployee;
  }

  @override
  set idEmployee(int value) {
    _$idEmployeeAtom.reportWrite(value, super.idEmployee, () {
      super.idEmployee = value;
    });
  }

  final _$valueSelectAtom = Atom(name: '_OpeningHoursStore.valueSelect');

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

  final _$morningStartAtom = Atom(name: '_OpeningHoursStore.morningStart');

  @override
  DateTime get morningStart {
    _$morningStartAtom.reportRead();
    return super.morningStart;
  }

  @override
  set morningStart(DateTime value) {
    _$morningStartAtom.reportWrite(value, super.morningStart, () {
      super.morningStart = value;
    });
  }

  final _$errorListAtom = Atom(name: '_OpeningHoursStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_OpeningHoursStore.listEmpty');

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

  final _$loadingAtom = Atom(name: '_OpeningHoursStore.loading');

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

  final _$excludedAtom = Atom(name: '_OpeningHoursStore.excluded');

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

  final _$sendingAtom = Atom(name: '_OpeningHoursStore.sending');

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

  final _$excludedFailAtom = Atom(name: '_OpeningHoursStore.excludedFail');

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

  final _$morningEndAtom = Atom(name: '_OpeningHoursStore.morningEnd');

  @override
  DateTime get morningEnd {
    _$morningEndAtom.reportRead();
    return super.morningEnd;
  }

  @override
  set morningEnd(DateTime value) {
    _$morningEndAtom.reportWrite(value, super.morningEnd, () {
      super.morningEnd = value;
    });
  }

  final _$afternoonStartAtom = Atom(name: '_OpeningHoursStore.afternoonStart');

  @override
  DateTime get afternoonStart {
    _$afternoonStartAtom.reportRead();
    return super.afternoonStart;
  }

  @override
  set afternoonStart(DateTime value) {
    _$afternoonStartAtom.reportWrite(value, super.afternoonStart, () {
      super.afternoonStart = value;
    });
  }

  final _$afternoonEndAtom = Atom(name: '_OpeningHoursStore.afternoonEnd');

  @override
  DateTime get afternoonEnd {
    _$afternoonEndAtom.reportRead();
    return super.afternoonEnd;
  }

  @override
  set afternoonEnd(DateTime value) {
    _$afternoonEndAtom.reportWrite(value, super.afternoonEnd, () {
      super.afternoonEnd = value;
    });
  }

  final _$listOpeningHoursAtom =
      Atom(name: '_OpeningHoursStore.listOpeningHours');

  @override
  List<dynamic> get listOpeningHours {
    _$listOpeningHoursAtom.reportRead();
    return super.listOpeningHours;
  }

  @override
  set listOpeningHours(List<dynamic> value) {
    _$listOpeningHoursAtom.reportWrite(value, super.listOpeningHours, () {
      super.listOpeningHours = value;
    });
  }

  final _$listOpeningHoursRecoverAtom =
      Atom(name: '_OpeningHoursStore.listOpeningHoursRecover');

  @override
  List<dynamic> get listOpeningHoursRecover {
    _$listOpeningHoursRecoverAtom.reportRead();
    return super.listOpeningHoursRecover;
  }

  @override
  set listOpeningHoursRecover(List<dynamic> value) {
    _$listOpeningHoursRecoverAtom
        .reportWrite(value, super.listOpeningHoursRecover, () {
      super.listOpeningHoursRecover = value;
    });
  }

  final _$createdAtom = Atom(name: '_OpeningHoursStore.created');

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

  final _$duplicateAtom = Atom(name: '_OpeningHoursStore.duplicate');

  @override
  bool get duplicate {
    _$duplicateAtom.reportRead();
    return super.duplicate;
  }

  @override
  set duplicate(bool value) {
    _$duplicateAtom.reportWrite(value, super.duplicate, () {
      super.duplicate = value;
    });
  }

  final _$errorSendingAtom = Atom(name: '_OpeningHoursStore.errorSending');

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

  final _$excludeOpeningHoursAsyncAction =
      AsyncAction('_OpeningHoursStore.excludeOpeningHours');

  @override
  Future<void> excludeOpeningHours() {
    return _$excludeOpeningHoursAsyncAction
        .run(() => super.excludeOpeningHours());
  }

  final _$reloadListAsyncAction = AsyncAction('_OpeningHoursStore.reloadList');

  @override
  Future<void> reloadList() {
    return _$reloadListAsyncAction.run(() => super.reloadList());
  }

  final _$setListAsyncAction = AsyncAction('_OpeningHoursStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  final _$createNewListAsyncAction =
      AsyncAction('_OpeningHoursStore.createNewList');

  @override
  Future<List<dynamic>> createNewList(List<dynamic> listData) {
    return _$createNewListAsyncAction.run(() => super.createNewList(listData));
  }

  final _$setIdEmployeeAsyncAction =
      AsyncAction('_OpeningHoursStore.setIdEmployee');

  @override
  Future<void> setIdEmployee() {
    return _$setIdEmployeeAsyncAction.run(() => super.setIdEmployee());
  }

  final _$getIdEmployeeAsyncAction =
      AsyncAction('_OpeningHoursStore.getIdEmployee');

  @override
  Future<int> getIdEmployee() {
    return _$getIdEmployeeAsyncAction.run(() => super.getIdEmployee());
  }

  final _$sendNewHoursAsyncAction =
      AsyncAction('_OpeningHoursStore.sendNewHours');

  @override
  Future<void> sendNewHours() {
    return _$sendNewHoursAsyncAction.run(() => super.sendNewHours());
  }

  final _$_OpeningHoursStoreActionController =
      ActionController(name: '_OpeningHoursStore');

  @override
  void setDataInitial() {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.setDataInitial');
    try {
      return super.setDataInitial();
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoringStart(TextEditingController controller) {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.setMoringStart');
    try {
      return super.setMoringStart(controller);
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoringEnd(TextEditingController controller) {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.setMoringEnd');
    try {
      return super.setMoringEnd(controller);
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAfternoonStart(TextEditingController controller) {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.setAfternoonStart');
    try {
      return super.setAfternoonStart(controller);
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAfternoonEnd(TextEditingController controller) {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.setAfternoonEnd');
    try {
      return super.setAfternoonEnd(controller);
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectDayOfTheWeek(String value) {
    final _$actionInfo = _$_OpeningHoursStoreActionController.startAction(
        name: '_OpeningHoursStore.selectDayOfTheWeek');
    try {
      return super.selectDayOfTheWeek(value);
    } finally {
      _$_OpeningHoursStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listDayOfWeek: ${listDayOfWeek},
change: ${change},
idEmployee: ${idEmployee},
valueSelect: ${valueSelect},
morningStart: ${morningStart},
errorList: ${errorList},
listEmpty: ${listEmpty},
loading: ${loading},
excluded: ${excluded},
sending: ${sending},
excludedFail: ${excludedFail},
morningEnd: ${morningEnd},
afternoonStart: ${afternoonStart},
afternoonEnd: ${afternoonEnd},
listOpeningHours: ${listOpeningHours},
listOpeningHoursRecover: ${listOpeningHoursRecover},
created: ${created},
duplicate: ${duplicate},
errorSending: ${errorSending},
buttoExcludePressed: ${buttoExcludePressed},
fieldsValid: ${fieldsValid},
butttonSavePressed: ${butttonSavePressed}
    ''';
  }
}
