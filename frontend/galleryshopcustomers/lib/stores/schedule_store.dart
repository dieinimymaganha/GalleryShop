import 'package:galleryshopcustomers/http/webclients/webclient_employee.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_schedule.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_type_employee.dart';
import 'package:galleryshopcustomers/models/employee.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:galleryshopcustomers/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final ScheduleDto scheduleDto;

  _ScheduleStore({this.scheduleDto}) {
    autorun((_) {
      print('listEmployee >>>> ${listEmployee}');
    });
  }

  ScheduleWebClient scheduleWebClient = ScheduleWebClient();

  TypeEmployeeWebClient typeEmployeeWebClient = TypeEmployeeWebClient();

  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  @observable
  CalendarController calendarController = CalendarController();

  @observable
  List<dynamic> dataSchedule = List();

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  List<dynamic> dataServices = List();

  @observable
  List<dynamic> listEmployee = List();

  @observable
  int idFindEmployee;

  @observable
  String valueSelectEmployee;

  @observable
  bool loadingListEmployee = true;

  @observable
  String valueSelect;

  @action
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ScheduleDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      if (event.available == false) {
        DateTime date = convertDateFromString(event.day);
        if (data[date] == null) data[date] = [];
        data[date].add(event);
      }
    });
    return data;
  }

  @action
  Future<void> setListSchedule() async {
    dataSchedule = await scheduleWebClient.findScheduleIdEmployee('4');
    if (dataSchedule.isNotEmpty) {
      events = fromModelToEvent(dataSchedule);
    }
  }

  void getServices() async {
    final response = await typeEmployeeWebClient.findAll();
    dataServices = response;
  }

  @action
  Future<void> getEmployeeTypeEmployee(int id) async {
    final response = await employeeWebClient.findEmployeeTypeEmployee(id);
    listEmployee = response;
  }

  @action
  void selectTypeService(String value) => valueSelect = value;

  @action
  void resetEmployee() => valueSelectEmployee = null;

  @action
  void selectEmployee(String value) => valueSelectEmployee = value;

  @action
  Future<void> setIdTypeEmployee(String value) async {
    dataServices.forEach((element) {
      if (value == element.description) {
        getEmployeeTypeEmployee(element.id);
      }
    });
    loadingListEmployee = false;
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
