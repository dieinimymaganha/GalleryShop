// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinancialStore on _FinancialStore, Store {
  final _$dataFlagCardPaymentAtom =
      Atom(name: '_FinancialStore.dataFlagCardPayment');

  @override
  List<dynamic> get dataFlagCardPayment {
    _$dataFlagCardPaymentAtom.reportRead();
    return super.dataFlagCardPayment;
  }

  @override
  set dataFlagCardPayment(List<dynamic> value) {
    _$dataFlagCardPaymentAtom.reportWrite(value, super.dataFlagCardPayment, () {
      super.dataFlagCardPayment = value;
    });
  }

  final _$initListAsyncAction = AsyncAction('_FinancialStore.initList');

  @override
  Future<void> initList() {
    return _$initListAsyncAction.run(() => super.initList());
  }

  @override
  String toString() {
    return '''
dataFlagCardPayment: ${dataFlagCardPayment}
    ''';
  }
}
