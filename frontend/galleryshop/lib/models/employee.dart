import 'package:galleryshop/models/profile.dart';
import 'package:galleryshop/models/type_employee_model.dart';

class EmployeeDto {
  int id;
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthdate;
  String phoneNumber;
  String rg;
  double commissionRate;
  String password;
  List<TypeEmployeeDto> typeEmployees;

  EmployeeDto(
      {this.id,
        this.name,
        this.lastName,
        this.nickname,
        this.cpf,
        this.birthdate,
        this.phoneNumber,
        this.rg,
        this.commissionRate,
        this.password,
        this.typeEmployees});

  EmployeeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthdate = json['birthdate'];
    phoneNumber = json['phoneNumber'];
    rg = json['rg'];
    commissionRate = json['commissionRate'];
    password = json['password'];
    if (json['typeEmployees'] != null) {
      typeEmployees = new List<TypeEmployeeDto>();
      json['typeEmployees'].forEach((v) {
        typeEmployees.add(new TypeEmployeeDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['nickname'] = this.nickname;
    data['cpf'] = this.cpf;
    data['birthdate'] = this.birthdate;
    data['phoneNumber'] = this.phoneNumber;
    data['rg'] = this.rg;
    data['commissionRate'] = this.commissionRate;
    data['password'] = this.password;
    if (this.typeEmployees != null) {
      data['typeEmployees'] =
          this.typeEmployees.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'EmployeeModel{id: $id, name: $name, lastName: $lastName, nickname: $nickname, cpf: $cpf, birthdate: $birthdate, phoneNumber: $phoneNumber, rg: $rg, commissionRate: $commissionRate, password: $password, typeEmployees: $typeEmployees}';
  }
}

class EmployeeForm {
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthDate;
  String phoneNumber;
  String rg;
  int commissionRate;
  String password;
  List<ListTypeEmployeesForm> listTypeEmployees;
  List<ListProfiles> listProfiles;

  EmployeeForm(
      {this.name,
        this.lastName,
        this.nickname,
        this.cpf,
        this.birthDate,
        this.phoneNumber,
        this.rg,
        this.commissionRate,
        this.password,
        this.listTypeEmployees,
        this.listProfiles});

  EmployeeForm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthDate = json['birthDate'];
    phoneNumber = json['phoneNumber'];
    rg = json['rg'];
    commissionRate = json['commissionRate'];
    password = json['password'];
    if (json['listTypeEmployees'] != null) {
      listTypeEmployees = new List<ListTypeEmployeesForm>();
      json['listTypeEmployees'].forEach((v) {
        listTypeEmployees.add(new ListTypeEmployeesForm.fromJson(v));
      });
    }
    if (json['listProfiles'] != null) {
      listProfiles = new List<ListProfiles>();
      json['listProfiles'].forEach((v) {
        listProfiles.add(new ListProfiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['nickname'] = this.nickname;
    data['cpf'] = this.cpf;
    data['birthDate'] = this.birthDate;
    data['phoneNumber'] = this.phoneNumber;
    data['rg'] = this.rg;
    data['commissionRate'] = this.commissionRate;
    data['password'] = this.password;
    if (this.listTypeEmployees != null) {
      data['listTypeEmployees'] =
          this.listTypeEmployees.map((v) => v.toJson()).toList();
    }
    if (this.listProfiles != null) {
      data['listProfiles'] = this.listProfiles.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'EmployeeForm{name: $name, lastName: $lastName, nickname: $nickname, cpf: $cpf, birthDate: $birthDate, phoneNumber: $phoneNumber, rg: $rg, commissionRate: $commissionRate, password: $password, listTypeEmployees: $listTypeEmployees, listProfiles: $listProfiles}';
  }
}

