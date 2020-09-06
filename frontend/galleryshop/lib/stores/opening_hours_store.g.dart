// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpeningHoursStore on _OpeningHoursStore, Store {
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_OpeningHoursStore.fieldsValid'))
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

  final _$setListAsyncAction = AsyncAction('_OpeningHoursStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
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

  final _$_OpeningHoursStoreActionController =
      ActionController(name: '_OpeningHoursStore');

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
idEmployee: ${idEmployee},
valueSelect: ${valueSelect},
morningStart: ${morningStart},
morningEnd: ${morningEnd},
afternoonStart: ${afternoonStart},
afternoonEnd: ${afternoonEnd},
listOpeningHours: ${listOpeningHours},
fieldsValid: ${fieldsValid}
    ''';
  }
}
