import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
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
    await getInitialTypeEmployee();
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
}
