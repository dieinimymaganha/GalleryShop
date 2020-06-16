// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerStore on _DrawerStore, Store {
  Computed<Function> _$buttomPressComputed;

  @override
  Function get buttomPress =>
      (_$buttomPressComputed ??= Computed<Function>(() => super.buttomPress,
              name: '_DrawerStore.buttomPress'))
          .value;
  Computed<bool> _$isHighlightedComputed;

  @override
  bool get isHighlighted =>
      (_$isHighlightedComputed ??= Computed<bool>(() => super.isHighlighted,
              name: '_DrawerStore.isHighlighted'))
          .value;

  final _$pageAtom = Atom(name: '_DrawerStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_DrawerStoreActionController = ActionController(name: '_DrawerStore');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_DrawerStoreActionController.startAction(
        name: '_DrawerStore.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_DrawerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
buttomPress: ${buttomPress},
isHighlighted: ${isHighlighted}
    ''';
  }
}
