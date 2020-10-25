

import 'package:galleryshopcustomers/models/service.dart';

class TypeEmployeeDto {
  int id;
  String description;
  bool select = false;
  List<ServiceDto> services;

  TypeEmployeeDto({this.id, this.description, this.services, this.select});

  TypeEmployeeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['services'] != null) {
      services = new List<ServiceDto>();
      json['services'].forEach((v) {
        services.add(new ServiceDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'TypeEmployeeModel{id: $id, description: $description, select: $select, services: $services}';
  }
}

class TypeEmployeeForm {
  String description;

  TypeEmployeeForm({this.description});

  TypeEmployeeForm.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return '{description: $description}';
  }
}


class ListTypeEmployeesForm {
  String description;

  ListTypeEmployeesForm({this.description});

  ListTypeEmployeesForm.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return 'ListTypeEmployees{description: $description}';
  }
}