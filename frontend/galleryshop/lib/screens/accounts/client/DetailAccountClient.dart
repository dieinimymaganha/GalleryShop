import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/account_client_store.dart';

class DetailAccountClient extends StatefulWidget {
  final int idClient;

  DetailAccountClient({this.idClient});

  @override
  _DetailAccountClientState createState() =>
      _DetailAccountClientState(idClient: idClient);
}

class _DetailAccountClientState extends State<DetailAccountClient> {
  AccountClientStore accountClientStore = AccountClientStore();

  _DetailAccountClientState({int idClient})
      : accountClientStore = AccountClientStore(idClient: idClient);

  @override
  void initState() {
    super.initState();
    accountClientStore.iniPageClient();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Conta Cindy'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Card(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Valor total',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'R\$: ${accountClientStore.accountClientDto.amount.toString()}',
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Text('Valor pago',
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'R\$: ${accountClientStore.accountClientDto.amountPaid.toString()}',
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: accountClientStore.balanceNegative
                                ? Colors.red : accountClientStore.balanceZero ? Colors.grey
                                : Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Text('Saldo',
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'R\$: ${accountClientStore.accountClientDto.balance.toString()}',
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.5,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 500.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                      Text('addd'),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
