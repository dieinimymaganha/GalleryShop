import 'package:galleryshop/models/sale.dart';

import 'AccountClient.dart';

class AccountEmployeeDto {
  int id;
  double amount;
  double amountPaid;
  double balance;
  EmployeeDtoBasic employeeDtoBasic;
  List<ServiceRecordDto> serviceRecordDto;
  List<SaleDto> saleDto;

  AccountEmployeeDto(
      {this.id,
      this.amount,
      this.amountPaid,
      this.balance,
      this.employeeDtoBasic,
      this.serviceRecordDto,
      this.saleDto});

  AccountEmployeeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    amountPaid = json['amountPaid'];
    balance = json['balance'];
    employeeDtoBasic = json['employeeDtoBasic'] != null
        ? new EmployeeDtoBasic.fromJson(json['employeeDtoBasic'])
        : null;
    if (json['serviceRecordDto'] != null) {
      serviceRecordDto = new List<ServiceRecordDto>();
      json['serviceRecordDto'].forEach((v) {
        serviceRecordDto.add(new ServiceRecordDto.fromJson(v));
      });
    }
    if (json['saleDto'] != null) {
      saleDto = new List<SaleDto>();
      json['saleDto'].forEach((v) {
        saleDto.add(new SaleDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['amountPaid'] = this.amountPaid;
    data['balance'] = this.balance;
    if (this.employeeDtoBasic != null) {
      data['employeeDtoBasic'] = this.employeeDtoBasic.toJson();
    }
    if (this.serviceRecordDto != null) {
      data['serviceRecordDto'] =
          this.serviceRecordDto.map((v) => v.toJson()).toList();
    }
    if (this.saleDto != null) {
      data['saleDto'] = this.saleDto.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
