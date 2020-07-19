import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';

part 'type_employee_store.g.dart';

class TypeEmployeeStore = _TypeEmployeeStore with _$TypeEmployeeStore;

abstract class _TypeEmployeeStore with Store {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  final TypeEmployeeModel typeEmployeeModel;

  TypeEmployeeModel newTypeEmployee = TypeEmployeeModel();

  @observable
  TextEditingController _controllerDescription;

  _TypeEmployeeStore({this.typeEmployeeModel}) {
    autorun((_) {
      print('description -> ${description}');
      print('Controler -> ${_controllerDescription.text}');
      print('TypeEmployee -> ${typeEmployeeModel.toString()}');
      print('isValid -> ${isValid}');
      print('descriptionDif -> ${descriptionDif}');
      print('descriptionValid -> ${descriptionValid}');
      print('validSave -> ${validSave}');
    });
  }

//  _TypeEmployeeStore({this.typeEmployeeModel});

  @observable
  String description;

  @action
  void setDescription(String value) => description = value;

  TextEditingController setControllerDescription(
          TextEditingController controller) =>
      _controllerDescription = controller;

  void setNewTypeEmployee(String description) {
    newTypeEmployee.description = description;
  }

  void verifyTypeEmployee(
    TypeEmployeeModel typeEmployeeModel,
  ) {
    if (typeEmployeeModel.description != description) {
      setNewTypeEmployee(description);
    }
  }

  @computed
  bool get isValid => typeEmployeeModel != null;

  @computed
  bool get isValidNewTypeEmployee => newTypeEmployee != null;

  @computed
  bool get descriptionDif =>
      _controllerDescription.text != typeEmployeeModel.description;

  @computed
  bool get descriptionValid => description != null;

  @computed
  bool get validSave => descriptionValid && (isValid || isValidNewTypeEmployee);
}