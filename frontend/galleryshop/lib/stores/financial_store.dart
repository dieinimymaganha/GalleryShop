import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:mobx/mobx.dart';

part 'financial_store.g.dart';

class FinancialStore = _FinancialStore with _$FinancialStore;

abstract class _FinancialStore with Store {
  _FinancialStore() {
    autorun((_) {
      print('');
    });
  }

  FinancialWebClient financialWebClient = FinancialWebClient();

  @observable
  List<dynamic> dataFlagCardPayment = List();

  @action
  Future<void> initList() async {
    dataFlagCardPayment = await financialWebClient.findAll();
  }
}
