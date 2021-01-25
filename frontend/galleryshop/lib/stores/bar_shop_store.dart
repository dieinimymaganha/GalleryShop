import 'package:flutter/cupertino.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/http/webclients/webclient_product.dart';
import 'package:galleryshop/models/product.dart';
import 'package:mobx/mobx.dart';

part 'bar_shop_store.g.dart';

class BarShopStore = _BarShopStore with _$BarShopStore;

abstract class _BarShopStore with Store {
  final ProductDto productDto;

  _BarShopStore({this.productDto}) {
    autorun((_) {
      print('EXCLUDE >>>>>>>>> $excluded');
    });
  }

  ProductWebClient productWebClient = ProductWebClient();

  @observable
  TextEditingController controllerFieldDescription = TextEditingController();

  @observable
  TextEditingController controllerFieldValue = TextEditingController();

  @observable
  String description;

  @observable
  double value = 0.0;

  @action
  void setValue(String price) {
    if (price.isEmpty) {
      value = null;
    } else {
      price = price.replaceAll('.', '');
      price = price.replaceAll(',', '.');
      value = double.parse(price);
    }
  }

  @action
  void setDescription(String value) => description = value;

  @observable
  bool sending = false;

  @observable
  bool created = false;

  @observable
  bool duplicate = false;

  @observable
  bool errorSending = false;

  @action
  Future<void> save() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    ProductForm productForm =
        ProductForm(description: description, value: value);

    int response;
    try {
      response = await productWebClient.save(productForm);
    } on Exception catch (_) {
      response = 0;
    }
    if (response == 201) {
      created = true;
    } else if (response == 409) {
      duplicate = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    created = false;
    duplicate = false;
    errorSending = false;
  }

  @computed
  bool get descriptionIsValid => description != null && description != '';

  @computed
  bool get valueIsValid => value != 0.0 && value != null;

  @computed
  bool get fieldsIsValid => descriptionIsValid && valueIsValid;

  @computed
  Function get buttonSavePressed => fieldsIsValid ? save : null;

  @observable
  List<dynamic> listProducts = List();

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @action
  Future<void> setListProducts() async {
    loading = true;
    try {
      listProducts = await productWebClient.findAll();
      if (listProducts.isEmpty) {
        errorList = true;
        listEmpty = true;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    loading = false;
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    setListProducts();
  }

  @observable
  bool excluded = false;

  @observable
  bool excludedFail = false;

  @action
  Future<void> excludeProduct() async {
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    int response;

    try {
      response = await productWebClient.exclude(productDto.id);
    } on Exception catch (_) {
      response = 0;
    }

    if (response == 200) {
      excluded = true;
    } else {
      excludedFail = true;
    }
    await Future.delayed(Duration(seconds: 2));
    excluded = false;
    excludedFail = false;
    sending = false;
  }

  @computed
  Function get excludedPressed => excludeProduct;

  @observable
  bool change = false;

  @action
  Future<void> setDataInitial() async {
    if (productDto != null) {
      change = true;
      description = controllerFieldDescription.text = productDto.description;
      controllerFieldValue.text = convertMonetary(productDto.value);
      value = productDto.value;
    }
  }

  @action
  Future<void> updateProduct() async {
    ProductForm form = ProductForm(description: description, value: value);
    int response;
    try {
      response = await productWebClient.update(form, productDto.id);
    } on Exception catch (_) {
      response = 0;
    }

    sending = true;
    await Future.delayed(Duration(seconds: 2));
    sending = false;
    if (response == 200) {
      created = true;
    } else {
      errorSending = true;
    }
    await Future.delayed(Duration(seconds: 2));
    errorSending = false;
    created = false;
  }

  @computed
  bool get changeDescriptionIsValid =>
      description != productDto.description &&
      description != null &&
      description != '' &&
      valueIsValid;

  @computed
  bool get changeValueIsValid =>
      value != 0.0 &&
      value != null &&
      value != productDto.value &&
      descriptionIsValid;

  @computed
  bool get changeIsValid => changeDescriptionIsValid || changeValueIsValid;

  @computed
  Function get buttonChangePressed => changeIsValid ? updateProduct : null;
}
