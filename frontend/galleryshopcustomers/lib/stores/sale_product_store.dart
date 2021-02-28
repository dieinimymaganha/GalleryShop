import 'package:galleryshopcustomers/http/webclients/webclient_sale_product.dart';
import 'package:galleryshopcustomers/models/sale.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import 'account_client_store.dart';

part 'sale_product_store.g.dart';

class SaleProductStore = _SaleProductStore with _$SaleProductStore;

abstract class _SaleProductStore with Store {
  final int idClient;

  _SaleProductStore({this.idClient});

  SaleProductWebClient saleProductWebClient = SaleProductWebClient();

  @observable
  List<dynamic> listSales = List();

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();


  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setListCalendar() async {
    try {
      if (idClient != null) {
        listSales = await saleProductWebClient.findByClientId(idClient);

        if (listSales.isNotEmpty) {
          events = fromModelToEventAppointment(listSales);
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
      List<SaleDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateSale);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }


  @action
  Future<void> reloadPageSales() async {
    errorList = false;
    setListCalendar();
  }

}
