import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_schedule.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final ScheduleDto scheduleDto;
  int idEmployee;
  int idTypeEmployee;
  String source;

  _ScheduleStore(
      {this.scheduleDto, this.idEmployee, this.idTypeEmployee, this.source}) {
    autorun((_) {
      print(employeeDto);
    });
  }

  @observable
  EmployeeDto employeeDto;

  ScheduleWebClient scheduleWebClient = ScheduleWebClient();

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
  List<dynamic> optionsMySchedule = List();

  @observable
  bool loadingPageScheduleTime = false;

  @observable
  ScheduleDto infoSchedule;

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
    dataSchedule = await scheduleWebClient.findScheduleIdEmployee(
        idEmployee.toString(), idTypeEmployee.toString());
    if (dataSchedule.isNotEmpty) {
      events = fromModelToEvent(dataSchedule);
    }
  }

  @action
  Future<void> loagingPageInit() async {
    loadingPageScheduleTime = true;
    await setListMySchedule();
    if (infoSchedule != null) {
      loadingPageScheduleTime = false;
    }
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
