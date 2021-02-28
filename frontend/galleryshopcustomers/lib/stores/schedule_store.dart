import 'package:galleryshopcustomers/http/webclients/webclient_employee.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_schedule.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_type_employee.dart';
import 'package:galleryshopcustomers/models/client.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final ClientDto clientDto;
  int idEmployee;
  int idTypeEmployee;
  String source;
  final ScheduleDtoAppointment scheduleDtoAppointment;
  bool appointmentConsult;

  _ScheduleStore(
      {this.idEmployee,
      this.idTypeEmployee,
      this.source,
      this.clientDto,
      this.scheduleDtoAppointment,
      this.appointmentConsult}) {
    autorun((_) {});
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
  int valueSelectEmployee;

  @observable
  bool loadingListEmployee = true;

  @observable
  String valueSelectTypeEmployee;

  @observable
  ScheduleDtoAppointment infoSchedule;

  @observable
  bool loadingPageScheduleTime = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @action
  Future<void> createInfoSchedule() {
    infoSchedule = dataSchedule.last;
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEvent(
      List<ScheduleDtoAppointment> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      if (source == 'cliente') {
        if (event.available == true) {
          DateTime date = convertDateFromString(event.day);
          if (data[date] == null) data[date] = [];
          data[date].add(event);
        }
      } else {
        if (event.available == false) {
          DateTime date = convertDateFromString(event.day);
          if (data[date] == null) data[date] = [];
          data[date].add(event);
        }
      }
    });
    return data;
  }

  @action
  Future<void> loagingPageInit() async {
    loadingPageScheduleTime = true;
    await setListSchedule();
    await createInfoSchedule();
    if (infoSchedule != null) {
      loadingPageScheduleTime = false;
    }
  }

  @action
  Future<void> loadingInitPageAppointment() async {
    loadingPageScheduleTime = true;
    await setListSchedule();
    loadingPageScheduleTime = false;
  }

  @observable
  Map<DateTime, List<dynamic>> eventsNotConcluded = {};

  @observable
  Map<DateTime, List<dynamic>> eventsConcluded = {};

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

  @observable
  List<dynamic> selectedEventsNotConcluded = List();

  @observable
  List<dynamic> selectedEventsConcluded = List();

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
  Future<void> setListSchedule() async {
    try {
      if (appointmentConsult == true) {
        await getAppointmentClient();
        if (dataSchedule.isNotEmpty) {
          eventsNotConcluded =
              fromModelToEventAppointmentNotConcluded(dataSchedule);
          eventsConcluded = fromModelToEventAppointmentConcluded(dataSchedule);
        }
      }

      if (dataSchedule.isNotEmpty) {
        events = fromModelToEvent(dataSchedule);
        await createInfoSchedule();
      } else {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loadingPageScheduleTime = false;
    loagingPageInit();
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
  void selectTypeService(String value) => valueSelectTypeEmployee = value;

  @action
  void resetEmployee() => valueSelectEmployee = null;

  @action
  void selectEmployee(int value) => valueSelectEmployee = value;

  @action
  void setIdEmployee(int value) => idEmployee = value;

  @observable
  bool loadingValues = false;

  @action
  Future<void> setIdTypeEmployee(String value) async {
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

  @observable
  bool sendEmployee = false;

  @action
  Future<void> buttonPressed() async {
    sendEmployee = true;
  }

  @computed
  bool get isValueSelectEmployeeValid => valueSelectEmployee != null;

  @computed
  bool get isValueSelectTypeEmployeeValid => valueSelectTypeEmployee != null;

  @computed
  bool get isValidFieldFindSchedule =>
      (isValueSelectEmployeeValid && isValueSelectTypeEmployeeValid);

  @computed
  Function get sendPressed => isValidFieldFindSchedule ? buttonPressed : null;

  @action
  Future<int> getIdClient() async {
    var prefs = await SharedPreferences.getInstance();
    int client = (prefs.getInt("idClient") ?? "");
    return client;
  }

  @action
  Future<ScheduleAppointmentForm> createScheduleAppointmentForm() async {
    int clientId = await getIdClient();
    bool avaliable = true;
    ScheduleAppointmentForm form =
        ScheduleAppointmentForm(clientId: clientId, avaliable: avaliable);
    return form;
  }

  @action
  Future<void> getAppointmentClient() async {
    int clientId = await getIdClient();
    dataSchedule =
        await scheduleWebClient.getAppointmentClient(clientId.toString());
  }

  @observable
  bool scheduleOk = false;

  @observable
  bool scheduleFail = false;

  @observable
  bool scheduleDuplicate = false;

  @observable
  bool scheduleSend = false;

  @observable
  bool scheduleNotAvailable = false;

  @observable
  bool scheduleConflit = false;

  @action
  Future<void> send(int value) async {
    ScheduleAppointmentForm form = await createScheduleAppointmentForm();
    scheduleSend = true;
    int response = await scheduleWebClient.scheduleAppointment(form, value);
    await Future.delayed(Duration(seconds: 2));
//    int response = 1;
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

  @action
  Future<void> cancelAppointment(int id) async {
    scheduleSend = true;
    int response = await scheduleWebClient.cancelAppointment(id);
    await Future.delayed(Duration(seconds: 2));

//    int response = 2;
    if (response == 200) {
      scheduleOk = true;
    } else {
      scheduleFail = true;
      await Future.delayed(Duration(seconds: 2));
      scheduleFail = false;
      scheduleSend = false;
    }
    await Future.delayed(Duration(seconds: 2));
    scheduleOk = false;
  }

  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

  @observable
  bool showConcluded = true;
}
