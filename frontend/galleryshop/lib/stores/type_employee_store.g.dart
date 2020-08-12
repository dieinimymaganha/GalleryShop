// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TypeEmployeeStore on _TypeEmployeeStore, Store {
  Computed<bool> _$changeIsValidComputed;

  @override
  bool get changeIsValid =>
      (_$changeIsValidComputed ??= Computed<bool>(() => super.changeIsValid,
              name: '_TypeEmployeeStore.changeIsValid'))
          .value;
  Computed<Function> _$buttomChangePressedComputed;

  @override
  Function get buttomChangePressed => (_$buttomChangePressedComputed ??=
          Computed<Function>(() => super.buttomChangePressed,
              name: '_TypeEmployeeStore.buttomChangePressed'))
      .value;
  Computed<Function> _$buttomSavePressedComputed;

  @override
  Function get buttomSavePressed => (_$buttomSavePressedComputed ??=
          Computed<Function>(() => super.buttomSavePressed,
              name: '_TypeEmployeeStore.buttomSavePressed'))
      .value;
  Computed<bool> _$saveIsValidComputed;

  @override
  bool get saveIsValid =>
      (_$saveIsValidComputed ??= Computed<bool>(() => super.saveIsValid,
              name: '_TypeEmployeeStore.saveIsValid'))
          .value;
  Computed<bool> _$excludeIsvalidComputed;

  @override
  bool get excludeIsvalid =>
      (_$excludeIsvalidComputed ??= Computed<bool>(() => super.excludeIsvalid,
              name: '_TypeEmployeeStore.excludeIsvalid'))
          .value;
  Computed<Function> _$buttonExcludePressedComputed;

  @override
  Function get buttonExcludePressed => (_$buttonExcludePressedComputed ??=
          Computed<Function>(() => super.buttonExcludePressed,
              name: '_TypeEmployeeStore.buttonExcludePressed'))
      .value;

  final _$descriptionAtom = Atom(name: '_TypeEmployeeStore.description');

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

  final _$controllerFieldDescriptionAtom =
      Atom(name: '_TypeEmployeeStore.controllerFieldDescription');

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

  final _$sendingAtom = Atom(name: '_TypeEmployeeStore.sending');

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

  final _$excludedFailAtom = Atom(name: '_TypeEmployeeStore.excludedFail');

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

  final _$excluedBlockAtom = Atom(name: '_TypeEmployeeStore.excluedBlock');

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

  final _$excludedAtom = Atom(name: '_TypeEmployeeStore.excluded');

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

  final _$changeAtom = Atom(name: '_TypeEmployeeStore.change');

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

  final _$errorSendingAtom = Atom(name: '_TypeEmployeeStore.errorSending');

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

  final _$createdAtom = Atom(name: '_TypeEmployeeStore.created');

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

  final _$excludeTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.excludeTypeEmployee');

  @override
  Future<void> excludeTypeEmployee() {
    return _$excludeTypeEmployeeAsyncAction
        .run(() => super.excludeTypeEmployee());
  }

  final _$updateTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.updateTypeEmployee');

  @override
  Future<void> updateTypeEmployee() {
    return _$updateTypeEmployeeAsyncAction
        .run(() => super.updateTypeEmployee());
  }

  final _$saveTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.saveTypeEmployee');

  @override
  Future<void> saveTypeEmployee() {
    return _$saveTypeEmployeeAsyncAction.run(() => super.saveTypeEmployee());
  }

  final _$_TypeEmployeeStoreActionController =
      ActionController(name: '_TypeEmployeeStore');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TypeEmployeeStoreActionController.startAction(
        name: '_TypeEmployeeStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TypeEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionInit() {
    final _$actionInfo = _$_TypeEmployeeStoreActionController.startAction(
        name: '_TypeEmployeeStore.setDescriptionInit');
    try {
      return super.setDescriptionInit();
    } finally {
      _$_TypeEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
controllerFieldDescription: ${controllerFieldDescription},
sending: ${sending},
excludedFail: ${excludedFail},
excluedBlock: ${excluedBlock},
excluded: ${excluded},
change: ${change},
errorSending: ${errorSending},
created: ${created},
changeIsValid: ${changeIsValid},
buttomChangePressed: ${buttomChangePressed},
buttomSavePressed: ${buttomSavePressed},
saveIsValid: ${saveIsValid},
excludeIsvalid: ${excludeIsvalid},
buttonExcludePressed: ${buttonExcludePressed}
    ''';
  }
}
