import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:mobx/mobx.dart';

part 'service_store.g.dart';

class ServiceStore = _ServiceStore with _$ServiceStore;

abstract class _ServiceStore with Store {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  @observable
  List<dynamic> dataServices = List();

  @observable
  String valueSelect;

  @observable
  bool priceFixed = false;

  @action
  void selectTypeService(String value) => valueSelect = value;

  @action
  void alterPriceFixed() => priceFixed =  !priceFixed;

  _ServiceStore() {
    autorun((_) {
      print('Valor selecionado >>>>>>> ${valueSelect}');
      print('Valor Fixo  >>>>>>> ${priceFixed}');
    });
  }

  void getServices() async {
    final response = await _webClient.findAll();
    dataServices = response;
  }

}