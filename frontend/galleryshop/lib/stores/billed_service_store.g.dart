// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billed_service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BilledServiceStore on _BilledServiceStore, Store {
  final _$employeeDtoAtom = Atom(name: '_BilledServiceStore.employeeDto');

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

  final _$listEmployeesAtom = Atom(name: '_BilledServiceStore.listEmployees');

  @override
  List<dynamic> get listEmployees {
    _$listEmployeesAtom.reportRead();
    return super.listEmployees;
  }

  @override
  set listEmployees(List<dynamic> value) {
    _$listEmployeesAtom.reportWrite(value, super.listEmployees, () {
      super.listEmployees = value;
    });
  }

  final _$valueSelecIdtEmployeeAtom =
      Atom(name: '_BilledServiceStore.valueSelecIdtEmployee');

  @override
  int get valueSelecIdtEmployee {
    _$valueSelecIdtEmployeeAtom.reportRead();
    return super.valueSelecIdtEmployee;
  }

  @override
  set valueSelecIdtEmployee(int value) {
    _$valueSelecIdtEmployeeAtom.reportWrite(value, super.valueSelecIdtEmployee,
        () {
      super.valueSelecIdtEmployee = value;
    });
  }

  final _$valueSelectTypeEmployeeAtom =
      Atom(name: '_BilledServiceStore.valueSelectTypeEmployee');

  @override
  int get valueSelectTypeEmployee {
    _$valueSelectTypeEmployeeAtom.reportRead();
    return super.valueSelectTypeEmployee;
  }

  @override
  set valueSelectTypeEmployee(int value) {
    _$valueSelectTypeEmployeeAtom
        .reportWrite(value, super.valueSelectTypeEmployee, () {
      super.valueSelectTypeEmployee = value;
    });
  }

  final _$listTypeEmployeeAtom =
      Atom(name: '_BilledServiceStore.listTypeEmployee');

  @override
  List<dynamic> get listTypeEmployee {
    _$listTypeEmployeeAtom.reportRead();
    return super.listTypeEmployee;
  }

  @override
  set listTypeEmployee(List<dynamic> value) {
    _$listTypeEmployeeAtom.reportWrite(value, super.listTypeEmployee, () {
      super.listTypeEmployee = value;
    });
  }

  final _$_BilledServiceStoreActionController =
      ActionController(name: '_BilledServiceStore');

  @override
  void getInitialTypeEmployee() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.getInitialTypeEmployee');
    try {
      return super.getInitialTypeEmployee();
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initPageBilled() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.initPageBilled');
    try {
      return super.initPageBilled();
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueSelectEmployee(int value) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setValueSelectEmployee');
    try {
      return super.setValueSelectEmployee(value);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueSelectTypeEmployee(int value) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setValueSelectTypeEmployee');
    try {
      return super.setValueSelectTypeEmployee(value);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employeeDto: ${employeeDto},
listEmployees: ${listEmployees},
valueSelecIdtEmployee: ${valueSelecIdtEmployee},
valueSelectTypeEmployee: ${valueSelectTypeEmployee},
listTypeEmployee: ${listTypeEmployee}
    ''';
  }
}
