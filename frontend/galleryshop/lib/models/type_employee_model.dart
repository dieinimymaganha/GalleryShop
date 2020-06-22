class TypeEmployeeModel {
  int id;
  String description;
  List<Services> services;

  TypeEmployeeModel({this.id, this.description, this.services});

  TypeEmployeeModel.fromJson(Map<String, dynamic> json) {
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
}