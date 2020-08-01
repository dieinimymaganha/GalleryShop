import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';

part 'provision_store.g.dart';

class ProvisionStore = _ProvisionStore with _$ProvisionStore;

abstract class _ProvisionStore with Store {
  _ProvisionStore() {
    autorun((_) {
      print('valuePrice >>>>>>> ${double.parse(valuePrice)}');
      print('valuePrice >>>>>>> ${double.parse(valuePrice)}');
    });
  }

  final TypeEmployeeWebClient _webClientTypeEmployee = TypeEmployeeWebClient();
  final ServicesWebClient _webClientService = ServicesWebClient();

//  MoneyMaskedTextController controllerFieldValue =
//      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  TextEditingController controllerFieldValue = TextEditingController();

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
  TypeEmployeeModel typeEmployee;


  @observable
  bool priceFixed = false;

  @action
  void setDescription(String value) => description = value;

  @action
  Future<void> setValuePrice(String value) async {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');
    valuePrice = value;
  }

  @action
  void selectTypeService(String value) => valueSelect = value;

  @action
  void alterPriceFixed() => priceFixed = !priceFixed;

  void getServices() async {
    final response = await _webClientTypeEmployee.findAll();
    dataServices = response;
  }

  @action
  Future<void> createServiceModel() async {
    ServiceForm serviceCreated = ServiceForm(
        value: double.parse(valuePrice),
        description: description,
        fixedPrice: priceFixed,
        descriptonTypeEmployee: valueSelect);
    print(serviceCreated);
    await save(serviceCreated);
  }

  @action
  Future<void> save(ServiceForm serviceCreated)async{
    await send(serviceCreated);

  }

  Future<ServiceModel> send(ServiceForm serviceCreated) async{
    await _webClientService.save(serviceCreated);
  }

}
