// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpeningHoursStore on _OpeningHoursStore, Store {
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

  @override
  String toString() {
    return '''
idEmployee: ${idEmployee}
    ''';
  }
}
