import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/account_client_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class CloseAccountScreen extends StatefulWidget {
  final int idClient;

  CloseAccountScreen({this.idClient});

  @override
  _CloseAccountScreenState createState() =>
      _CloseAccountScreenState(idClient: idClient);
}

class _CloseAccountScreenState extends State<CloseAccountScreen> {
  AccountClientStore accountClientStore = AccountClientStore();

  _CloseAccountScreenState({int idClient})
      : accountClientStore = AccountClientStore(idClient: idClient);

  @override
  void initState() {
    super.initState();
    accountClientStore.iniPageCloseAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fechar Conta'),
          centerTitle: true,
          backgroundColor: colorAppbar,
        ),
        body: Observer(
          builder: (_) {
            return ListView(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Card(
                        color: Colors.blueGrey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Total a pagar: ',
                              style: TextStyle(fontSize: 36.0),
                            ),
                            Text(
                              'R\$ ${accountClientStore.totalPayable.toString()}',
                              style: TextStyle(
                                  fontSize: 36.0, color: Colors.white),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        height: space,
                      ),
                      CustomForm(
                        icon: Icon(Icons.monetization_on),
                        tip: 'Valor pago',
                        label: 'Valor pago',
                        obscure: false,
                        mandatory: true,
                        enabled: true,
                      ),
                      SizedBox(
                        height: space,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
