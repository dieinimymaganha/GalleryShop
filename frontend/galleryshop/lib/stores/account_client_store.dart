import 'package:galleryshop/http/webclients/webclient_account_client.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'account_client_store.g.dart';

class AccountClientStore = _AccountClientStore with _$AccountClientStore;

abstract class _AccountClientStore with Store {
  final int idClient;

  AccountClientWebClient accountClientWebClient = AccountClientWebClient();

  _AccountClientStore({this.idClient}) {
    autorun((_) {
      print('totalPayable >>>>>>>>>>> $totalPayable');
    });
  }

  @observable
  List<dynamic> listClient = List();

  @observable
  String filter = '';

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableList<AccountClientDto> listAccountClient =
      ObservableList<AccountClientDto>().asObservable();

  @action
  void setListAccountClient() {
    if (listClient.isEmpty) {
      print('vazia');
    } else {
      listClient.forEach((element) {
        if (element != null) {
          AccountClientDto cli = element;
          print(cli.toString());
          listAccountClient.add(element);
        }
      });
    }
  }

  @action
  Future<void> setList() async {
    loading = true;
//    await Future.delayed(Duration(seconds: 2));
    try {
      listClient = await accountClientWebClient.findAll();
      listClient.sort((a, b) =>
          a.clientDto.name.toString().compareTo(b.clientDto.name.toString()));
      if (listClient.isEmpty) {
        errorList = true;
        listEmpty = true;
        loading = false;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    setListAccountClient();
    loading = false;
  }

  @computed
  List<AccountClientDto> get lisFiltered {
    if (filter.isEmpty) {
      return listAccountClient;
    } else {
      return listAccountClient.where((element) {
        if (element.clientDto.cpf.contains(filter)) {
          return element.clientDto.cpf.contains(filter);
        } else if (element.clientDto.nickname
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          return element.clientDto.nickname
              .toLowerCase()
              .contains(filter.toLowerCase());
        } else if (element.clientDto.phoneNumber.contains(filter)) {
          return element.clientDto.phoneNumber.contains(filter);
        }
        return element.clientDto.name
            .toLowerCase()
            .contains(filter.toLowerCase());
      }).toList();
    }
  }

  @observable
  AccountClientDto accountClientDto;

  @action
  Future<void> getClient() async {
    accountClientDto = await accountClientWebClient.findById(idClient);
  }

  @observable
  bool balanceNegative = false;

  @observable
  bool balanceZero = false;

  @action
  Future<void> iniPageClient() async {
    loading = true;
    notService = true;
    await getClient();
    if (accountClientDto.balance < 0) {
      balanceNegative = true;
    } else if (accountClientDto.balance == 0) {
      balanceZero = true;
    }
    await setCalendar();
    calculateTotalPayable();
    loading = false;
  }

  //Calcula o valor a pagar

  @observable
  double totalPayable;

  @action
  Future<void> calculateTotalPayable() async {
    if (accountClientDto.balance == 0) {
      totalPayable = accountClientDto.amount - accountClientDto.amountPaid;
    } else if (accountClientDto.balance > 0) {
      totalPayable = (accountClientDto.amount - accountClientDto.amountPaid) -
          accountClientDto.balance;
    } else {
      totalPayable = (accountClientDto.amount - accountClientDto.amountPaid) +
          accountClientDto.balance.abs();
    }
  }

  // Calendario

  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setCalendar() async {
    events = fromModelToEvent(accountClientDto.serviceRecordDto);
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEvent(List<ServiceRecordDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateService);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @observable
  double amountDay = 0.0;

  @observable
  double discountDay = 0.0;

  @observable
  double amountPayable = 0.0;

  @observable
  bool notService = false;

  @action
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    notService = false;
    selectedEvents = events;
    if (events.isNotEmpty) {
      amountDay = 0.0;
      discountDay = 0.0;
      amountPayable = 0.0;
      selectedEvents.forEach((element) {
        amountDay = amountDay + element.billedServiceDto.value;
        discountDay = discountDay + element.billedServiceDto.discount;
        amountPayable = amountPayable + element.billedServiceDto.valueFinal;
      });
    } else {
      notService = true;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loading = false;
    iniPageClient();
  }

  //fechar conta
@observable
bool sending = false;




}
