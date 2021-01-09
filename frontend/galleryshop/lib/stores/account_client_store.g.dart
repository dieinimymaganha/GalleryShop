// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountClientStore on _AccountClientStore, Store {
  Computed<List<AccountClientDto>> _$lisFilteredComputed;

  @override
  List<AccountClientDto> get lisFiltered => (_$lisFilteredComputed ??=
          Computed<List<AccountClientDto>>(() => super.lisFiltered,
              name: '_AccountClientStore.lisFiltered'))
      .value;

  final _$listClientAtom = Atom(name: '_AccountClientStore.listClient');

  @override
  List<dynamic> get listClient {
    _$listClientAtom.reportRead();
    return super.listClient;
  }

  @override
  set listClient(List<dynamic> value) {
    _$listClientAtom.reportWrite(value, super.listClient, () {
      super.listClient = value;
    });
  }

  final _$filterAtom = Atom(name: '_AccountClientStore.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AccountClientStore.loading');

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

  final _$errorListAtom = Atom(name: '_AccountClientStore.errorList');

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

  final _$listEmptyAtom = Atom(name: '_AccountClientStore.listEmpty');

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

  final _$listAccountClientAtom =
      Atom(name: '_AccountClientStore.listAccountClient');

  @override
  ObservableList<AccountClientDto> get listAccountClient {
    _$listAccountClientAtom.reportRead();
    return super.listAccountClient;
  }

  @override
  set listAccountClient(ObservableList<AccountClientDto> value) {
    _$listAccountClientAtom.reportWrite(value, super.listAccountClient, () {
      super.listAccountClient = value;
    });
  }

  final _$setListAsyncAction = AsyncAction('_AccountClientStore.setList');

  @override
  Future<void> setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  final _$_AccountClientStoreActionController =
      ActionController(name: '_AccountClientStore');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListAccountClient() {
    final _$actionInfo = _$_AccountClientStoreActionController.startAction(
        name: '_AccountClientStore.setListAccountClient');
    try {
      return super.setListAccountClient();
    } finally {
      _$_AccountClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listClient: ${listClient},
filter: ${filter},
loading: ${loading},
errorList: ${errorList},
listEmpty: ${listEmpty},
listAccountClient: ${listAccountClient},
lisFiltered: ${lisFiltered}
    ''';
  }
}
