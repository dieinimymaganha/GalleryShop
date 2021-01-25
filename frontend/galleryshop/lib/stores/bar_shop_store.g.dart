// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_shop_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BarShopStore on _BarShopStore, Store {
  Computed<bool> _$descriptionIsValidComputed;

  @override
  bool get descriptionIsValid => (_$descriptionIsValidComputed ??=
          Computed<bool>(() => super.descriptionIsValid,
              name: '_BarShopStore.descriptionIsValid'))
      .value;
  Computed<bool> _$valueIsValidComputed;

  @override
  bool get valueIsValid =>
      (_$valueIsValidComputed ??= Computed<bool>(() => super.valueIsValid,
              name: '_BarShopStore.valueIsValid'))
          .value;
  Computed<bool> _$fieldsIsValidComputed;

  @override
  bool get fieldsIsValid =>
      (_$fieldsIsValidComputed ??= Computed<bool>(() => super.fieldsIsValid,
              name: '_BarShopStore.fieldsIsValid'))
          .value;
  Computed<Function> _$buttonSavePressedComputed;

  @override
  Function get buttonSavePressed => (_$buttonSavePressedComputed ??=
          Computed<Function>(() => super.buttonSavePressed,
              name: '_BarShopStore.buttonSavePressed'))
      .value;

  final _$controllerFieldDescriptionAtom =
      Atom(name: '_BarShopStore.controllerFieldDescription');

  @override
  TextEditingController get controllerFieldDescription {
    _$controllerFieldDescriptionAtom.reportRead();
    return super.controllerFieldDescription;
  }

  @override
  set controllerFieldDescription(TextEditingController value) {
    _$controllerFieldDescriptionAtom
        .reportWrite(value, super.controllerFieldDescription, () {
      super.controllerFieldDescription = value;
    });
  }

  final _$controllerFieldValueAtom =
      Atom(name: '_BarShopStore.controllerFieldValue');

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

  final _$descriptionAtom = Atom(name: '_BarShopStore.description');

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

  final _$valueAtom = Atom(name: '_BarShopStore.value');

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

  final _$sendingAtom = Atom(name: '_BarShopStore.sending');

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

  final _$createdAtom = Atom(name: '_BarShopStore.created');

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

  final _$duplicateAtom = Atom(name: '_BarShopStore.duplicate');

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

  final _$errorSendingAtom = Atom(name: '_BarShopStore.errorSending');

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

  final _$saveAsyncAction = AsyncAction('_BarShopStore.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_BarShopStoreActionController =
      ActionController(name: '_BarShopStore');

  @override
  void setValue(String price) {
    final _$actionInfo = _$_BarShopStoreActionController.startAction(
        name: '_BarShopStore.setValue');
    try {
      return super.setValue(price);
    } finally {
      _$_BarShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_BarShopStoreActionController.startAction(
        name: '_BarShopStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_BarShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerFieldDescription: ${controllerFieldDescription},
controllerFieldValue: ${controllerFieldValue},
description: ${description},
value: ${value},
sending: ${sending},
created: ${created},
duplicate: ${duplicate},
errorSending: ${errorSending},
descriptionIsValid: ${descriptionIsValid},
valueIsValid: ${valueIsValid},
fieldsIsValid: ${fieldsIsValid},
buttonSavePressed: ${buttonSavePressed}
    ''';
  }
}
