class CloseAccountForm {
  int idAccountClient;
  int idAccountEmployee;
  double value;
  int idFlagCardPayment;
  bool card;
  bool creditCard;
  bool debitCard;
  bool useBalance;

  CloseAccountForm(
      {this.idAccountClient,
        this.idAccountEmployee,
        this.value,
        this.idFlagCardPayment,
        this.card,
        this.creditCard,
        this.debitCard,
        this.useBalance});

  CloseAccountForm.fromJson(Map<String, dynamic> json) {
    idAccountClient = json['idAccountClient'];
    idAccountEmployee = json['idAccountEmployee'];
    value = json['value'];
    idFlagCardPayment = json['idFlagCardPayment'];
    card = json['card'];
    creditCard = json['creditCard'];
    debitCard = json['debitCard'];
    useBalance = json['useBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAccountClient'] = this.idAccountClient;
    data['idAccountEmployee'] = this.idAccountEmployee;
    data['value'] = this.value;
    data['idFlagCardPayment'] = this.idFlagCardPayment;
    data['card'] = this.card;
    data['creditCard'] = this.creditCard;
    data['debitCard'] = this.debitCard;
    data['useBalance'] = this.useBalance;
    return data;
  }
}
