import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_schedule.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final ScheduleDto scheduleDto;
  final ClientDto clientDto;
  int idEmployee;
  int idTypeEmployee;
  String source;

  _ScheduleStore(
      {this.scheduleDto, this.idEmployee, this.idTypeEmployee, this.source, this.clientDto}) {
    autorun((_) {
      print('>>>>> ${typeEmployeeDto.toString()}');
      print('id >>>>> ${idTypeEmployee}');
    });
  }

  @observable
  EmployeeDto employeeDto;

  ScheduleWebClient scheduleWebClient = ScheduleWebClient();

  EmployeeWebClient employeeWebClient = EmployeeWebClient();

  TypeEmployeeWebClient typeEmployeeWebClient = TypeEmployeeWebClient();

  @observable
  CalendarController calendarController = CalendarController();

  @observable
  List<dynamic> dataSchedule = List();

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  List<dynamic> optionsMySchedule = List();

  @observable
  bool loadingPageScheduleTime = false;

  @observable
  TypeEmployeeDto typeEmployeeDto;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  bool errorLoadingTypeEmployee = false;

  @action
  Future<void> setOptionsMySchedule() async {
    var prefs = await SharedPreferences.getInstance();
    int idEmployee = (prefs.getInt("idEmployee") ?? "");
    employeeDto = await employeeWebClient.findById(idEmployee.toString());
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ScheduleDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.day);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @action
  Future<void> setListMySchedule() async {
    try {
      dataSchedule = await scheduleWebClient.findScheduleIdEmployee(
          idEmployee.toString(), idTypeEmployee.toString());
      if (dataSchedule.isNotEmpty) {
        events = fromModelToEvent(dataSchedule);
      } else {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
  }

  @action
  Future<void> loagingPageInit() async {
    loadingPageScheduleTime = true;
    await setListMySchedule();
    if (typeEmployeeDto != null) {
      loadingPageScheduleTime = false;
    }
  }

  @action
  Future<void> createInfoSchedule() async {
    try {
      typeEmployeeDto = await typeEmployeeWebClient
          .findByIdTypeEmployee(idTypeEmployee.toString());
      errorLoadingTypeEmployee = false;
    } on Exception catch (_) {
      errorLoadingTypeEmployee = true;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loadingPageScheduleTime = false;
    createInfoSchedule();
    loagingPageInit();
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
