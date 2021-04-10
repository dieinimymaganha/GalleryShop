import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:galleryshop/screens/accounts/client/detail_account_client.dart';
import 'package:galleryshop/screens/accounts/employee/detail_account_employee.dart';
import 'package:galleryshop/stores/sale_product_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

class SaleProduct extends StatefulWidget {
  final int idClient;
  final int idEmployee;
  final SaleDto saleDto;
  final bool consultMyAccount;

  SaleProduct(
      {this.idClient, this.saleDto, this.idEmployee, this.consultMyAccount});

  @override
  _SaleProductState createState() => _SaleProductState(
      idClient: idClient,
      saleDto: saleDto,
      idEmployee: idEmployee,
      consultMyAccount: consultMyAccount);
}

class _SaleProductState extends State<SaleProduct> {
  SaleProductStore saleProductStore = SaleProductStore();

  _SaleProductState(
      {int idClient, SaleDto saleDto, int idEmployee, bool consultMyAccount})
      : saleProductStore = SaleProductStore(
            idClient: idClient,
            saleDto: saleDto,
            idEmployee: idEmployee,
            consultMyAccount: consultMyAccount);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    saleProductStore.initEditSale();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => saleProductStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Venda registrada com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      saleProductStore.accountClientProcess
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountClient(
                    idClient: saleProductStore.idClient,
                  )))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountEmployee(
                    idEmployee: saleProductStore.idEmployee,
                  consultMyAccount: saleProductStore.consultMyAccount
                  )));
    });

    disposer = reaction((_) => saleProductStore.updateProduct, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          saleProductStore.change
              ? 'Quantidade atualizada com sucesso!'
              : 'Venda registrada com sucesso! Valores Atualizados',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      saleProductStore.accountClientProcess
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountClient(
                    idClient: saleProductStore.idClient,
                  )))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountEmployee(
                    idEmployee: saleProductStore.idEmployee,
                  consultMyAccount: saleProductStore.consultMyAccount
                  )));
    });

    disposer =
        reaction((_) => saleProductStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Error ao registrar venda! Tente novamente',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
    disposer = reaction((_) => saleProductStore.productDif, (productDif) async {
      if (productDif) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Não é possivel alterar o produto! somente quantidade',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.deepOrange,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
    disposer = reaction((_) => saleProductStore.updatedUnauthorized,
        (updatedUnauthorized) async {
      if (updatedUnauthorized) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Não é possivel alterar produtos do dia anterior!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(                                saleProductStore.change ?
                'Alterar venda produto' : 'Registrar venda produto'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: colorCard),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(
                      'Selecione o produto',
                    ),
                    value: saleProductStore.valueSelectProduct,
                    items: saleProductStore.listProducts.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.description),
                        value: item.id,
                      );
                    }).toList(),
                    onChanged: (value) {
                      saleProductStore.setValueProduct(value);
                      saleProductStore.setControllerValue();
                    },
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                CustomFormCoin(
                  controller: saleProductStore.controllerFieldValueProduct,
                  enabled: false,
                  mandatory: false,
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  label: 'Valor',
                  tip: 'Valor',
                  onChanged: saleProductStore.setValue,
                ),
                SizedBox(
                  height: space,
                ),
                CustomForm(
                  enabled: !saleProductStore.sending,
                  controller: saleProductStore.controllerFieldQtdProduct,
                  obscure: false,
                  mandatory: true,
                  tip: 'Quantidade',
                  label: 'Quantidade',
                  onChanged: saleProductStore.setQuantity,
                  textInputType:
                      TextInputType.numberWithOptions(decimal: false),
                ),
                SizedBox(height: space),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [
                        Color(0XFF212121),
                        Color(0XFF616161),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: SizedBox.expand(
                      child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                saleProductStore.change
                                    ? 'Alterar'
                                    : 'Registrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: saleProductStore.sending
                                      ? CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.blue),
                                        )
                                      : Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: saleProductStore.change
                              ? saleProductStore.buttonUpdateSalePressed
                              : saleProductStore.buttonRegisterSalePressed)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
