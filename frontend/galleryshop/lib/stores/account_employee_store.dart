import 'package:flutter/cupertino.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/webclients/webclient_account_client.dart';
import 'package:galleryshop/http/webclients/webclient_account_employee.dart';
import 'package:galleryshop/http/webclients/webclient_financial.dart';
import 'package:galleryshop/http/webclients/webclient_product.dart';
import 'package:galleryshop/http/webclients/webclient_sale_product.dart';
import 'package:galleryshop/models/AccountClient.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:galleryshop/models/account_employee.dart';
import 'package:galleryshop/models/close_account.dart';
import 'package:galleryshop/models/payment.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'account_employee_store.g.dart';

class AccountEmployeeStore = _AccountEmployeeStore with _$AccountEmployeeStore;

abstract class _AccountEmployeeStore with Store {
  final int idClient;
  final int idEmployee;
  final int idAccount;
  final SaleDto saleDto;
  final bool consultMyAccount;

  AccountClientWebClient accountClientWebClient = AccountClientWebClient();

  AccountEmployeeWebClient accountEmployeeWebClient =
      AccountEmployeeWebClient();

  FinancialWebClient financialWebClient = FinancialWebClient();

  _AccountEmployeeStore(
      {this.idClient,
      this.idAccount,
      this.saleDto,
      this.idEmployee,
      this.consultMyAccount}) {
    autorun((_) {
      print('productSoldDto >>>>>>>>>>> $saleDto');
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
  ObservableList<AccountEmployeeDto> listAccountClient =
      ObservableList<AccountEmployeeDto>().asObservable();

  @action
  void setListAccountClient() {
    if (listClient.isEmpty) {
      print('vazia');
    } else {
      listClient.forEach((element) {
        if (element != null) {
          AccountEmployeeDto employeeDto = element;
          print(employeeDto.toString());
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
      listClient = await accountEmployeeWebClient.findAll();
      listClient.sort((a, b) => a.employeeDtoBasic.name
          .toString()
          .compareTo(b.employeeDtoBasic.name.toString()));
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
  List<AccountEmployeeDto> get lisFiltered {
    if (filter.isEmpty) {
      return listAccountClient;
    } else {
      return listAccountClient.where((element) {
        if (element.employeeDtoBasic.cpf.contains(filter)) {
          return element.employeeDtoBasic.cpf.contains(filter);
        } else if (element.employeeDtoBasic.nickname
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          return element.employeeDtoBasic.nickname
              .toLowerCase()
              .contains(filter.toLowerCase());
        } else if (element.employeeDtoBasic.phoneNumber.contains(filter)) {
          return element.employeeDtoBasic.phoneNumber.contains(filter);
        }
        return element.employeeDtoBasic.name
            .toLowerCase()
            .contains(filter.toLowerCase());
      }).toList();
    }
  }

  @observable
  AccountClientDto accountClientDto;

  @observable
  AccountEmployeeDto accountEmployeeDto;

  @action
  Future<void> getEmployee() async {
    accountEmployeeDto = await accountEmployeeWebClient.findById(idEmployee);
  }

  @observable
  bool balanceNegative = false;

  @observable
  bool balanceZero = false;

  @action
  Future<void> iniPageEmployee() async {
    loading = true;
    notService = true;
    await getEmployee();
    if (accountEmployeeDto.balance < 0) {
      balanceNegative = true;
    } else if (accountEmployeeDto.balance == 0) {
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
    totalPayable = accountEmployeeDto.amount - accountEmployeeDto.amountPaid;
    if (totalPayable < 0.0) {
      totalPayable = 0.0;
    }
  }

  // Calendario
  @observable
  Map<DateTime, List<dynamic>> events = {};

  @observable
  List<dynamic> selectedEvents = List();

  @observable
  List<dynamic> selectedEventsSales = List();

  @observable
  CalendarController calendarController = CalendarController();

  @action
  Future<void> setCalendar() async {
    getEmployee();
    events = fromModelToEvent(accountEmployeeDto.serviceRecordDto);
    events2 = fromModelToEventProduct(accountEmployeeDto.saleDto);
    calculateTotalPayable();
  }

  @observable
  Map<DateTime, List<dynamic>> events2 = {};

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

  @action
  Map<DateTime, List<dynamic>> fromModelToEventProduct(List<SaleDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.dateSale);
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
  double amountPayableServices = 0.0;

  @observable
  double amountPayableSales = 0.0;

  @observable
  bool notService = true;

  @observable
  bool notSale = true;

  @action
  void calculateTotalAndSetSelectEvents(List<dynamic> events) {
    notService = false;
    selectedEvents = events;
    if (events.isNotEmpty) {
      amountDay = 0.0;
      discountDay = 0.0;
      amountPayableServices = 0.0;
      selectedEvents.forEach((element) {
        amountDay = amountDay + element.billedServiceDto.value;
        discountDay = discountDay + element.billedServiceDto.discount;
        amountPayableServices =
            amountPayableServices + element.billedServiceDto.valueFinal;
        calculateTotalDay();
      });
    } else {
      notService = true;
    }
  }

  @action
  void setSelectedEventsSales(DateTime date) {
    notSale = true;
    selectedEventsSales = [];
    events2.forEach((key, value) {
      final f = new DateFormat('yyyy-MM-dd');
      if (f.format(date) == f.format(key)) {
        selectedEventsSales = value;
        notSale = false;
      }
    });
    calculateTotalSales();
  }

  @action
  void calculateTotalSales() {
    amountPayableSales = 0.0;
    selectedEventsSales.forEach((element) {
      amountPayableSales =
          amountPayableSales + element.productSoldDto.valueTotal;
    });
    calculateTotalDay();
  }

  @observable
  bool valueToday = true;

  @observable
  double totalDay = 0.0;

  @action
  void calculateTotalDay() {
    valueToday = true;
    if (notService == false && notSale == false) {
      totalDay = amountPayableSales + amountPayableServices;
      valueToday = false;
    } else if (notService && notSale == false) {
      totalDay = amountPayableSales;
      valueToday = false;
    } else if (notSale && notService == false) {
      totalDay = amountPayableServices;
      valueToday = false;
    }
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    loading = false;
    iniPageEmployee();
  }

  //fechar conta

  @observable
  bool card = false;

  @observable
  bool money = true;

  @action
  void alterCard() {
    card = !card;
  }

  @action
  void alterMoney() {
    money = !money;
    flagCardPaymentDtoOK = false;
    valueSelectFlag = null;
    credit = false;
    debit = false;
  }

  @observable
  bool debit = false;

  @observable
  bool credit = false;

  @observable
  bool habilitPaid = false;

  @action
  void alterCredit() => credit = !credit;

  @action
  void alterDebit() => debit = !debit;

  @observable
  bool sending = false;

  @observable
  List<dynamic> listFlagCards = List();

  @action
  Future<void> getListFlagsCards() async {
    listFlagCards = await financialWebClient.findAll();
  }

  @observable
  FlagCardPaymentDto flagCardPaymentDto = FlagCardPaymentDto();

  @observable
  int valueSelectFlag;

  @observable
  bool flagCardPaymentDtoOK = false;

  @observable
  TextEditingController controllerFieldValuePaidOut = TextEditingController();

  @observable
  double paidOut = 0.0;

  @action
  void setPaidOut(String value) {
    if (value.isEmpty) {
      paidOut = 0.0;
    } else {
      value = value.replaceAll('.', '');
      value = value.replaceAll(',', '.');
      paidOut = double.parse(value);
    }
  }

  @action
  void setValueSelectFlag(int value) {
    flagCardPaymentDtoOK = true;
    valueSelectFlag = value;
    listFlagCards.forEach((element) {
      if (element.id == valueSelectFlag) {
        flagCardPaymentDto = element;
      }
    });
    setValuesCards();
  }

  @action
  void setValuesCards() {
    if (flagCardPaymentDto.credit && flagCardPaymentDto.debit) {
      credit = true;
      debit = false;
    } else if (flagCardPaymentDto.credit && !flagCardPaymentDto.debit) {
      credit = true;
      debit = false;
    } else if (!flagCardPaymentDto.credit && flagCardPaymentDto.debit) {
      debit = true;
      credit = false;
    }
  }

  @action
  Future<void> iniPageCloseAccount() async {
    loading = true;
    notService = true;
    await getEmployee();
    if (accountClientDto.balance < 0) {
      balanceNegative = true;
    } else if (accountClientDto.balance == 0) {
      balanceZero = true;
    }
    calculateTotalPayable();
    await getListFlagsCards();
    loading = false;
  }

  @observable
  bool closeAccountOK = false;

  @observable
  bool closeAccountError = false;

  @action
  Future<void> closeAccount() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    CloseAccountForm closeAccountClientForm = CloseAccountForm(
        idAccountClient: accountClientDto.id,
        value: paidOut,
        card: card,
        creditCard: credit,
        debitCard: debit,
        idFlagCardPayment: flagCardPaymentDto.id,
        useBalance: true);
//    int response = 200;
    int response =
        await accountClientWebClient.closeAccount(closeAccountClientForm);

    if (response == 200) {
      closeAccountOK = true;
    } else {
      closeAccountError = true;
    }
    await Future.delayed(Duration(seconds: 2));
    closeAccountOK = false;
    closeAccountError = false;
  }

  @computed
  bool get valueCreditIsValid => credit == true;

  @computed
  bool get valueDebitIsValid => debit == true;

  @computed
  bool get valuePaidIsValid => paidOut > 0.0;

  @computed
  bool get valueMoneyIsValid => money == true;

  @computed
  bool get fieldsCloseAccountIsValid =>
      valuePaidIsValid &&
      (valueCreditIsValid || valueDebitIsValid || valueMoneyIsValid);

  @computed
  Function get buttonCloseAccountPressed =>
      fieldsCloseAccountIsValid ? closeAccount : null;

  // Consultar pagamentos
  @observable
  List<dynamic> listPayments = List();

  @action
  Future<void> setListCalendarPayments() async {
    notService = true;
    try {
      listPayments =
          await accountEmployeeWebClient.findPaymentsAccountId(idAccount);
      if (listPayments.isNotEmpty) {
        events = fromModelToEventAppointment(listPayments);
      } else {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    await validServices();
  }

  @action
  Future<void> validServices() async {
    if (selectedEvents.isEmpty) {
      notService = true;
    } else
      notService = false;
  }

  @action
  Map<DateTime, List<dynamic>> fromModelToEventAppointment(
      List<PaymentDto> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = convertDateFromString(event.datePayment);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });

    return data;
  }

  @action
  Future<void> reloadPagePayments() async {
    errorList = false;
    setListCalendarPayments();
  }

  // Registrar venda

  ProductWebClient productWebClient = ProductWebClient();

  @observable
  List<dynamic> listProducts = List();

  @action
  Future<void> setDataInitialRegisterSale() async {
    listProducts = await productWebClient.findAll();
  }

  @observable
  int valueSelectProduct;

  @observable
  TextEditingController controllerFieldValueProduct = TextEditingController();

  @observable
  TextEditingController controllerFieldQtdProduct = TextEditingController();

  @observable
  int quantity;

  @action
  void setQuantity(String value) {
    if (value.isEmpty) {
      quantity = 0;
    } else {
      quantity = int.parse(value);
    }
  }

  @observable
  double valueProduct = 0.0;

  @action
  void setValue(String price) {
    if (price.isEmpty) {
      valueProduct = null;
    } else {
      price = price.replaceAll('.', '');
      price = price.replaceAll(',', '.');
      valueProduct = double.parse(price);
    }
  }

  @action
  void setControllerValue() {
    controllerFieldValueProduct.text = '';
    listProducts.forEach((element) {
      if (element.id == valueSelectProduct) {
        if (element.value == null) {
          controllerFieldValueProduct.text = '';
          valueProduct = null;
        } else {
          controllerFieldValueProduct.text = convertMonetary(element.value);
          valueProduct = element.value;
        }
      }
    });
  }

  @observable
  bool created = false;

  @action
  Future<void> setValueProduct(int value) async {
    valueSelectProduct = value;
  }

  SaleProductWebClient saleProductWebClient = SaleProductWebClient();

  @observable
  bool updateProduct = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> registerSale() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    SaleForm saleForm = SaleForm(
        clientId: idClient, productId: valueSelectProduct, quantity: quantity);

    int response;
    try {
      response = await saleProductWebClient.save(saleForm);
    } on Exception catch (_) {
      response = 0;
    }

    if (response == 201) {
      created = true;
    } else if (response == 200) {
      updateProduct = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;
    updateProduct = false;
  }

  @computed
  bool get quantityIsValid => quantity != 0 && quantity != null;

  @computed
  bool get fieldsSaleIsValid => quantityIsValid && productIsValid;

  @computed
  bool get productIsValid => valueSelectProduct != null && valueProduct != null;

  @computed
  Function get buttonRegisterSalePressed =>
      fieldsSaleIsValid ? registerSale : null;

//Atualizar venda

  @observable
  bool change = false;

  @action
  Future<void> initEditSale() async {
    await setDataInitialRegisterSale();
    if (saleDto != null) {
      change = true;
      setDescriptionProductSold();
    }
  }

  @action
  void setDescriptionProductSold() {
    listProducts.forEach((element) {
      if (element.description == saleDto.productSoldDto.description) {
        valueSelectProduct = element.id;
        controllerFieldValueProduct.text =
            convertMonetary(saleDto.productSoldDto.value);
        controllerFieldQtdProduct.text =
            saleDto.productSoldDto.quantity.toString();
      }
    });
  }

  @observable
  bool productDif = false;

  @observable
  bool updatedUnauthorized = false;

  @action
  Future<void> updateSale() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    SaleForm saleForm = SaleForm(
        clientId: idClient, productId: valueSelectProduct, quantity: quantity);
    print(saleForm.toJson());

    int response = await saleProductWebClient.update(saleForm, saleDto.id);
//    int response = 200;

    if (response == 200) {
      updateProduct = true;
    } else if (response == 423) {
      productDif = true;
    } else if (response == 401) {
      updatedUnauthorized = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;
    updateProduct = false;
    productDif = false;
    updatedUnauthorized = false;
  }

  @computed
  Function get buttonUpdateSalePressed => fieldsSaleIsValid ? updateSale : null;
}
