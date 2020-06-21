class EmployeeModel {
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
  List<TypeEmployees> typeEmployees;

  EmployeeModel(
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

  EmployeeModel.fromJson(Map<String, dynamic> json) {
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
      typeEmployees = new List<TypeEmployees>();
      json['typeEmployees'].forEach((v) {
        typeEmployees.add(new TypeEmployees.fromJson(v));
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
}

class TypeEmployees {
  int id;
  String description;
  List<Services> services;

  TypeEmployees({this.id, this.description, this.services});

  TypeEmployees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
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
}

class Services {
  int id;
  String description;
  double value;
  bool fixedPrice;
  String typeEmployee;

  Services(
      {this.id,
        this.description,
        this.value,
        this.fixedPrice,
        this.typeEmployee});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    value = json['value'];
    fixedPrice = json['fixedPrice'];
    typeEmployee = json['typeEmployee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['value'] = this.value;
    data['fixedPrice'] = this.fixedPrice;
    data['typeEmployee'] = this.typeEmployee;
    return data;
  }

  @override
  String toString() {
    return 'Services{typeEmployee: $typeEmployee}';
  }
}