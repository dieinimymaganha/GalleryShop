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
      print('sending >>>>>>> ${sending}');
    });
  }

  final TypeEmployeeWebClient _webClientTypeEmployee = TypeEmployeeWebClient();
  final ServicesWebClient _webClientService = ServicesWebClient();

  TextEditingController controllerFieldValue = TextEditingController();

  TextEditingController controllerDescription = TextEditingController();

  @observable
  String valuePrice = '';

  @observable
  String description = '';

  @observable
  List<dynamic> dataServices = List();

  @observable
  String valueSelect;

  @observable
  TypeEmployeeModel typeEmployee;

  @observable
  bool sending = false;

  @observable
  bool errorSending = false;

  @observable
  bool created = false;

  @observable
  double priceFinal;

  @observable
  bool priceFixed = true;

  @action
  void setDescription(String value) => description = value;

  @action
  void setValuePrice(String value) {
    if (!priceFixed) {
      priceFinal = null;
    } else {
      valuePrice = value;
      value = value.replaceAll('.', '');
      value = value.replaceAll(',', '.');
      priceFinal = double.parse(value);
    }
  }

  @computed
  bool get descriptionIsValid => description != null && description.isNotEmpty;

  @computed
  bool get valueSelectIsValid => valueSelect != null;

  @computed
  bool get prixeFixedIsValid =>
      (priceFixed == false) || (priceFixed == true && valuePrice.length >= 4);

  @computed
  Function get buttomPressed =>
      (descriptionIsValid && valueSelectIsValid && prixeFixedIsValid)
          ? createServiceModel
          : null;

  @action
  void selectTypeService(String value) => valueSelect = value;

  @action
  void alterPriceFixed() {
    priceFixed = !priceFixed;
    setValuePrice(valuePrice);
  }

  void getServices() async {
    final response = await _webClientTypeEmployee.findAll();
    dataServices = response;
  }

  @action
  Future<void> createServiceModel() async {
    if (priceFinal != null) {
      valuePrice = valuePrice.replaceAll('.', '');
      valuePrice = valuePrice.replaceAll(',', '.');
      valuePrice = valuePrice;
      priceFinal = double.parse(valuePrice);
    }

    sending = true;
    await Future.delayed(Duration(seconds: 2));

    ServiceForm serviceCreated = ServiceForm(
        value: priceFinal,
        description: description,
        fixedPrice: priceFixed,
        descriptonTypeEmployee: valueSelect);
//    print(serviceCreated);
    await save(serviceCreated);
  }

  @action
  Future<void> save(ServiceForm serviceCreated) async {
    await send(serviceCreated);
  }

  Future<ServiceModel> send(ServiceForm serviceCreated) async {
    ServiceModel serviceModelReturn =
        await _webClientService.save(serviceCreated);

    if (serviceModelReturn != null) {
      created = true;
    } else {
      errorSending = true;
    }
    sending = false;
  }
}
