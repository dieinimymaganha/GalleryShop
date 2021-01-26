class ProductSoldDto {
  int id;
  String description;
  double value;
  int quantity;
  double valueTotal;

  ProductSoldDto(
      {this.id, this.description, this.value, this.quantity, this.valueTotal});

  ProductSoldDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    value = json['value'];
    quantity = json['quantity'];
    valueTotal = json['valueTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['value'] = this.value;
    data['quantity'] = this.quantity;
    data['valueTotal'] = this.valueTotal;
    return data;
  }

  @override
  String toString() {
    return 'ProductSoldDto{id: $id, description: $description, value: $value, quantity: $quantity, valueTotal: $valueTotal}';
  }
}
