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
      print('morningStart >>> $morningStart');
      print('morningEnd >>> $morningEnd');
      print('afternoonStart >>> $afternoonStart');
      print('afternoonEnd >>> $afternoonEnd');
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

  @observable
  int idEmployee = 0;

  @observable
  String valueSelect;

  @observable
  DateTime morningStart;

  @computed
  bool get fieldsValid => morningStart != null && morningEnd != null;

  @action
  void setMoringStart(TextEditingController controller) {
    DateTime dateConvert = DateFormat("hh:mm").parse(controller.text);
    morningStart = dateConvert;
    fieldsValid;
  }

  @action
  void setMoringEnd(TextEditingController controller) {
    DateTime dateConvert = DateFormat("hh:mm").parse(controller.text);
    morningEnd = dateConvert;
    fieldsValid;
  }

  @action
  void setAfternoonStart(TextEditingController controller) {
    DateTime dateConvert = DateFormat("hh:mm").parse(controller.text);
    afternoonStart = dateConvert;
    fieldsValid;
  }

  @action
  void setAfternoonEnd(TextEditingController controller) {
    DateTime dateConvert = DateFormat("hh:mm").parse(controller.text);
    afternoonEnd = dateConvert;
    fieldsValid;
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

  @action
  Future<void> setList() async {
    listOpeningHours =
        await openingHoursWebClient.findListOpeningHoursId(idEmployee);
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
}
