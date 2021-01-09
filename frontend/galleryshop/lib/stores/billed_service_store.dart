import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:mobx/mobx.dart';

part 'billed_service_store.g.dart';

class BilledServiceStore = _BilledServiceStore with _$BilledServiceStore;

abstract class _BilledServiceStore with Store {
  final String typeEmployee;
  final int idEmployee;
  final int idClient;

  _BilledServiceStore({this.typeEmployee, this.idEmployee, this.idClient}) {
    autorun((_) {
      print('idTypeEmployee >>> $typeEmployee');
      print('idEmployee >>> $idEmployee');
      print('idClient >>> $idClient');
    });
  }

  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  @observable
  EmployeeDto employeeDto;

  @observable
  List<dynamic> listEmployees = List();

  @observable
  int valueSelecIdtEmployee;

  void getListEmployees() async {
    listEmployees = await employeeWebClient.findAll();
  }

  @action
  Future<void> initPageBilled() async {
    getListEmployees();
    setValueSelectEmployee(idEmployee);
  }

  @action
  void setValueSelectEmployee(int value) => valueSelecIdtEmployee = value;
}
