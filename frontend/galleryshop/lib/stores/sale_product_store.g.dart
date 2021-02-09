// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaleProductStore on _SaleProductStore, Store {
  Computed<Function> _$buttonExcludePressedComputed;

  @override
  Function get buttonExcludePressed => (_$buttonExcludePressedComputed ??=
          Computed<Function>(() => super.buttonExcludePressed,
              name: '_SaleProductStore.buttonExcludePressed'))
      .value;
  Computed<bool> _$quantityIsValidComputed;

  @override
  bool get quantityIsValid =>
      (_$quantityIsValidComputed ??= Computed<bool>(() => super.quantityIsValid,
              name: '_SaleProductStore.quantityIsValid'))
          .value;
  Computed<bool> _$fieldsSaleIsValidComputed;

  @override
  bool get fieldsSaleIsValid => (_$fieldsSaleIsValidComputed ??= Computed<bool>(
          () => super.fieldsSaleIsValid,
          name: '_SaleProductStore.fieldsSaleIsValid'))
      .value;
  Computed<bool> _$productIsValidComputed;

  @override
  bool get productIsValid =>
      (_$productIsValidComputed ??= Computed<bool>(() => super.productIsValid,
              name: '_SaleProductStore.productIsValid'))
          .value;
  Computed<Function> _$buttonRegisterSalePressedComputed;

  @override
  Function get buttonRegisterSalePressed =>
      (_$buttonRegisterSalePressedComputed ??= Computed<Function>(
              () => super.buttonRegisterSalePressed,
              name: '_SaleProductStore.buttonRegisterSalePressed'))
          .value;
  Computed<Function> _$buttonUpdateSalePressedComputed;

  @override
  Function get buttonUpdateSalePressed => (_$buttonUpdateSalePressedComputed ??=
          Computed<Function>(() => super.buttonUpdateSalePressed,
              name: '_SaleProductStore.buttonUpdateSalePressed'))
      .value;

  final _$eventsAtom = Atom(name: '_SaleProductStore.events');

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

  final _$listSalesAtom = Atom(name: '_SaleProductStore.listSales');

  @override
  List<dynamic> get listSales {
    _$listSalesAtom.reportRead();
    return super.listSales;
  }

  @override
  set listSales(List<dynamic> value) {
    _$listSalesAtom.reportWrite(value, super.listSales, () {
      super.listSales = value;
    });
  }

  final _$selectedEventsAtom = Atom(name: '_SaleProductStore.selectedEvents');

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

  final _$errorListAtom = Atom(name: '_SaleProductStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_SaleProductStore.listEmpty');

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

  final _$calendarControllerAtom =
      Atom(name: '_SaleProductStore.calendarController');

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

  final _$sendingAtom = Atom(name: '_SaleProductStore.sending');

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

  final _$excludedAtom = Atom(name: '_SaleProductStore.excluded');

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

  final _$excludedUnauthorizedAtom =
      Atom(name: '_SaleProductStore.excludedUnauthorized');

  @override
  bool get excludedUnauthorized {
    _$excludedUnauthorizedAtom.reportRead();
    return super.excludedUnauthorized;
  }

  @override
  set excludedUnauthorized(bool value) {
    _$excludedUnauthorizedAtom.reportWrite(value, super.excludedUnauthorized,
        () {
      super.excludedUnauthorized = value;
    });
  }

  final _$excludedFailAtom = Atom(name: '_SaleProductStore.excludedFail');

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

  final _$listProductsAtom = Atom(name: '_SaleProductStore.listProducts');

  @override
  List<dynamic> get listProducts {
    _$listProductsAtom.reportRead();
    return super.listProducts;
  }

  @override
  set listProducts(List<dynamic> value) {
    _$listProductsAtom.reportWrite(value, super.listProducts, () {
      super.listProducts = value;
    });
  }

  final _$valueSelectProductAtom =
      Atom(name: '_SaleProductStore.valueSelectProduct');

  @override
  int get valueSelectProduct {
    _$valueSelectProductAtom.reportRead();
    return super.valueSelectProduct;
  }

  @override
  set valueSelectProduct(int value) {
    _$valueSelectProductAtom.reportWrite(value, super.valueSelectProduct, () {
      super.valueSelectProduct = value;
    });
  }

  final _$controllerFieldValueProductAtom =
      Atom(name: '_SaleProductStore.controllerFieldValueProduct');

  @override
  TextEditingController get controllerFieldValueProduct {
    _$controllerFieldValueProductAtom.reportRead();
    return super.controllerFieldValueProduct;
  }

  @override
  set controllerFieldValueProduct(TextEditingController value) {
    _$controllerFieldValueProductAtom
        .reportWrite(value, super.controllerFieldValueProduct, () {
      super.controllerFieldValueProduct = value;
    });
  }

  final _$controllerFieldQtdProductAtom =
      Atom(name: '_SaleProductStore.controllerFieldQtdProduct');

  @override
  TextEditingController get controllerFieldQtdProduct {
    _$controllerFieldQtdProductAtom.reportRead();
    return super.controllerFieldQtdProduct;
  }

  @override
  set controllerFieldQtdProduct(TextEditingController value) {
    _$controllerFieldQtdProductAtom
        .reportWrite(value, super.controllerFieldQtdProduct, () {
      super.controllerFieldQtdProduct = value;
    });
  }

  final _$quantityAtom = Atom(name: '_SaleProductStore.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$valueProductAtom = Atom(name: '_SaleProductStore.valueProduct');

  @override
  double get valueProduct {
    _$valueProductAtom.reportRead();
    return super.valueProduct;
  }

  @override
  set valueProduct(double value) {
    _$valueProductAtom.reportWrite(value, super.valueProduct, () {
      super.valueProduct = value;
    });
  }

  final _$createdAtom = Atom(name: '_SaleProductStore.created');

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

  final _$updateProductAtom = Atom(name: '_SaleProductStore.updateProduct');

  @override
  bool get updateProduct {
    _$updateProductAtom.reportRead();
    return super.updateProduct;
  }

  @override
  set updateProduct(bool value) {
    _$updateProductAtom.reportWrite(value, super.updateProduct, () {
      super.updateProduct = value;
    });
  }

  final _$errorSendingAtom = Atom(name: '_SaleProductStore.errorSending');

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

  final _$changeAtom = Atom(name: '_SaleProductStore.change');

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

  final _$accountClientProcessAtom =
      Atom(name: '_SaleProductStore.accountClientProcess');

  @override
  bool get accountClientProcess {
    _$accountClientProcessAtom.reportRead();
    return super.accountClientProcess;
  }

  @override
  set accountClientProcess(bool value) {
    _$accountClientProcessAtom.reportWrite(value, super.accountClientProcess,
        () {
      super.accountClientProcess = value;
    });
  }

  final _$productDifAtom = Atom(name: '_SaleProductStore.productDif');

  @override
  bool get productDif {
    _$productDifAtom.reportRead();
    return super.productDif;
  }

  @override
  set productDif(bool value) {
    _$productDifAtom.reportWrite(value, super.productDif, () {
      super.productDif = value;
    });
  }

  final _$updatedUnauthorizedAtom =
      Atom(name: '_SaleProductStore.updatedUnauthorized');

  @override
  bool get updatedUnauthorized {
    _$updatedUnauthorizedAtom.reportRead();
    return super.updatedUnauthorized;
  }

  @override
  set updatedUnauthorized(bool value) {
    _$updatedUnauthorizedAtom.reportWrite(value, super.updatedUnauthorized, () {
      super.updatedUnauthorized = value;
    });
  }

  final _$setListCalendarAsyncAction =
      AsyncAction('_SaleProductStore.setListCalendar');

  @override
  Future<void> setListCalendar() {
    return _$setListCalendarAsyncAction.run(() => super.setListCalendar());
  }

  final _$reloadPageSalesAsyncAction =
      AsyncAction('_SaleProductStore.reloadPageSales');

  @override
  Future<void> reloadPageSales() {
    return _$reloadPageSalesAsyncAction.run(() => super.reloadPageSales());
  }

  final _$excludeSaleAsyncAction = AsyncAction('_SaleProductStore.excludeSale');

  @override
  Future<void> excludeSale() {
    return _$excludeSaleAsyncAction.run(() => super.excludeSale());
  }

  final _$setDataInitialRegisterSaleAsyncAction =
      AsyncAction('_SaleProductStore.setDataInitialRegisterSale');

  @override
  Future<void> setDataInitialRegisterSale() {
    return _$setDataInitialRegisterSaleAsyncAction
        .run(() => super.setDataInitialRegisterSale());
  }

  final _$setValueProductAsyncAction =
      AsyncAction('_SaleProductStore.setValueProduct');

  @override
  Future<void> setValueProduct(int value) {
    return _$setValueProductAsyncAction.run(() => super.setValueProduct(value));
  }

  final _$registerSaleAsyncAction =
      AsyncAction('_SaleProductStore.registerSale');

  @override
  Future<void> registerSale() {
    return _$registerSaleAsyncAction.run(() => super.registerSale());
  }

  final _$initEditSaleAsyncAction =
      AsyncAction('_SaleProductStore.initEditSale');

  @override
  Future<void> initEditSale() {
    return _$initEditSaleAsyncAction.run(() => super.initEditSale());
  }

  final _$updateSaleAsyncAction = AsyncAction('_SaleProductStore.updateSale');

  @override
  Future<void> updateSale() {
    return _$updateSaleAsyncAction.run(() => super.updateSale());
  }

  final _$_SaleProductStoreActionController =
      ActionController(name: '_SaleProductStore');

  @override
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<SaleDto> events) {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.fromModelToEventAppointment');
    try {
      return super.fromModelToEventAppointment(events);
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(String price) {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.setValue');
    try {
      return super.setValue(price);
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setControllerValue() {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.setControllerValue');
    try {
      return super.setControllerValue();
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionProductSold() {
    final _$actionInfo = _$_SaleProductStoreActionController.startAction(
        name: '_SaleProductStore.setDescriptionProductSold');
    try {
      return super.setDescriptionProductSold();
    } finally {
      _$_SaleProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events},
listSales: ${listSales},
selectedEvents: ${selectedEvents},
errorList: ${errorList},
listEmpty: ${listEmpty},
calendarController: ${calendarController},
sending: ${sending},
excluded: ${excluded},
excludedUnauthorized: ${excludedUnauthorized},
excludedFail: ${excludedFail},
listProducts: ${listProducts},
valueSelectProduct: ${valueSelectProduct},
controllerFieldValueProduct: ${controllerFieldValueProduct},
controllerFieldQtdProduct: ${controllerFieldQtdProduct},
quantity: ${quantity},
valueProduct: ${valueProduct},
created: ${created},
updateProduct: ${updateProduct},
errorSending: ${errorSending},
change: ${change},
accountClientProcess: ${accountClientProcess},
productDif: ${productDif},
updatedUnauthorized: ${updatedUnauthorized},
buttonExcludePressed: ${buttonExcludePressed},
quantityIsValid: ${quantityIsValid},
fieldsSaleIsValid: ${fieldsSaleIsValid},
productIsValid: ${productIsValid},
buttonRegisterSalePressed: ${buttonRegisterSalePressed},
buttonUpdateSalePressed: ${buttonUpdateSalePressed}
    ''';
  }
}
