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
      print('>>>>> ${idEmployee}');
//      print('duplicate >>>>> ${duplicate}');
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

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  bool loading = false;

  @observable
  bool excluded = false;

  @observable
  bool sending = false;

  @observable
  bool excludedFail = false;

  @computed
  Function get buttoExcludePressed => excludeOpeningHours;

  @action
  Future<void> excludeOpeningHours() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response = await openingHoursWebClient.exclude(openinigHoursDto);
//    int response = 1;
    if (response == 200) {
      excluded = true;
      await Future.delayed(Duration(seconds: 2));
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      excludedFail = false;
      sending = false;
    }
  }

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

  @observable
  bool created = false;

  @observable
  bool duplicate = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> reloadList() async {
    errorList = false;
    setList();
  }

  @action
  Future<void> setList() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));

    try {
      listOpeningHoursRecover =
          await openingHoursWebClient.findListOpeningHoursId(idEmployee);
      listOpeningHours = await createNewList(listOpeningHoursRecover);
    } on Exception catch (_) {
      errorList = true;
    }
    loading = false;
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
    if (listOpeningHours.isEmpty) {
      errorList = true;
      listEmpty = true;
      loading = false;
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
    if(id == null){
      id = 0;
    }
    return id;
  }

  @action
  Future<void> sendNewHours() async {
    OpeningHoursForm openingHoursForm = await createNewOpeningHours();
    sending = true;
    print(openingHoursForm.toJson());
    int response = await openingHoursWebClient.save(openingHoursForm);
    await Future.delayed(Duration(seconds: 2));
//    int response = 409;
    sending = false;
    if (response == 200) {
      created = true;
      await Future.delayed(Duration(seconds: 2));
    } else if (response == 409) {
      duplicate = true;
      await Future.delayed(Duration(seconds: 2));
    } else {
      errorSending = true;
      await Future.delayed(Duration(seconds: 2));
    }
    created = false;
    sending = false;
    errorSending = false;
    duplicate = false;
  }

  @action
  Future<void> updateOpening() async {
    OpeningHoursForm openingHoursForm = await createNewOpeningHours();
    sending = true;
    int response = await openingHoursWebClient.update(
        openingHoursForm, openinigHoursDto.id);
    await Future.delayed(Duration(seconds: 2));
//    int response = 409;
    sending = false;
    if (response == 200) {
      created = true;
    }
    errorSending = true;

    await Future.delayed(Duration(seconds: 2));
    created = false;
    sending = false;
    errorSending = false;
  }

  Future<OpeningHoursForm> createNewOpeningHours() async {
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
    return openingHoursForm;
  }

  @computed
  Function get butttonSavePressed => fieldsValid ? sendNewHours : null;

  @computed
  Function get buttonChangePressed => updateOpening;
}
