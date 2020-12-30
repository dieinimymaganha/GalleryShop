import 'package:flutter/rendering.dart';
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
  final ScheduleDtoAppointment scheduleDtoAppointment;

  _ScheduleStore(
      {this.scheduleDto,
      this.idEmployee,
      this.idTypeEmployee,
      this.source,
      this.clientDto,
      this.scheduleDtoAppointment}) {
    autorun((_) {
      print('Employee >>>>> ${employeeDto}');
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

  @observable
  bool errorLoadingOptionsMySchedule = false;

  @action
  Future<void> setOptionsMySchedule() async {
    await getIdEmployee();
    try {
      errorLoadingOptionsMySchedule = false;
      employeeDto = await employeeWebClient.findById(idEmployee.toString());
    } on Exception catch (_) {
      errorLoadingOptionsMySchedule = true;
    }
  }

  Future<void> getIdEmployee() async {
    var prefs = await SharedPreferences.getInstance();
    idEmployee = (prefs.getInt("idEmployee") ?? "");
  }

  @action
  Future<void> realoadListOptionsMySchedule() async {
    await setOptionsMySchedule();
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
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<ScheduleDtoAppointment> events) {
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
    await getIdEmployee();
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
  Future<void> loadingInitPageAppointment() async {
    loadingPageScheduleTime = true;
    await setListMyScheduleAppointment();
    loadingPageScheduleTime = false;
  }

  @action
  Future<void> setListMyScheduleAppointment() async {
    await getIdEmployee();
    try {
      dataSchedule =
          await scheduleWebClient.scheduleFindMyAppointment(idEmployee);
      if (dataSchedule.isNotEmpty) {
        events = fromModelToEventAppointment(dataSchedule);
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

  @action
  Future<ScheduleAppointmentForm> createScheduleAppointmentForm() async {
    ScheduleAppointmentForm form =
        ScheduleAppointmentForm(avaliable: true, clientId: clientDto.id);
    return form;
  }

  @observable
  bool scheduleSend = false;

  @observable
  bool scheduleOk = false;

  @observable
  bool scheduleDuplicate = false;

  @observable
  bool scheduleNotAvailable = false;

  @observable
  bool scheduleConflit = false;

  @observable
  bool scheduleFail = false;

  @action
  Future<void> sendConfirmScheduleEmployee(int idSchedule) async {
    ScheduleAppointmentForm form = await createScheduleAppointmentForm();
    scheduleSend = true;
    int response =
        await scheduleWebClient.scheduleAppointment(form, idSchedule);
    await Future.delayed(Duration(seconds: 2));
//    int response = 200;
    if (response == 200) {
      scheduleOk = true;
    } else if (response == 409) {
      scheduleDuplicate = true;
      await Future.delayed(Duration(seconds: 2));
      scheduleDuplicate = false;
      scheduleSend = false;
    } else if (response == 423) {
      scheduleNotAvailable = true;
      await Future.delayed(Duration(seconds: 2));
      scheduleNotAvailable = false;
      scheduleSend = false;
    } else if (response == 406) {
      scheduleConflit = true;
      await Future.delayed(Duration(seconds: 2));
      scheduleConflit = false;
      scheduleSend = false;
    } else {
      scheduleFail = true;
      await Future.delayed(Duration(seconds: 2));
      scheduleFail = false;
      scheduleSend = false;
    }

    await Future.delayed(Duration(seconds: 2));
    scheduleOk = false;
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
