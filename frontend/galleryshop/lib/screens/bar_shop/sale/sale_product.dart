import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/DetailAccountClient.dart';
import 'package:galleryshop/stores/account_client_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

class SaleProduct extends StatefulWidget {
  final int idClient;

  SaleProduct({this.idClient});

  @override
  _SaleProductState createState() => _SaleProductState(idClient: idClient);
}

class _SaleProductState extends State<SaleProduct> {
  AccountClientStore accountClientStore = AccountClientStore();

  _SaleProductState({int idClient})
      : accountClientStore = AccountClientStore(idClient: idClient);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    accountClientStore.setDataInitialRegisterSale();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => accountClientStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Venda registrada com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DetailAccountClient(
                idClient: accountClientStore.idClient,
              )));
    });

    disposer =
        reaction((_) => accountClientStore.updateProduct, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Venda registrada com sucesso! Valores Atualizados',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DetailAccountClient(
                idClient: accountClientStore.idClient,
              )));
    });

    disposer =
        reaction((_) => accountClientStore.errorSending, (errorSending) async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Registrar venda produto'),
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
                    value: accountClientStore.valueSelectProduct,
                    items: accountClientStore.listProducts.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.description),
                        value: item.id,
                      );
                    }).toList(),
                    onChanged: (value) {
                      accountClientStore.setValueProduct(value);
                      accountClientStore.setControllerValue();
                    },
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                CustomFormCoin(
                  controller: accountClientStore.controllerFieldValueProduct,
                  enabled: false,
                  mandatory: false,
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  label: 'Valor',
                  tip: 'Valor',
                  onChanged: accountClientStore.setValue,
                ),
                SizedBox(
                  height: space,
                ),
                CustomForm(
                  enabled: !accountClientStore.sending,
                  controller: accountClientStore.controllerFieldQtdProduct,
                  obscure: false,
                  mandatory: true,
                  tip: 'Quantidade',
                  label: 'Quantidade',
                  onChanged: accountClientStore.setQuantity,
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
                                'Registrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: accountClientStore.sending
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
                          onPressed:
                              accountClientStore.buttonRegisterSalePressed)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
