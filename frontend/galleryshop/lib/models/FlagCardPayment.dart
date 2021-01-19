class FlagCardPaymentDto {
  int id;
  String description;
  bool debit;
  double taxDebit;
  bool credit;
  double taxCredit;

  FlagCardPaymentDto(
      {this.id,
        this.description,
        this.debit,
        this.taxDebit,
        this.credit,
        this.taxCredit});

  FlagCardPaymentDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    debit = json['debit'];
    taxDebit = json['taxDebit'];
    credit = json['credit'];
    taxCredit = json['taxCredit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['debit'] = this.debit;
    data['taxDebit'] = this.taxDebit;
    data['credit'] = this.credit;
    data['taxCredit'] = this.taxCredit;
    return data;
  }
}

class FlagCardPaymentForm {
  String description;
  bool debit;
  double taxDebit;
  bool credit;
  double taxCredit;

  FlagCardPaymentForm(
      {this.description,
        this.debit,
        this.taxDebit,
        this.credit,
        this.taxCredit});

  FlagCardPaymentForm.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    debit = json['debit'];
    taxDebit = json['taxDebit'];
    credit = json['credit'];
    taxCredit = json['taxCredit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['debit'] = this.debit;
    data['taxDebit'] = this.taxDebit;
    data['credit'] = this.credit;
    data['taxCredit'] = this.taxCredit;
    return data;
  }
}