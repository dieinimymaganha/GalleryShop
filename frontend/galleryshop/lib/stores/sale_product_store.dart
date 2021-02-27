import 'package:flutter/material.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/webclients/webclient_product.dart';
import 'package:galleryshop/http/webclients/webclient_sale_product.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'sale_product_store.g.dart';

class SaleProductStore = _SaleProductStore with _$SaleProductStore;

abstract class _SaleProductStore with Store {
  final int idClient;
  final int idEmployee;
  final bool consultMyAccount;
  final SaleDto saleDto;

  SaleProductWebClient saleProductWebClient = SaleProductWebClient();

  _SaleProductStore(
      {this.idClient, this.saleDto, this.idEmployee, this.consultMyAccount}) {
    autorun((_) {});
  }

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
      if (idClient != null) {
        listSales = await saleProductWebClient.findByClientId(idClient);
      } else if (idEmployee != null) {
        accountClientProcess = false;
        listSales = await saleProductWebClient.findByEmployeeId(idEmployee);
      }

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
    if (idEmployee != null) {
      accountClientProcess = false;
    }
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response = await saleProductWebClient.exclude(saleDto.id);
//    int response = 200;
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

  @observable
  bool updateProduct = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> registerSale() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;

    SaleForm saleForm = SaleForm();

    if (idClient != null) {
      saleForm = SaleForm(
          clientId: idClient,
          productId: valueSelectProduct,
          quantity: quantity);
    } else if (idEmployee != null) {
      saleForm = SaleForm(
          employeeId: idEmployee,
          productId: valueSelectProduct,
          quantity: quantity);
    }

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

  @observable
  bool accountClientProcess = true;

  @action
  Future<void> initEditSale() async {
    if (idEmployee != null) {
      accountClientProcess = false;
    }
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

    SaleForm saleForm = SaleForm();
    if (idClient != null) {
      saleForm = SaleForm(
          clientId: idClient,
          productId: valueSelectProduct,
          quantity: quantity);
    } else if (idEmployee != null) {
      saleForm = SaleForm(
          employeeId: idEmployee,
          productId: valueSelectProduct,
          quantity: quantity);
    }

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
