import 'package:galleryshop/http/webclients/webclient_sale_product.dart';
import 'package:galleryshop/models/product_sold.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'sale_product_store.g.dart';

class SaleProductStore = _SaleProductStore with _$SaleProductStore;

abstract class _SaleProductStore with Store {
  final int idClient;
  final SaleDto saleDto;

  SaleProductWebClient saleProductWebClient = SaleProductWebClient();

  _SaleProductStore({this.idClient, this.saleDto});

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> listSales = List();

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setListCalendar() async {
    try {
      listSales = await saleProductWebClient.findByClientId(idClient);
      if (listSales.isNotEmpty) {
        events = fromModelToEventAppointment(listSales);
      } else {
        errorList = true;
        listEmpty = true;
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

  //Excluir

  @observable
  bool sending = false;

  @observable
  bool excluded = false;

  @observable
  bool excludedUnauthorized = false;

  @observable
  bool excludedFail = false;

  @action
  Future<void> excludeSale() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response = await saleProductWebClient.exclude(saleDto.id);
//    int response = 0;
    if (response == 200) {
      excluded = true;
      await Future.delayed(Duration(seconds: 2));
    } else if (response == 401) {
      excludedUnauthorized = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      excludedFail = false;
      sending = false;
    }
  }

  @computed
  Function get buttonExcludePressed => excludeSale;
}
