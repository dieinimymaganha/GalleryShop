// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TypeEmployeeStore on _TypeEmployeeStore, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_TypeEmployeeStore.isValid'))
      .value;
  Computed<bool> _$isValidNewTypeEmployeeComputed;

  @override
  bool get isValidNewTypeEmployee => (_$isValidNewTypeEmployeeComputed ??=
          Computed<bool>(() => super.isValidNewTypeEmployee,
              name: '_TypeEmployeeStore.isValidNewTypeEmployee'))
      .value;
  Computed<bool> _$descriptionDifComputed;

  @override
  bool get descriptionDif =>
      (_$descriptionDifComputed ??= Computed<bool>(() => super.descriptionDif,
              name: '_TypeEmployeeStore.descriptionDif'))
          .value;
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_TypeEmployeeStore.descriptionValid'))
      .value;
  Computed<bool> _$validSaveComputed;

  @override
  bool get validSave =>
      (_$validSaveComputed ??= Computed<bool>(() => super.validSave,
              name: '_TypeEmployeeStore.validSave'))
          .value;
  Computed<Function> _$excludePressedComputed;

  @override
  Function get excludePressed => (_$excludePressedComputed ??=
          Computed<Function>(() => super.excludePressed,
              name: '_TypeEmployeeStore.excludePressed'))
      .value;
  Computed<Function> _$savePressedComputed;

  @override
  Function get savePressed =>
      (_$savePressedComputed ??= Computed<Function>(() => super.savePressed,
              name: '_TypeEmployeeStore.savePressed'))
          .value;

  final _$_controllerDescriptionAtom =
      Atom(name: '_TypeEmployeeStore._controllerDescription');

  @override
  TextEditingController get _controllerDescription {
    _$_controllerDescriptionAtom.reportRead();
    return super._controllerDescription;
  }

  @override
  set _controllerDescription(TextEditingController value) {
    _$_controllerDescriptionAtom
        .reportWrite(value, super._controllerDescription, () {
      super._controllerDescription = value;
    });
  }

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

  final _$excludingAtom = Atom(name: '_TypeEmployeeStore.excluding');

  @override
  bool get excluding {
    _$excludingAtom.reportRead();
    return super.excluding;
  }

  @override
  set excluding(bool value) {
    _$excludingAtom.reportWrite(value, super.excluding, () {
      super.excluding = value;
    });
  }

  final _$notAuthorizedAtom = Atom(name: '_TypeEmployeeStore.notAuthorized');

  @override
  bool get notAuthorized {
    _$notAuthorizedAtom.reportRead();
    return super.notAuthorized;
  }

  @override
  set notAuthorized(bool value) {
    _$notAuthorizedAtom.reportWrite(value, super.notAuthorized, () {
      super.notAuthorized = value;
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

  final _$saveOrUpdateTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.saveOrUpdateTypeEmployee');

  @override
  Future<TypeEmployeeModel> saveOrUpdateTypeEmployee() {
    return _$saveOrUpdateTypeEmployeeAsyncAction
        .run(() => super.saveOrUpdateTypeEmployee());
  }

  final _$excludeTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.excludeTypeEmployee');

  @override
  Future<void> excludeTypeEmployee() {
    return _$excludeTypeEmployeeAsyncAction
        .run(() => super.excludeTypeEmployee());
  }

  final _$sendExcludeTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.sendExcludeTypeEmployee');

  @override
  Future<int> sendExcludeTypeEmployee(TypeEmployeeModel typeEmployeeExclude) {
    return _$sendExcludeTypeEmployeeAsyncAction
        .run(() => super.sendExcludeTypeEmployee(typeEmployeeExclude));
  }

  final _$saveTypeEmployeeAsyncAction =
      AsyncAction('_TypeEmployeeStore.saveTypeEmployee');

  @override
  Future<TypeEmployeeModel> saveTypeEmployee() {
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
  void updateTypeEmployee(String description) {
    final _$actionInfo = _$_TypeEmployeeStoreActionController.startAction(
        name: '_TypeEmployeeStore.updateTypeEmployee');
    try {
      return super.updateTypeEmployee(description);
    } finally {
      _$_TypeEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createNewTypeEmployee(String description) {
    final _$actionInfo = _$_TypeEmployeeStoreActionController.startAction(
        name: '_TypeEmployeeStore.createNewTypeEmployee');
    try {
      return super.createNewTypeEmployee(description);
    } finally {
      _$_TypeEmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
excluding: ${excluding},
notAuthorized: ${notAuthorized},
excluded: ${excluded},
isValid: ${isValid},
isValidNewTypeEmployee: ${isValidNewTypeEmployee},
descriptionDif: ${descriptionDif},
descriptionValid: ${descriptionValid},
validSave: ${validSave},
excludePressed: ${excludePressed},
savePressed: ${savePressed}
    ''';
  }
}
