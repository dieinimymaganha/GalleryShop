import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_opening_hours.dart';
import 'package:galleryshop/models/opening_hours.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'opening_hours_store.g.dart';

class DayOfTheWeek {
  String description;
  String day;

  DayOfTheWeek({this.description, this.day});
}

class OpeningHoursStore = _OpeningHoursStore with _$OpeningHoursStore;

abstract class _OpeningHoursStore with Store {
  final OpeninigHoursDto openinigHoursDto;

  _OpeningHoursStore({this.openinigHoursDto}) {
    autorun((_) {
      print('>>>>> ${openinigHoursDto.toJson()}');
    });
  }

  OpeningHoursWebClient openingHoursWebClient = OpeningHoursWebClient();

  @observable
  List<DayOfTheWeek> listDayOfWeek = [
    new DayOfTheWeek(description: 'SEGUNDA', day: 'SEGUNDA'),
    new DayOfTheWeek(description: 'TERCA', day: 'TERÇA'),
    new DayOfTheWeek(description: 'QUARTA', day: 'QUARTA'),
    new DayOfTheWeek(description: 'QUINTA', day: 'QUINTA'),
    new DayOfTheWeek(description: 'SEXTA', day: 'SEXTA'),
    new DayOfTheWeek(description: 'SABADO', day: 'SÁBADO'),
    new DayOfTheWeek(description: 'DOMINGO', day: 'DOMINGO'),
  ];

  @action
  void setDataInitial() {
    if (openinigHoursDto != null) {
      change = true;
      controlerMorningStart.text = openinigHoursDto.earlyMorningJourney;
      setMoringStart(controlerMorningStart);
      controlerMorningEnd.text = openinigHoursDto.endMorningJourney;
      setMoringEnd(controlerMorningEnd);
      controlerAfternoonStart.text = openinigHoursDto.earlyAfternoonJourney;
      setAfternoonStart(controlerAfternoonStart);
      controlerAfternoonEnd.text = openinigHoursDto.endJourneyLate;
      setAfternoonEnd(controlerAfternoonEnd);
      valueSelect = openinigHoursDto.dayOfTheWeek;
    }
  }

  @observable
  bool change = false;

  @observable
  int idEmployee = 0;

  @observable
  String valueSelect;

  @observable
  DateTime morningStart;

  @computed
  bool get fieldsValid {
    if (valueSelect != null) {
      if (morningStart == null &&
          morningEnd == null &&
          afternoonStart == null &&
          afternoonEnd == null) {
        return false;
      } else if (morningStart != null &&
          morningEnd != null &&
          afternoonStart != null &&
          afternoonEnd != null) {
        if (morningStart.isAfter(morningEnd) ||
            morningStart.isAfter(afternoonStart) ||
            morningStart.isAfter(afternoonEnd) ||
            morningEnd.isAfter(afternoonStart) ||
            morningEnd.isAfter(afternoonEnd) ||
            afternoonStart.isAfter(afternoonEnd) ||
            morningStart.isAtSameMomentAs(morningEnd) ||
            morningStart.isAtSameMomentAs(afternoonStart) ||
            morningStart.isAtSameMomentAs(afternoonEnd)) {
          return false;
        } else {
          return true;
        }
      } else if (morningStart != null &&
          morningEnd != null &&
          afternoonStart != null &&
          afternoonEnd == null) {
        return false;
      } else if (morningStart != null &&
          morningEnd != null &&
          afternoonStart == null &&
          afternoonEnd != null) {
        return false;
      } else if (morningStart == null &&
          morningEnd != null &&
          afternoonStart != null &&
          afternoonEnd != null) {
        return false;
      } else if (morningStart != null &&
          morningEnd == null &&
          afternoonStart != null &&
          afternoonEnd != null) {
        return false;
      } else if ((morningStart != null && morningEnd == null) ||
          (morningStart == null && morningEnd != null)) {
        return false;
      } else if ((afternoonStart != null && afternoonEnd == null) ||
          (afternoonStart == null && afternoonEnd != null)) {
        return false;
      } else if (morningStart != null && morningEnd != null) {
        if (morningStart.isAfter(morningEnd) ||
            morningStart.isAtSameMomentAs(morningEnd)) {
          return false;
        } else {
          return true;
        }
      } else if (afternoonStart != null && afternoonEnd != null) {
        if (afternoonStart.isAfter(afternoonEnd) ||
            afternoonStart.isAtSameMomentAs(afternoonEnd)) {
          return false;
        }
        return true;
      }
    } else {
      return false;
    }
  }

