import 'package:flutter/cupertino.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:mobx/mobx.dart';

part 'type_employee_store.g.dart';

class TypeEmployeeStore = _TypeEmployeeStore with _$TypeEmployeeStore;

abstract class _TypeEmployeeStore with Store {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  final TypeEmployeeModel typeEmployeeModel;

  TypeEmployeeForm newTypeEmployee = TypeEmployeeForm();

  @observable
  TextEditingController _controllerDescription;

//  _TypeEmployeeStore({this.typeEmployeeModel}) {
//    autorun((_) {
//      print('TypeEmployee -> ${typeEmployeeModel.toString()}');
//      print('newTypeEmployee -> ${newTypeEmployee.toString()}');
//      print('description -> ${description}');
//    });
//  }

  _TypeEmployeeStore({this.typeEmployeeModel});

  @observable
  String description;

  @observable
  bool excluding = false;

  @observable
  bool notAuthorized = false;

  @observable
  bool excluded = false;

  @action
  void setDescription(String value) => description = value;

  TextEditingController setControllerDescription(
          TextEditingController controller) =>
      _controllerDescription = controller;

  @action
  void updateDescriptionTypeEmployee(String description) {
    typeEmployeeModel.description = description;
  }

  @action
  void updateDescriptionNewTypeEmployee(String description) {
    newTypeEmployee.description = description;
  }

  @action
  Future<TypeEmployeeModel> saveOrUpdateTypeEmployee() async {
    if (newTypeEmployee.description == null && typeEmployeeModel == null) {
      updateDescriptionNewTypeEmployee(description);
      TypeEmployeeModel typeEmployeeModelCreated = await saveTypeEmployee();
      print('>>>AQUI<<<');
      return typeEmployeeModelCreated;
    } else if (typeEmployeeModel.description != description &&
        typeEmployeeModel.description.isNotEmpty) {
      updateDescriptionTypeEmployee(description);
      TypeEmployeeModel typeEmployeeModelUpdate = await updateTypeEmploee();
      return typeEmployeeModelUpdate;
      print('>>>FOIAQUI<<<');
    } else {
      return null;
    }
  }

  @action
  Future<void> excludeTypeEmployee() async {
    excluding = true;
    await sendExcludeTypeEmployee(typeEmployeeModel);
    excluding = false;
  }

  @action
  Future<int> sendExcludeTypeEmployee(
      TypeEmployeeModel typeEmployeeExclude) async {
    int status = await _webClient.exclude(typeEmployeeExclude);

    if (status == 500) {
      notAuthorized = true;
      await Future.delayed(Duration(seconds: 5));
      notAuthorized = false;
    }
    return status;
  }

//  @action
//  Future<void> saveOrUpdateTypeEmployee() async {
//    if (typeEmployeeModel.description != null) {
//      verifyTypeEmployee(typeEmployeeModel);
//      print('Salvando');
//    } else {
//      print('Toaqui');
//    }
//  }

  @action
  Future<TypeEmployeeModel> saveTypeEmployee() async {
    TypeEmployeeModel typeEmployeeModelCreated =
        await _webClient.save(newTypeEmployee);
    return typeEmployeeModelCreated;
  }

  @action
  Future<TypeEmployeeModel> updateTypeEmploee() async {
    TypeEmployeeModel typeEmployeeModelUpdate =
        await _webClient.update(typeEmployeeModel);
    return typeEmployeeModelUpdate;
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

  @computed
  Function get excludePressed => (isValid) ? excludeTypeEmployee : null;

  @computed
  Function get savePressed =>
      descriptionValid && (isValid || isValidNewTypeEmployee)
          ? saveOrUpdateTypeEmployee
          : null;
}
