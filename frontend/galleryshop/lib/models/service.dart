class ServiceModel {
  int id;
  String description;
  double value;
  bool fixedPrice;
  String typeEmployee;

  ServiceModel({
      this.id,
        this.description,
        this.value,
        this.fixedPrice,
        this.typeEmployee});

  ServiceModel.fromJson(Map<String, dynamic> json) {
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
    return 'ServiceModel{id: $id, description: $description, value: $value, fixedPrice: $fixedPrice, typeEmployee: $typeEmployee}';
  }
}

class ServiceForm {
  String description;
  double value;
  bool fixedPrice;
  String descriptonTypeEmployee;

  ServiceForm(
      {this.description,
        this.value,
        this.fixedPrice,
        this.descriptonTypeEmployee});

  ServiceForm.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    value = json['value'];
    fixedPrice = json['fixedPrice'];
    descriptonTypeEmployee = json['descriptonTypeEmployee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['value'] = this.value;
    data['fixedPrice'] = this.fixedPrice;
    data['descriptonTypeEmployee'] = this.descriptonTypeEmployee;
    return data;
  }

  @override
  String toString() {
    return 'ServiceForm{description: $description, value: $value, fixedPrice: $fixedPrice, descriptonTypeEmployee: $descriptonTypeEmployee}';
  }
}