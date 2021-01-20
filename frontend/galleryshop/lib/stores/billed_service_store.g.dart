// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billed_service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BilledServiceStore on _BilledServiceStore, Store {
  Computed<bool> _$valueSelecIdtEmployeeIsValidComputed;

  @override
  bool get valueSelecIdtEmployeeIsValid =>
      (_$valueSelecIdtEmployeeIsValidComputed ??= Computed<bool>(
              () => super.valueSelecIdtEmployeeIsValid,
              name: '_BilledServiceStore.valueSelecIdtEmployeeIsValid'))
          .value;
  Computed<bool> _$idClientIsValidComputed;

  @override
  bool get idClientIsValid =>
      (_$idClientIsValidComputed ??= Computed<bool>(() => super.idClientIsValid,
              name: '_BilledServiceStore.idClientIsValid'))
          .value;
  Computed<bool> _$valueSelectServiceIdIsValidComputed;

  @override
  bool get valueSelectServiceIdIsValid =>
      (_$valueSelectServiceIdIsValidComputed ??= Computed<bool>(
              () => super.valueSelectServiceIdIsValid,
              name: '_BilledServiceStore.valueSelectServiceIdIsValid'))
          .value;
  Computed<bool> _$valueIsValidComputed;

  @override
  bool get valueIsValid =>
      (_$valueIsValidComputed ??= Computed<bool>(() => super.valueIsValid,
              name: '_BilledServiceStore.valueIsValid'))
          .value;
  Computed<bool> _$fieldsValidComputed;

  @override
  bool get fieldsValid =>
      (_$fieldsValidComputed ??= Computed<bool>(() => super.fieldsValid,
              name: '_BilledServiceStore.fieldsValid'))
          .value;
  Computed<Function> _$buttonPressedComputed;

  @override
  Function get buttonPressed =>
      (_$buttonPressedComputed ??= Computed<Function>(() => super.buttonPressed,
              name: '_BilledServiceStore.buttonPressed'))
          .value;

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

  final _$controllerFieldValueAtom =
      Atom(name: '_BilledServiceStore.controllerFieldValue');

  @override
  TextEditingController get controllerFieldValue {
    _$controllerFieldValueAtom.reportRead();
    return super.controllerFieldValue;
  }

  @override
  set controllerFieldValue(TextEditingController value) {
    _$controllerFieldValueAtom.reportWrite(value, super.controllerFieldValue,
        () {
      super.controllerFieldValue = value;
    });
  }

  final _$valueAtom = Atom(name: '_BilledServiceStore.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$enableValueAtom = Atom(name: '_BilledServiceStore.enableValue');

  @override
  bool get enableValue {
    _$enableValueAtom.reportRead();
    return super.enableValue;
  }

  @override
  set enableValue(bool value) {
    _$enableValueAtom.reportWrite(value, super.enableValue, () {
      super.enableValue = value;
    });
  }

  final _$discountAtom = Atom(name: '_BilledServiceStore.discount');

  @override
  double get discount {
    _$discountAtom.reportRead();
    return super.discount;
  }

  @override
  set discount(double value) {
    _$discountAtom.reportWrite(value, super.discount, () {
      super.discount = value;
    });
  }

  final _$controllerFieldDiscountAtom =
      Atom(name: '_BilledServiceStore.controllerFieldDiscount');

  @override
  TextEditingController get controllerFieldDiscount {
    _$controllerFieldDiscountAtom.reportRead();
    return super.controllerFieldDiscount;
  }

  @override
  set controllerFieldDiscount(TextEditingController value) {
    _$controllerFieldDiscountAtom
        .reportWrite(value, super.controllerFieldDiscount, () {
      super.controllerFieldDiscount = value;
    });
  }

  final _$createdAtom = Atom(name: '_BilledServiceStore.created');

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

  final _$sendingAtom = Atom(name: '_BilledServiceStore.sending');

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

  final _$errorSendingAtom = Atom(name: '_BilledServiceStore.errorSending');

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

  final _$saveAsyncAction = AsyncAction('_BilledServiceStore.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
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
  void resetControllerValue() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.resetControllerValue');
    try {
      return super.resetControllerValue();
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
  void setControllerFieldDiscount() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setControllerFieldDiscount');
    try {
      return super.setControllerFieldDiscount();
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDiscount(String value) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setDiscount');
    try {
      return super.setDiscount(value);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(String price) {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setValue');
    try {
      return super.setValue(price);
    } finally {
      _$_BilledServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setControllerValue() {
    final _$actionInfo = _$_BilledServiceStoreActionController.startAction(
        name: '_BilledServiceStore.setControllerValue');
    try {
      return super.setControllerValue();
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
loadingServices: ${loadingServices},
controllerFieldValue: ${controllerFieldValue},
value: ${value},
enableValue: ${enableValue},
discount: ${discount},
controllerFieldDiscount: ${controllerFieldDiscount},
created: ${created},
sending: ${sending},
errorSending: ${errorSending},
valueSelecIdtEmployeeIsValid: ${valueSelecIdtEmployeeIsValid},
idClientIsValid: ${idClientIsValid},
valueSelectServiceIdIsValid: ${valueSelectServiceIdIsValid},
valueIsValid: ${valueIsValid},
fieldsValid: ${fieldsValid},
buttonPressed: ${buttonPressed}
    ''';
  }
}
