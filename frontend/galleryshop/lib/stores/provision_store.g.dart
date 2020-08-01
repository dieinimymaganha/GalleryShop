// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provision_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProvisionStore on _ProvisionStore, Store {
  final _$valuePriceAtom = Atom(name: '_ProvisionStore.valuePrice');

  @override
  String get valuePrice {
    _$valuePriceAtom.reportRead();
    return super.valuePrice;
  }

  @override
  set valuePrice(String value) {
    _$valuePriceAtom.reportWrite(value, super.valuePrice, () {
      super.valuePrice = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_ProvisionStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$dataServicesAtom = Atom(name: '_ProvisionStore.dataServices');

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

  final _$valueSelectAtom = Atom(name: '_ProvisionStore.valueSelect');

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

  final _$typeEmployeeAtom = Atom(name: '_ProvisionStore.typeEmployee');

  @override
  TypeEmployeeModel get typeEmployee {
    _$typeEmployeeAtom.reportRead();
    return super.typeEmployee;
  }

  @override
  set typeEmployee(TypeEmployeeModel value) {
    _$typeEmployeeAtom.reportWrite(value, super.typeEmployee, () {
      super.typeEmployee = value;
    });
  }

  final _$priceFixedAtom = Atom(name: '_ProvisionStore.priceFixed');

  @override
  bool get priceFixed {
    _$priceFixedAtom.reportRead();
    return super.priceFixed;
  }

  @override
  set priceFixed(bool value) {
    _$priceFixedAtom.reportWrite(value, super.priceFixed, () {
      super.priceFixed = value;
    });
  }

  final _$setValuePriceAsyncAction =
      AsyncAction('_ProvisionStore.setValuePrice');

  @override
  Future<void> setValuePrice(String value) {
    return _$setValuePriceAsyncAction.run(() => super.setValuePrice(value));
  }

  final _$createServiceModelAsyncAction =
      AsyncAction('_ProvisionStore.createServiceModel');

  @override
  Future<void> createServiceModel() {
    return _$createServiceModelAsyncAction
        .run(() => super.createServiceModel());
  }

  final _$saveAsyncAction = AsyncAction('_ProvisionStore.save');

  @override
  Future<void> save(ServiceForm serviceCreated) {
    return _$saveAsyncAction.run(() => super.save(serviceCreated));
  }

  final _$_ProvisionStoreActionController =
      ActionController(name: '_ProvisionStore');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ProvisionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTypeService(String value) {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.selectTypeService');
    try {
      return super.selectTypeService(value);
    } finally {
      _$_ProvisionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterPriceFixed() {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.alterPriceFixed');
    try {
      return super.alterPriceFixed();
    } finally {
      _$_ProvisionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valuePrice: ${valuePrice},
description: ${description},
dataServices: ${dataServices},
valueSelect: ${valueSelect},
typeEmployee: ${typeEmployee},
priceFixed: ${priceFixed}
    ''';
  }
}
