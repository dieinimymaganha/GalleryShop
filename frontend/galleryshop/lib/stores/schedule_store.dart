import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/http/webclients/webclient_schedule.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:intl/intl.dart';
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
  bool appointmentConsult;

  _ScheduleStore(
      {this.scheduleDto,
      this.idEmployee,
      this.idTypeEmployee,
      this.source,
      this.clientDto,
      this.scheduleDtoAppointment,
      this.appointmentConsult}) {
    autorun((_) {
      print('enableScheduleDuplicate >>>>> $enableScheduleDuplicate');
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
  Map<DateTime, List<dynamic>> eventsNotConcluded = {};

  @observable
  Map<DateTime, List<dynamic>> eventsConcluded = {};

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  List<dynamic> selectedEventsNotConcluded = List();

  @observable
  List<dynamic> selectedEventsConcluded = List();

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

  @observable
  bool loadingOptionsScheduleTypeEmployee = false;

  @observable
  String valueSelectTypeEmployee;

  @observable
  TextEditingController controllerDayInit = TextEditingController();

  @observable
  String dayInit;

  @observable
  TextEditingController controllerAttendanceTime = TextEditingController();

  @observable
  DateTime attendanceTime;

  @observable
  int quantityDays;

  @observable
  bool sending = false;

  @observable
  TextEditingController controllerQuantityDays = TextEditingController();

  @action
  void setControllerQuantityDays(int value) =>
      controllerQuantityDays.text = value.toString();

  @action
  void setQuantityDays(String value) => quantityDays = int.parse(value);

  @action
  void setAttendanceTime(TextEditingController controller) {
    try {
      DateTime dateConvert = DateFormat("HH:mm").parse(controller.text);
      attendanceTime = dateConvert;
    } on Exception catch (_) {
      attendanceTime = null;
    }
  }

  @action
  void setDayIniController(String value) => controllerDayInit.text = value;

  @action
  void setDayIni(String value) => dayInit = value;

  @action
  void selectTypeService(String value) => valueSelectTypeEmployee = value;

  @computed
  bool get fieldsValid {
    if (valueSelectTypeEmployee != null &&
        dayInit != null &&
        controllerAttendanceTime.text != null &&
        quantityDays != null) {
      return true;
    }
    return false;
  }

  @computed
  Function get buttonEnableSchedulePressed => fieldsValid ? saveSchedule : null;

  @observable
  bool enableScheduleSending = false;

  @observable
  bool enableScheduleOk = false;

  @observable
  bool enableScheduleError = false;

  @observable
  bool enableScheduleDuplicate = false;

  @action
  Future<void> saveSchedule() async {
    enableScheduleSending = true;
    await Future.delayed(Duration(seconds: 2));
    ScheduleEnableScheduleForm form = await createFormEnableSchedule();
    await sendEnableSchedule(form);
  }

  @action
  Future<void> sendEnableSchedule(ScheduleEnableScheduleForm form) async {
    try {
      int response = await scheduleWebClient.scheduleEnableSchedue(form);
//      int response = 2;
      if (response == 200) {
        enableScheduleOk = true;
      } else if (response == 404) {
        enableScheduleDuplicate = true;
      } else {
        enableScheduleError = true;
      }
    } on Exception catch (_) {
      enableScheduleError = true;
    }
    await Future.delayed(Duration(seconds: 2));
    enableScheduleSending = false;
    enableScheduleOk = false;
    enableScheduleError = false;
    enableScheduleDuplicate = false;
  }

  Future<ScheduleEnableScheduleForm> createFormEnableSchedule() async {
    ScheduleEnableScheduleForm form = ScheduleEnableScheduleForm(
        employeeId: idEmployee,
        day: dayInit,
        attendanceTime: controllerAttendanceTime.text,
        typeEmployeeId: idTypeEmployee,
        quantityDays: quantityDays,
        available: false);
    return form;
  }

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
    await loadingInitOptionsSchedule();
  }

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
  Map<DateTime, List<dynamic>> fromModelToEventAppointmentConcluded(
      List<ScheduleDtoAppointment> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      if (event.concluded) {
        DateTime date = convertDateFromString(event.day);
        if (data[date] == null) data[date] = [];
        data[date].add(event);
      }
    });
    return data;
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEventAppointmentNotConcluded(
      List<ScheduleDtoAppointment> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      if (!event.concluded) {
        DateTime date = convertDateFromString(event.day);
        if (data[date] == null) data[date] = [];
        data[date].add(event);
      }
    });
    return data;
  }

  @observable
  bool showConcluded = true;

  @action
  void setSelectEventsConcluded(DateTime date) {
    selectedEventsConcluded = [];
    eventsConcluded.forEach((key, value) {
      final f = new DateFormat('yyyy-MM-dd');
      if (f.format(date) == f.format(key)) {
        selectedEventsConcluded = value;
      }
    });
  }

  @action
  Future<void> setListMySchedule() async {
    await getIdEmployee();
    try {
      if (appointmentConsult == true) {
        dataSchedule = await scheduleWebClient.scheduleFindMyAppointment(
            idEmployee, idTypeEmployee);
        if (dataSchedule.isNotEmpty) {
          eventsConcluded = fromModelToEventAppointmentConcluded(dataSchedule);
          eventsNotConcluded =
              fromModelToEventAppointmentNotConcluded(dataSchedule);
        } else {
          errorList = true;
          listEmpty = true;
        }
      } else {
        dataSchedule = await scheduleWebClient.findScheduleIdEmployee(
            idEmployee.toString(), idTypeEmployee.toString());
        if (dataSchedule.isNotEmpty) {
          events = fromModelToEvent(dataSchedule);
        } else {
          errorList = true;
          listEmpty = true;
        }
      }
    } on Exception catch (_) {
      errorList = true;
    }
  }

  @action
  Future<void> loadingInitOptionsSchedule() async {
    loadingPageScheduleTime = true;
    await setOptionsMySchedule();
    loadingPageScheduleTime = false;
  }

  @action
  void setIdTypeEmployee(String value) {
    employeeDto.typeEmployees.forEach((element) {
      if (value == element.description) {
        idTypeEmployee = element.id;
      }
    });
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
  Future<void> loagingPageInit() async {
    loadingPageScheduleTime = true;
    await createInfoSchedule();
    await setListMySchedule();
    if (typeEmployeeDto != null) {
      loadingPageScheduleTime = false;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loadingPageScheduleTime = false;
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

  // a partir daqui
  @observable
  bool sendEmployee = false;

  @observable
  bool loadingListEmployee = true;

  @observable
  bool loadingValues = false;

  @computed
  bool get isValueSelectEmployeeValid => valueSelectEmployee != null;

  @observable
  int valueSelectEmployee;

  @observable
  List<dynamic> listEmployee = List();

  @action
  void resetEmployee() => valueSelectEmployee = null;

  @observable
  List<dynamic> dataServices = List();

  void getServices() async {
    final response = await typeEmployeeWebClient.findAll();
    dataServices = response;
  }

  @action
  void selectEmployee(int value) => valueSelectEmployee = value;

  @action
  void setIdEmployee(int value) => idEmployee = value;

  @computed
  Function get sendPressed => isValidFieldFindSchedule ? buttonPressed : null;

  @computed
  bool get isValidFieldFindSchedule =>
      (isValueSelectEmployeeValid && isValueSelectTypeEmployeeValid);

  @computed
  bool get isValueSelectTypeEmployeeValid => valueSelectTypeEmployee != null;

  @action
  Future<void> buttonPressed() async {
    sendEmployee = true;
  }

  @action
  Future<void> setIdTypeEmployeeConsult(String value) async {
    loadingListEmployee = false;
    loadingValues = true;
    await Future.delayed(Duration(seconds: 2));
    dataServices.forEach((element) {
      if (value == element.description) {
        getEmployeeTypeEmployee(element.id);
        idTypeEmployee = element.id;
      }
    });
    loadingValues = false;
  }

  @action
  Future<void> getEmployeeTypeEmployee(int id) async {
    final response = await employeeWebClient.findEmployeeTypeEmployee(id);
    listEmployee = response;
  }
}

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  return todayDate;
}