  @action
  void setMoringStart(TextEditingController controller) {
    try {
      DateTime dateConvert = DateFormat("HH:mm").parse(controller.text);
      morningStart = dateConvert;
    } on Exception catch (_) {
      morningStart = null;
    }
  }

  @action
  void setMoringEnd(TextEditingController controller) {
    try {
      DateTime dateConvert = DateFormat("HH:mm").parse(controller.text);
      morningEnd = dateConvert;
    } on Exception catch (_) {
      morningEnd = null;
    }
  }

  @action
  void setAfternoonStart(TextEditingController controller) {
    try {
      DateTime dateConvert = DateFormat("HH:mm").parse(controller.text);
      afternoonStart = dateConvert;
    } on Exception catch (_) {
      afternoonStart = null;
    }
  }

  @action
  void setAfternoonEnd(TextEditingController controller) {
    try {
      DateTime dateConvert = DateFormat("HH:mm").parse(controller.text);
      afternoonEnd = dateConvert;
    } on Exception catch (_) {
      afternoonEnd = null;
    }
  }

  TextEditingController controlerMorningStart = TextEditingController();

  @observable
  DateTime morningEnd;

  TextEditingController controlerMorningEnd = TextEditingController();

  @observable
  DateTime afternoonStart;

  TextEditingController controlerAfternoonStart = TextEditingController();

  @observable
  DateTime afternoonEnd;

  TextEditingController controlerAfternoonEnd = TextEditingController();

  @action
  void selectDayOfTheWeek(String value) => valueSelect = value;

  @observable
  List<dynamic> listOpeningHours = List();

  @observable
  List<dynamic> listOpeningHoursRecover = List();

  @action
  Future<void> setList() async {
    listOpeningHoursRecover =
        await openingHoursWebClient.findListOpeningHoursId(idEmployee);
    listOpeningHours = await createNewList(listOpeningHoursRecover);
  }

  @action
  Future<List<dynamic>> createNewList(List<dynamic> listData) async {
    for (OpeninigHoursDto openinigHoursDto in listData) {
      switch (openinigHoursDto.dayOfTheWeek) {
        case 'DOMINGO':
          openinigHoursDto.dayOfTheWeekInt = 7;
          break;
        case 'SABADO':
          openinigHoursDto.dayOfTheWeekInt = 6;
          break;
        case 'SEXTA':
          openinigHoursDto.dayOfTheWeekInt = 5;
          break;
        case 'QUINTA':
          openinigHoursDto.dayOfTheWeekInt = 4;
          break;
        case 'QUARTA':
          openinigHoursDto.dayOfTheWeekInt = 3;
          break;
        case 'TERCA':
          openinigHoursDto.dayOfTheWeekInt = 2;
          break;
        case 'SEGUNDA':
          openinigHoursDto.dayOfTheWeekInt = 1;
          break;
        default:
          openinigHoursDto.dayOfTheWeekInt = 0;
      }
      listOpeningHours.add(openinigHoursDto);
    }
    listOpeningHours.sort((a, b) =>
        a.dayOfTheWeekInt.toString().compareTo(b.dayOfTheWeekInt.toString()));
    return listOpeningHours;
  }

  @action
  Future<void> setIdEmployee() async {
    idEmployee = await getIdEmployee();
    await setList();
  }

  @action
  Future<int> getIdEmployee() async {
    var prefs = await SharedPreferences.getInstance();
    int id = (prefs.getInt("idEmployee"));
    return id;
  }

  @action
  Future<void> saveHours() async {
    int id = await getIdEmployee();
    OpeningHoursForm openingHoursForm = new OpeningHoursForm(
        dayOfTheWeek: valueSelect,
        employeeId: id,
        earlyMorningJourney: controlerMorningStart.text.isEmpty
            ? null
            : controlerMorningStart.text,
        endMorningJourney:
            controlerMorningEnd.text.isEmpty ? null : controlerMorningEnd.text,
        earlyAfternoonJourney: controlerAfternoonStart.text.isEmpty
            ? null
            : controlerAfternoonStart.text,
        endJourneyLate: controlerAfternoonEnd.text.isEmpty
            ? null
            : controlerAfternoonEnd.text);
    print(openingHoursForm.toJson());
    await openingHoursWebClient.save(openingHoursForm);
  }

  @computed
  Function get butttonSavePressed => fieldsValid ? saveHours : null;
}
