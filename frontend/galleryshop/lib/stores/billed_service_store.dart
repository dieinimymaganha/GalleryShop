import 'package:flutter/material.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/webclients/webClient_service_record.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'billed_service_store.g.dart';

class BilledServiceStore = _BilledServiceStore with _$BilledServiceStore;

abstract class _BilledServiceStore with Store {
  final String typeEmployee;
  final int idEmployee;
  final int idClient;
  final int accountClientId;
  final String descTypeEmployee;
  final int idService;
  final int idSchedule;

  _BilledServiceStore(
      {this.typeEmployee,
      this.idEmployee,
      this.idClient,
      this.accountClientId,
      this.descTypeEmployee,
      this.idService,
      this.idSchedule}) {
    autorun((_) {
      print('idSchedule >>>> $idSchedule');
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
  void setControllerFieldDiscount() {
    if (discount == 0.0) {
      controllerFieldDiscount.text = '';
    } else {
      controllerFieldDiscount.text = convertMonetary(discount);
    }
  }

  @action
  void setDiscount(String value) {
    if (value.isEmpty) {
      discount = 0.0;
    } else if (value == null) {
      discount = 0.0;
    } else {
      value = value.replaceAll('.', '');
      value = value.replaceAll(',', '.');
      discount = double.parse(value);
    }
  }

  @action
  void setValue(String price) {
    if (price.isEmpty) {
      value = null;
    } else {
      price = price.replaceAll('.', '');
      price = price.replaceAll(',', '.');
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
          controllerFieldValue.text = convertMonetary(element.value);
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
        serviceId: valueSelectService,
        accountClientId: accountClientId,
        value: value,
        discount: discount,
        idSchedule: idSchedule);

    int response;
    try {
      response = await serviceRecordWebClient.save(serviceRecordForm);
    } on Exception catch (_) {
      response = 0;
    }

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

  //calendario de serviços - excluir

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  CalendarController calendarController = CalendarController();

  @observable
  List<dynamic> selectedEvents = List();

  @action
  Future<void> setListCalendar() async {
    try {
      listServices = await serviceRecordWebClient.findByClientId(idClient);
      if (listServices.isNotEmpty) {
        events = fromModelToEventAppointment(listServices);
      } else {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<ServiceRecordDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateService);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

// Editar serviços

  @action
  Future<void> initPageEditServices() async {
    try {
      listServices = await serviceRecordWebClient.findByClientId(idClient);
    } on Exception catch (_) {
      errorList = true;
    }

    setListCalendar();
  }

  @observable
  bool excluded = false;

  @observable
  bool excludedUnauthorized = false;

  @observable
  bool excludedFail = false;

  @action
  Future<void> excludeServiceRecord() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response = await serviceRecordWebClient.exclude(idService);
//    int response = 401;
    if (response == 200) {
      excluded = true;
      await Future.delayed(Duration(seconds: 2));
    } else if (response == 401) {
      excludedUnauthorized = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      excludedFail = false;
      sending = false;
    }
  }

  @action
  Future<void> reloadPageExcludeService() async {
    errorList = false;
    setListCalendar();
  }

  @computed
  Function get buttonExcludeServicePressed => excludeServiceRecord;
}
