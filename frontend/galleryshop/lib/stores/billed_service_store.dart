import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webClient_service_record.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:mobx/mobx.dart';

part 'billed_service_store.g.dart';

class BilledServiceStore = _BilledServiceStore with _$BilledServiceStore;

abstract class _BilledServiceStore with Store {
  final String typeEmployee;
  final int idEmployee;
  final int idClient;
  final String descTypeEmployee;

  _BilledServiceStore(
      {this.typeEmployee,
      this.idEmployee,
      this.idClient,
      this.descTypeEmployee}) {
    autorun((_) {
      print('listEmployees >>> $listEmployees');
    });
  }

  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  ServicesWebClient servicesWebClient = ServicesWebClient();

  ServiceRecordWebClient serviceRecordWebClient = ServiceRecordWebClient();

  @observable
  EmployeeDto employeeDto;

  @observable
  List<dynamic> listEmployees = List();

  @observable
  List<dynamic> listServices = List();

  @observable
  int valueSelecIdtEmployee;

  @observable
  int valueSelectTypeEmployee;

  @observable
  List<dynamic> listTypeEmployee = List();

  @observable
  int valueSelectService;

  @action
  Future<void> getListEmployees() async {
    listEmployees = await employeeWebClient.findAll();
  }

  @action
  Future<void> getListServices() async {
    loadingServices = true;
    await Future.delayed(Duration(seconds: 1));
    listServices =
        await servicesWebClient.findByTypeEmployeeId(valueSelectTypeEmployee);
    loadingServices = false;
  }

  void getListTypeEmployee() {
    listEmployees.forEach((element) {
      if (element.id == valueSelecIdtEmployee) {
        listTypeEmployee = element.typeEmployees;
      }
    });
  }

  @action
  Future<void> getInitialTypeEmployee() async {
    listTypeEmployee.forEach((element) {
      if (element.description == descTypeEmployee) {
        valueSelectTypeEmployee = element.id;
      }
    });
    await getListServices();
  }

  @observable
  bool loading = false;

  @observable
  bool loadingServices = false;

  @action
  Future<void> initPageBilled() async {
    await getListEmployees();
    setValueSelectEmployee(idEmployee);

    if (descTypeEmployee != null) {
      await getInitialTypeEmployee();
    }
    setControllerFieldDiscount();
  }

  @action
  void resetValueSelectTypeEmployee() {
    valueSelectTypeEmployee = null;
  }

  @action
  void resetValueSelectService() {
    valueSelectService = null;
  }

  @action
  void resetControllerValue() {
    controllerFieldValue.text = '';
  }

  @action
  void setValueSelectEmployee(int value) {
    valueSelecIdtEmployee = value;
    getListTypeEmployee();
  }

  @action
  Future<void> setValueSelectTypeEmployee(int value) async {
    valueSelectTypeEmployee = value;
    await getListServices();
  }

  @action
  void setValueSelectService(int value) {
    valueSelectService = value;
  }

  @observable
  TextEditingController controllerFieldValue = TextEditingController();

  @observable
  double value;

  @observable
  bool enableValue = false;

  @observable
  double discount = 0.0;

  @observable
  TextEditingController controllerFieldDiscount = TextEditingController();

  @action
  void setControllerFieldDiscount() =>
      controllerFieldDiscount.text = discount.toString();

  @action
  void setDiscount(String value) {
    if (value.isEmpty) {
      discount = 0.0;
    } else {
      discount = double.parse(value);
    }
  }

  @action
  void setValue(String price) {
    if (price.isEmpty) {
      value = null;
    } else {
      value = double.parse(price);
    }
  }

  @action
  void setControllerValue() {
    controllerFieldValue.text = '';
    listServices.forEach((element) {
      if (element.id == valueSelectService) {
        if (element.value == null) {
          controllerFieldValue.text = '';
          value = null;
          enableValue = true;
        } else {
          controllerFieldValue.text = element.value.toString();
          value = element.value;
          enableValue = false;
        }
      }
    });
  }

  @observable
  bool created = false;

  @observable
  bool sending = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> save() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    ServiceRecordForm serviceRecordForm = ServiceRecordForm(
      employeeId: valueSelecIdtEmployee,
      clientId: idClient,
      serviceId: valueSelectService,
      value: value,
      discount: discount,
    );

    int response = await serviceRecordWebClient.save(serviceRecordForm);

    if (response == 201) {
      created = true;
    } else {
      errorSending = true;
    }

    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;

    print(serviceRecordForm.toJson());
  }

  @computed
  bool get valueSelecIdtEmployeeIsValid => valueSelecIdtEmployee != null;

  @computed
  bool get idClientIsValid => idClient != null;

  @computed
  bool get valueSelectServiceIdIsValid => valueSelectService != null;

  @computed
  bool get valueIsValid => value != null;

  @computed
  bool get fieldsValid =>
      valueSelecIdtEmployeeIsValid &&
      idClientIsValid &&
      valueSelectServiceIdIsValid &&
      valueIsValid;

  @computed
  Function get buttonPressed => fieldsValid ? save : null;
}
