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
  Computed<bool> _$descriptionChangeIsValidComputed;

  @override
  bool get descriptionChangeIsValid => (_$descriptionChangeIsValidComputed ??=
          Computed<bool>(() => super.descriptionChangeIsValid,
              name: '_ProvisionStore.descriptionChangeIsValid'))
      .value;
  Computed<bool> _$valueSelectIsValidComputed;

  @override
  bool get valueSelectIsValid => (_$valueSelectIsValidComputed ??=
          Computed<bool>(() => super.valueSelectIsValid,
              name: '_ProvisionStore.valueSelectIsValid'))
      .value;
  Computed<bool> _$valueSelectChangeIsValidComputed;

  @override
  bool get valueSelectChangeIsValid => (_$valueSelectChangeIsValidComputed ??=
          Computed<bool>(() => super.valueSelectChangeIsValid,
              name: '_ProvisionStore.valueSelectChangeIsValid'))
      .value;
  Computed<bool> _$priceFixedChangeIsValidComputed;

  @override
  bool get priceFixedChangeIsValid => (_$priceFixedChangeIsValidComputed ??=
          Computed<bool>(() => super.priceFixedChangeIsValid,
              name: '_ProvisionStore.priceFixedChangeIsValid'))
      .value;
  Computed<bool> _$valueChangeIsValidComputed;

  @override
  bool get valueChangeIsValid => (_$valueChangeIsValidComputed ??=
          Computed<bool>(() => super.valueChangeIsValid,
              name: '_ProvisionStore.valueChangeIsValid'))
      .value;
  Computed<bool> _$prixeFixedIsValidComputed;

  @override
  bool get prixeFixedIsValid => (_$prixeFixedIsValidComputed ??= Computed<bool>(
          () => super.prixeFixedIsValid,
          name: '_ProvisionStore.prixeFixedIsValid'))
      .value;
  Computed<Function> _$buttomSavePressedComputed;

  @override
  Function get buttomSavePressed => (_$buttomSavePressedComputed ??=
          Computed<Function>(() => super.buttomSavePressed,
              name: '_ProvisionStore.buttomSavePressed'))
      .value;
  Computed<Function> _$buttonChangePressedComputed;

  @override
  Function get buttonChangePressed => (_$buttonChangePressedComputed ??=
          Computed<Function>(() => super.buttonChangePressed,
              name: '_ProvisionStore.buttonChangePressed'))
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

  final _$changeAtom = Atom(name: '_ProvisionStore.change');

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

  final _$excludedFailAtom = Atom(name: '_ProvisionStore.excludedFail');

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

  final _$excluedBlockAtom = Atom(name: '_ProvisionStore.excluedBlock');

  @override
  bool get excluedBlock {
    _$excluedBlockAtom.reportRead();
    return super.excluedBlock;
  }

  @override
  set excluedBlock(bool value) {
    _$excluedBlockAtom.reportWrite(value, super.excluedBlock, () {
      super.excluedBlock = value;
    });
  }

  final _$updateServiceAsyncAction =
      AsyncAction('_ProvisionStore.updateService');

  @override
  Future<void> updateService() {
    return _$updateServiceAsyncAction.run(() => super.updateService());
  }

  final _$updateAsyncAction = AsyncAction('_ProvisionStore.update');

  @override
  Future<void> update(ServiceForm serviceForm) {
    return _$updateAsyncAction.run(() => super.update(serviceForm));
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
  void setChange() {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.setChange');
    try {
      return super.setChange();
    } finally {
      _$_ProvisionStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void setDataInitial() {
    final _$actionInfo = _$_ProvisionStoreActionController.startAction(
        name: '_ProvisionStore.setDataInitial');
    try {
      return super.setDataInitial();
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
change: ${change},
excludedFail: ${excludedFail},
excluedBlock: ${excluedBlock},
descriptionIsValid: ${descriptionIsValid},
descriptionChangeIsValid: ${descriptionChangeIsValid},
valueSelectIsValid: ${valueSelectIsValid},
valueSelectChangeIsValid: ${valueSelectChangeIsValid},
priceFixedChangeIsValid: ${priceFixedChangeIsValid},
valueChangeIsValid: ${valueChangeIsValid},
prixeFixedIsValid: ${prixeFixedIsValid},
buttomSavePressed: ${buttomSavePressed},
buttonChangePressed: ${buttonChangePressed},
excludePressed: ${excludePressed}
    ''';
  }
}
