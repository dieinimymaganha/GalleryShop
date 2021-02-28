import 'product_sold.dart';

class SaleForm {
  int productId;
  int clientId;
  int quantity;
  int employeeId;

  SaleForm({this.productId, this.clientId, this.quantity, this.employeeId});

  SaleForm.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    clientId = json['clientId'];
    quantity = json['quantity'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['clientId'] = this.clientId;
    data['quantity'] = this.quantity;
    data['employeeId'] = this.employeeId;
    return data;
  }
}


class SaleDto {
  int id;
  String dateSale;
  ProductSoldDto productSoldDto;

  SaleDto({this.id, this.dateSale, this.productSoldDto});

  SaleDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateSale = json['dateSale'];
    productSoldDto = json['productSoldDto'] != null
        ? new ProductSoldDto.fromJson(json['productSoldDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateSale'] = this.dateSale;
    if (this.productSoldDto != null) {
      data['productSoldDto'] = this.productSoldDto.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'SaleDto{id: $id, dateSale: $dateSale, productSoldDto: $productSoldDto}';
  }
}
