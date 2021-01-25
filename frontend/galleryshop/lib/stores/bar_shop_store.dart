import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:galleryshop/http/webclients/webclient_product.dart';
import 'package:galleryshop/models/product.dart';
import 'package:mobx/mobx.dart';

part 'bar_shop_store.g.dart';

class BarShopStore = _BarShopStore with _$BarShopStore;

abstract class _BarShopStore with Store {
  final ProductDto productDto;

  _BarShopStore({this.productDto}) {
    autorun((_) {
      print('$description');
      print('$value');
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
  bool get descriptionIsValid => description != null;

  @computed
  bool get valueIsValid => value != 0.0 && value != null;

  @computed
  bool get fieldsIsValid => descriptionIsValid && valueIsValid;

  @computed
  Function get buttonSavePressed => fieldsIsValid ? save : null;
}
