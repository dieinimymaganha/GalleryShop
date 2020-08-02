// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provision_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProvisionStore on _ProvisionStore, Store {
  Computed<bool> _$descriptionIsValidComputed;

  @override
  bool get descriptionIsValid => (_$descriptionIsValidComputed ??=
          Computed<bool>(() => super.descriptionIsValid,
              name: '_ProvisionStore.descriptionIsValid'))
      .value;
  Computed<bool> _$valueSelectIsValidComputed;

  @override
  bool get valueSelectIsValid => (_$valueSelectIsValidComputed ??=
          Computed<bool>(() => super.valueSelectIsValid,
              name: '_ProvisionStore.valueSelectIsValid'))
      .value;
  Computed<bool> _$prixeFixedIsValidComputed;

  @override
  bool get prixeFixedIsValid => (_$prixeFixedIsValidComputed ??= Computed<bool>(
          () => super.prixeFixedIsValid,
          name: '_ProvisionStore.prixeFixedIsValid'))
      .value;
  Computed<Function> _$buttomPressedComputed;

  @override
  Function get buttomPressed =>
      (_$buttomPressedComputed ??= Computed<Function>(() => super.buttomPressed,
              name: '_ProvisionStore.buttomPressed'))
          .value;
  Computed<Function> _$excludePressedComputed;

  @override
  Function get excludePressed => (_$excludePressedComputed ??=
          Computed<Function>(() => super.excludePressed,
              name: '_ProvisionStore.excludePressed'))
      .value;

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

  final _$sendingAtom = Atom(name: '_ProvisionStore.sending');

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

  final _$errorSendingAtom = Atom(name: '_ProvisionStore.errorSending');

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

  final _$duplicateAtom = Atom(name: '_ProvisionStore.duplicate');

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

  final _$createdAtom = Atom(name: '_ProvisionStore.created');

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

  final _$priceFinalAtom = Atom(name: '_ProvisionStore.priceFinal');

  @override
  double get priceFinal {
    _$priceFinalAtom.reportRead();
    return super.priceFinal;
  }

  @override
  set priceFinal(double value) {
    _$priceFinalAtom.reportWrite(value, super.priceFinal, () {
      super.priceFinal = value;
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

  final _$excludedAtom = Atom(name: '_ProvisionStore.excluded');

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

  final _$excludeServiceAsyncAction =
      AsyncAction('_ProvisionStore.excludeService');

  @override
  Future<void> excludeService() {
    return _$excludeServiceAsyncAction.run(() => super.excludeService());
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
  void setValuePrice(String value) {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.setValuePrice');
    try {
      return super.setValuePrice(value);
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
sending: ${sending},
errorSending: ${errorSending},
duplicate: ${duplicate},
created: ${created},
priceFinal: ${priceFinal},
priceFixed: ${priceFixed},
excluded: ${excluded},
descriptionIsValid: ${descriptionIsValid},
valueSelectIsValid: ${valueSelectIsValid},
prixeFixedIsValid: ${prixeFixedIsValid},
buttomPressed: ${buttomPressed},
excludePressed: ${excludePressed}
    ''';
  }
}
