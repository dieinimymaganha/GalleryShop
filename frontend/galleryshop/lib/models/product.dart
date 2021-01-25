class ProductForm {
  String description;
  double value;

  ProductForm({this.description, this.value});

  ProductForm.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['value'] = this.value;
    return data;
  }
}


class ProductDto {
  int id;
  String description;
  double value;

  ProductDto({this.id, this.description, this.value});

  ProductDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['value'] = this.value;
    return data;
  }
}
