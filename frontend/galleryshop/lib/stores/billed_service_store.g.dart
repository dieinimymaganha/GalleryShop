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

  final _$valueSelectServiceAtom =
      Atom(name: '_BilledServiceStore.valueSelectService');

  @override
  int get valueSelectService {
    _$valueSelectServiceAtom.reportRead();
    return super.valueSelectService;
  }

  @override
  set valueSelectService(int value) {
    _$valueSelectServiceAtom.reportWrite(value, super.valueSelectService, () {
      super.valueSelectService = value;
    });
  }

  final _$loadingAtom = Atom(name: '_BilledServiceStore.loading');

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

  final _$loadingServicesAtom =
      Atom(name: '_BilledServiceStore.loadingServices');

  @override
  bool get loadingServices {
    _$loadingServicesAtom.reportRead();
    return super.loadingServices;
  }

  @override
  set loadingServices(bool value) {
    _$loadingServicesAtom.reportWrite(value, super.loadingServices, () {
      super.loadingServices = value;
    });
  }

  final _$getListEmployeesAsyncAction =
      AsyncAction('_BilledServiceStore.getListEmployees');

  @override
  Future<void> getListEmployees() {
    return _$getListEmployeesAsyncAction.run(() => super.getListEmployees());
  }

  final _$getListServicesAsyncAction =
      AsyncAction('_BilledServiceStore.getListServices');

  @override
  Future<void> getListServices() {
    return _$getListServicesAsyncAction.run(() => super.getListServices());
  }

  final _$getInitialTypeEmployeeAsyncAction =
      AsyncAction('_BilledServiceStore.getInitialTypeEmployee');

  @override
  Future<void> getInitialTypeEmployee() {
    return _$getInitialTypeEmployeeAsyncAction
        .run(() => super.getInitialTypeEmployee());
  }

  final _$initPageBilledAsyncAction =
      AsyncAction('_BilledServiceStore.initPageBilled');

  @override
  Future<void> initPageBilled() {
    return _$initPageBilledAsyncAction.run(() => super.initPageBilled());
  }

  final _$setValueSelectTypeEmployeeAsyncAction =
      AsyncAction('_BilledServiceStore.setValueSelectTypeEmployee');

  @override
  Future<void> setValueSelectTypeEmployee(int value) {
    return _$setValueSelectTypeEmployeeAsyncAction
        .run(() => super.setValueSelectTypeEmployee(value));
  }

  final _$_BilledServiceStoreActionController =
      ActionController(name: '_BilledServiceStore');

  @override
  void resetValueSelectTypeEmployee() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.resetValueSelectTypeEmployee');
    try {
      return super.resetValueSelectTypeEmployee();
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValueSelectService() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.resetValueSelectService');
    try {
      return super.resetValueSelectService();
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
  void setValueSelectService(int value) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setValueSelectService');
    try {
      return super.setValueSelectService(value);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employeeDto: ${employeeDto},
listEmployees: ${listEmployees},
listServices: ${listServices},
valueSelecIdtEmployee: ${valueSelecIdtEmployee},
valueSelectTypeEmployee: ${valueSelectTypeEmployee},
listTypeEmployee: ${listTypeEmployee},
valueSelectService: ${valueSelectService},
loading: ${loading},
loadingServices: ${loadingServices}
    ''';
  }
}
