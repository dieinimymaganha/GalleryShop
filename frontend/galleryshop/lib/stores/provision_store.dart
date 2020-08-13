import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'provision_store.g.dart';

class ProvisionStore = _ProvisionStore with _$ProvisionStore;

abstract class _ProvisionStore with Store {
  final ServiceModel serviceModel;

  _ProvisionStore({this.serviceModel}) {
    autorun((_) {});
  }

  final formatCurrency = new NumberFormat.currency(locale: 'pt_BR', symbol: '');

  final TypeEmployeeWebClient _webClientTypeEmployee = TypeEmployeeWebClient();
  final ServicesWebClient _webClientService = ServicesWebClient();

  TextEditingController controllerFieldValue = TextEditingController();

  TextEditingController controllerDescription = TextEditingController();

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  List<dynamic> listServices = List();

  @action
  Future<void> setList() async {
    loading = true;
//    await Future.delayed(Duration(seconds: 2));
    try {
      listServices = await _webClientService.findAll();
      listServices.sort((a, b) =>
          a.description.toString().compareTo(b.description.toString()));
      if (listServices.isEmpty) {
        errorList = true;
        listEmpty = true;
        loading = false;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    loading = false;
  }

  @action
  Future<void> recarregarList() async {
    errorList = false;
    setList();
  }

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
  bool duplicate = false;

  @observable
  bool created = false;

  @observable
  double priceFinal;

  @observable
  bool priceFixed = true;

  @observable
  bool excluded = false;

  @observable
  bool change = false;

  @observable
  bool excludedFail = false;

  @observable
  bool excluedBlock = false;

  @action
  void setChange() {
    if (serviceModel != null) {
      change = true;
    }
  }

  @action
  void setDescription(String value) => description = value;

  @action
  void setDataInitial() {
    if (serviceModel != null) {
      controllerDescription.text = serviceModel.description.toString();
      description = serviceModel.description.toString();
      if (serviceModel.value != null) {
        controllerFieldValue.text =
            formatCurrency.format(serviceModel.value).toString();

        valuePrice = formatCurrency.format(serviceModel.value).toString();
      } else {
        controllerFieldValue.text = '';
      }
      valueSelect = serviceModel.typeEmployee;
      priceFixed = serviceModel.fixedPrice;
    }
  }

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
  bool get descriptionChangeIsValid =>
      description != serviceModel.description.toString();

  @computed
  bool get valueSelectIsValid => valueSelect != null;

  @computed
  bool get valueSelectChangeIsValid => valueSelect != serviceModel.typeEmployee;

  @computed
  bool get priceFixedChangeIsValid => priceFixed != serviceModel.fixedPrice;

  @computed
  bool get valueChangeIsValid =>
      (valuePrice.length >= 4) &&
      (valuePrice != formatCurrency.format(serviceModel.value).toString());

  @computed
  bool get prixeFixedIsValid =>
      (priceFixed == false) || (priceFixed == true && valuePrice.length >= 4);

  @computed
  Function get buttomSavePressed =>
      (descriptionIsValid && valueSelectIsValid && prixeFixedIsValid)
          ? createServiceModel
          : null;

  @computed
  Function get buttonChangePressed => (descriptionChangeIsValid ||
          valueSelectChangeIsValid ||
          priceFixedChangeIsValid ||
          valueChangeIsValid)
      ? updateService
      : null;

  @action
  Future<void> updateService() async {
    ServiceForm serviceForm = ServiceForm(
        description: description,
        value: priceFinal,
        fixedPrice: priceFixed,
        descriptonTypeEmployee: valueSelect);

    print(serviceForm.toJson());

    await update(serviceForm);
    sending = true;
    await Future.delayed(Duration(seconds: 2));
  }

  @action
  Future<void> update(ServiceForm serviceForm) async {
    int response = await _webClientService.update(serviceForm, serviceModel.id);
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    if (response == 200) {
      created = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    errorSending = false;
    duplicate = false;
  }

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
    ServiceForm serviceCreated = ServiceForm(
        value: priceFinal,
        description: description,
        fixedPrice: priceFixed,
        descriptonTypeEmployee: valueSelect);
    await save(serviceCreated);
  }

  @action
  Future<void> save(ServiceForm serviceCreated) async {
    await send(serviceCreated);
  }

  Future<ServiceModel> send(ServiceForm serviceCreated) async {
    int response = await _webClientService.save(serviceCreated);
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    if (response == 201) {
      created = true;
    } else if (response == 500) {
      duplicate = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    created = false;
    sending = false;
    errorSending = false;
    duplicate = false;
  }

  @computed
  Function get excludePressed => excludeService;

  @action
  Future<void> excludeService() async {
    sending = true;
    int response = await _webClientService.exclude(serviceModel);
    await Future.delayed(Duration(seconds: 2));
    if (response == 200) {
      excluded = true;
    } else if (response == 500) {
      excluedBlock = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
    }
  }
}
