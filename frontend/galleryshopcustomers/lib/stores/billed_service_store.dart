import 'package:galleryshopcustomers/http/webclients/webClient_service_record.dart';
import 'package:galleryshopcustomers/models/AccountClient.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import 'account_client_store.dart';

part 'billed_service_store.g.dart';

class BilledServiceStore = _BilledServiceStore with _$BilledServiceStore;

abstract class _BilledServiceStore with Store {
  final int idClient;

  _BilledServiceStore({this.idClient});

  ServiceRecordWebClient serviceRecordWebClient = ServiceRecordWebClient();

  @observable
  List<dynamic> listServices = List();

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  CalendarController calendarController = CalendarController();


  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @action
  Future<void> setListCalendar() async {
    try {
      if (idClient != null) {
        listServices = await serviceRecordWebClient.findByClientId(idClient);

        if (listServices.isNotEmpty) {
          events = fromModelToEventAppointment(listServices);
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
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<ServiceRecordDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateService);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @action
  Future<void> reloadPageExcludeService() async {
    errorList = false;
    setListCalendar();
  }
}
