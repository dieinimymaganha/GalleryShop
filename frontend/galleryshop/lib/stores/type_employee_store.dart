import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';

part 'type_employee_store.g.dart';

class TypeEmployeeStore = _TypeEmployeeStore with _$TypeEmployeeStore;

abstract class _TypeEmployeeStore with Store {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  final TypeEmployeeDto typeEmployeeModel;

  TypeEmployeeForm newTypeEmployee = TypeEmployeeForm();

  _TypeEmployeeStore({this.typeEmployeeModel}) {
    autorun((_) {});
  }

  @observable
  String description = '';

  @observable
  bool loading = false;

  @observable
  bool errorList = false;

  @observable
  bool listEmpty = false;

  @observable
  List<dynamic> listTypeEmployee = List();

  @action
  Future<void> setList() async {
    loading = true;
//    await Future.delayed(Duration(seconds: 2));
    try {
      listTypeEmployee = await _webClient.findAll();
      listTypeEmployee.sort((a, b) =>
          a.description.toString().compareTo(b.description.toString()));
      if (listTypeEmployee.isEmpty) {
        errorList = true;
        listEmpty = true;
        loading = false;
      }
    } on Exception catch (_) {
      errorList = true;
    }
    loading = false;
  }

  @action
  Future<void> reloadList() async {
    errorList = false;
    setList();
  }

  @observable
  TextEditingController controllerFieldDescription = TextEditingController();

  @action
  void setDescription(String value) => description = value;

  @action
  void setDescriptionInit() {
    if (typeEmployeeModel != null) {
      controllerFieldDescription.text = typeEmployeeModel.description;
      description = typeEmployeeModel.description;
      change = true;
    }
  }

  @observable
  bool sending = false;

  @observable
  bool excludedFail = false;

  @observable
  bool excluedBlock = false;

  @observable
  bool excluded = false;

  @observable
  bool change = false;

  @observable
  bool errorSending = false;

  @observable
  bool created = false;

  @action
  Future<void> excludeTypeEmployee() async {
    int response = await _webClient.exclude(typeEmployeeModel);
//    int response = 500;
    sending = true;
    await Future.delayed(Duration(seconds: 2));
    if (response == 200) {
      excluded = true;
    } else if (response == 500) {
      excluedBlock = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
      excluedBlock = false;
    } else {
      excludedFail = true;
      await Future.delayed(Duration(seconds: 2));
      excludedFail = false;
      sending = false;
    }
  }

  @computed
  bool get changeIsValid => typeEmployeeModel.description != description;

  @computed
  Function get buttomChangePressed => changeIsValid ? updateTypeEmployee : null;

  @computed
  Function get buttomSavePressed => saveIsValid ? saveTypeEmployee : null;

  @computed
  bool get saveIsValid => description.isNotEmpty;

  @action
  Future<void> updateTypeEmployee() async {
    TypeEmployeeForm typeEmployeeForm =
        TypeEmployeeForm(description: description);

    int response =
        await _webClient.update(typeEmployeeForm, typeEmployeeModel.id);

    sending = true;
    await Future.delayed(Duration(seconds: 2));
    if (response == 200) {
      created = true;
      await Future.delayed(Duration(seconds: 2));
    } else {
      errorSending = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
      errorSending = false;
    }
  }

  @action
  Future<void> saveTypeEmployee() async {
    TypeEmployeeForm typeEmployeeForm =
        TypeEmployeeForm(description: description);

    int response = await _webClient.save(typeEmployeeForm);

    sending = true;
    await Future.delayed(Duration(seconds: 2));
    if (response == 201) {
      created = true;
      await Future.delayed(Duration(seconds: 2));
    } else {
      errorSending = true;
      await Future.delayed(Duration(seconds: 2));
      sending = false;
      errorSending = false;
    }
  }

  @computed
  bool get excludeIsvalid => typeEmployeeModel != null;

  @computed
  Function get buttonExcludePressed =>
      excludeIsvalid ? excludeTypeEmployee : null;
}
