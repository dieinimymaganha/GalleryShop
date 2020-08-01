import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:mobx/mobx.dart';

part 'provision_store.g.dart';

class ProvisionStore = _ProvisionStore with _$ProvisionStore;

abstract class _ProvisionStore with Store {

  _ProvisionStore() {
    autorun((_) {
//      print('description >>>>>>> ${description}');
//      print('valuePrice >>>>>>> ${valuePrice}');
    });

  }

  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  @observable
  MoneyMaskedTextController controllerFieldValue =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  @observable
  TextEditingController controllerDescription = TextEditingController();

  @observable
  String valuePrice;

  @observable
  String description;

  @observable
  List<dynamic> dataServices = List();

  @observable
  String valueSelect;

  @observable
  bool priceFixed = false;

  @action
  void setDescription(String value) => description = value;

  @action
  void setValuePrice(String value) => valuePrice = value;

  @action
  void selectTypeService(String value) => valueSelect = value;

  @action
  void alterPriceFixed() => priceFixed = !priceFixed;

  void getServices() async {
    final response = await _webClient.findAll();
    dataServices = response;
  }
}
