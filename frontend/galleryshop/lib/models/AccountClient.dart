import 'client.dart';

class AccountClientDto {
  int id;
  double amount;
  double amountPaid;
  double balance;
  ClientDto clientDto;
  List<ServiceRecordDto> serviceRecordDto;

  AccountClientDto(
      {this.id,
      this.amount,
      this.amountPaid,
      this.balance,
      this.clientDto,
      this.serviceRecordDto});

  AccountClientDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    amountPaid = json['amountPaid'];
    balance = json['balance'];
    clientDto = json['clientDto'] != null
        ? new ClientDto.fromJson(json['clientDto'])
        : null;
    if (json['serviceRecordDto'] != null) {
      serviceRecordDto = new List<ServiceRecordDto>();
      json['serviceRecordDto'].forEach((v) {
        serviceRecordDto.add(new ServiceRecordDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['amountPaid'] = this.amountPaid;
    data['balance'] = this.balance;
    if (this.clientDto != null) {
      data['clientDto'] = this.clientDto.toJson();
    }
    if (this.serviceRecordDto != null) {
      data['serviceRecordDto'] =
          this.serviceRecordDto.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AccountClientDto{id: $id, amount: $amount, amountPaid: $amountPaid, balance: $balance, clientDto: $clientDto, serviceRecordDto: $serviceRecordDto}';
  }
}

class ServiceRecordDto {
  int id;
  String dateService;
  EmployeeDtoBasic employeeDtoBasic;
  BilledServiceDto billedServiceDto;

  ServiceRecordDto(
      {this.id,
      this.dateService,
      this.employeeDtoBasic,
      this.billedServiceDto});

  ServiceRecordDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateService = json['dateService'];
    employeeDtoBasic = json['employeeDtoBasic'] != null
        ? new EmployeeDtoBasic.fromJson(json['employeeDtoBasic'])
        : null;
    billedServiceDto = json['billedServiceDto'] != null
        ? new BilledServiceDto.fromJson(json['billedServiceDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateService'] = this.dateService;
    if (this.employeeDtoBasic != null) {
      data['employeeDtoBasic'] = this.employeeDtoBasic.toJson();
    }
    if (this.billedServiceDto != null) {
      data['billedServiceDto'] = this.billedServiceDto.toJson();
    }
    return data;
  }
}

class EmployeeDtoBasic {
  int id;
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthdate;
  String phoneNumber;
  String rg;
  double commissionRate;

  EmployeeDtoBasic(
      {this.id,
      this.name,
      this.lastName,
      this.nickname,
      this.cpf,
      this.birthdate,
      this.phoneNumber,
      this.rg,
      this.commissionRate});

  EmployeeDtoBasic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthdate = json['birthdate'];
    phoneNumber = json['phoneNumber'];
    rg = json['rg'];
    commissionRate = json['commissionRate'];
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
    return data;
  }
}

class BilledServiceDto {
  int id;
  String description;
  String typeEmployee;
  double value;
  double discount;
  double valueFinal;

  BilledServiceDto(
      {this.id,
      this.description,
      this.typeEmployee,
      this.value,
      this.discount,
      this.valueFinal});

  BilledServiceDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    typeEmployee = json['typeEmployee'];
    value = json['value'];
    discount = json['discount'];
    valueFinal = json['valueFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['typeEmployee'] = this.typeEmployee;
    data['value'] = this.value;
    data['discount'] = this.discount;
    data['valueFinal'] = this.valueFinal;
    return data;
  }
}


class ServiceRecordForm {
  double discount;
  int serviceId;
  int employeeId;
  int clientId;
  double value;

  ServiceRecordForm(
      {this.discount,
        this.serviceId,
        this.employeeId,
        this.clientId,
        this.value});

  ServiceRecordForm.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    serviceId = json['serviceId'];
    employeeId = json['employeeId'];
    clientId = json['clientId'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['serviceId'] = this.serviceId;
    data['employeeId'] = this.employeeId;
    data['clientId'] = this.clientId;
    data['value'] = this.value;
    return data;
  }
}


class CloseAccountClientForm {
  int idAccountClient;
  double value;
  int idFlagCardPayment;
  bool card;
  bool creditCard;
  bool debitCard;
  bool useBalance;

  CloseAccountClientForm(
      {this.idAccountClient,
        this.value,
        this.idFlagCardPayment,
        this.card,
        this.creditCard,
        this.debitCard,
        this.useBalance});

  CloseAccountClientForm.fromJson(Map<String, dynamic> json) {
    idAccountClient = json['idAccountClient'];
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
    data['value'] = this.value;
    data['idFlagCardPayment'] = this.idFlagCardPayment;
    data['card'] = this.card;
    data['creditCard'] = this.creditCard;
    data['debitCard'] = this.debitCard;
    data['useBalance'] = this.useBalance;
    return data;
  }
}



