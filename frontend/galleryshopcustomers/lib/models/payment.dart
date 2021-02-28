class PaymentDto {
  int id;
  String datePayment;
  double value;
  TypePaymentDto typePaymentDto;

  PaymentDto({this.id, this.datePayment, this.value, this.typePaymentDto});

  PaymentDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datePayment = json['datePayment'];
    value = json['value'];
    typePaymentDto = json['typePaymentDto'] != null
        ? new TypePaymentDto.fromJson(json['typePaymentDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['datePayment'] = this.datePayment;
    data['value'] = this.value;
    if (this.typePaymentDto != null) {
      data['typePaymentDto'] = this.typePaymentDto.toJson();
    }
    return data;
  }
}

class TypePaymentDto {
  int id;
  String description;
  bool card;
  String flag;
  double tax;

  TypePaymentDto({this.id, this.description, this.card, this.flag, this.tax});

  TypePaymentDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    card = json['card'];
    flag = json['flag'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['card'] = this.card;
    data['flag'] = this.flag;
    data['tax'] = this.tax;
    return data;
  }
}
