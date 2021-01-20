import 'package:galleryshop/http/webclients/webclient_employee.dart';
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

  @observable
  EmployeeDto employeeDto;

  @observable
  List<dynamic> listEmployees = List();

  @observable
  int valueSelecIdtEmployee;

  @observable
  int valueSelectTypeEmployee;

  @observable
  List<dynamic> listTypeEmployee = List();

  @action
  Future<void> getListEmployees() async {
    listEmployees = await employeeWebClient.findAll();
  }

  void getListTypeEmployee() {
    listEmployees.forEach((element) {
      if (element.id == valueSelecIdtEmployee) {
        listTypeEmployee = element.typeEmployees;
      }
    });
  }

  @action
  void getInitialTypeEmployee() {
    print('LANGO>>>');
    listTypeEmployee.forEach((element) {
      print('ELEMENTO >>> $element');
      if (element.description == descTypeEmployee) {
        valueSelectTypeEmployee = element.id;
      }
    });
  }

  @action
  void initPageBilled() async {
    await getListEmployees();
    setValueSelectEmployee(idEmployee);
    getInitialTypeEmployee();
  }

  @action
  void resetValueSelectTypeEmployee() {
    valueSelectTypeEmployee = null;
  }

  @action
  void setValueSelectEmployee(int value) {
    valueSelecIdtEmployee = value;
    getListTypeEmployee();
  }

  @action
  void setValueSelectTypeEmployee(int value) => valueSelectTypeEmployee = value;
}
