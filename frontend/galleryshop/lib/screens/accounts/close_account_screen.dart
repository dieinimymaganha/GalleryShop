import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/DetailAccountClient.dart';
import 'package:galleryshop/stores/account_client_store.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

enum SingingCharacter { card, money }

class CloseAccountScreen extends StatefulWidget {
  final int idClient;

  CloseAccountScreen({this.idClient});

  @override
  _CloseAccountScreenState createState() =>
      _CloseAccountScreenState(idClient: idClient);
}

class _CloseAccountScreenState extends State<CloseAccountScreen> {
  _CloseAccountScreenState({int idClient})
      : accountClientStore = AccountClientStore(idClient: idClient);

  AccountClientStore accountClientStore = AccountClientStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    accountClientStore.iniPageCloseAccount();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => accountClientStore.closeAccountError,
        (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Erro ao fechar conta!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });

    disposer =
        reaction((_) => accountClientStore.closeAccountOK, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Conta fechada com sucesso!',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
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
                                'R\$ ${convertMonetary(accountClientStore.totalPayable)}',
                                style: TextStyle(
                                    fontSize: 36.0, color: Colors.white),
                              )
                            ],
                          ),
                        )),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      CustomFormCoin(
                        controller:
                            accountClientStore.controllerFieldValuePaidOut,
                        mandatory: true,
                        enabled: !accountClientStore.sending,
                        tip: 'Valor pago',
                        label: 'Valor pago',
                        textInputType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          accountClientStore.setPaidOut(value);
                        },
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        'Meios de pagamento',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      ListTile(
                        title: const Text('Dinheiro'),
                        leading: Checkbox(
                          value: accountClientStore.money,
                          onChanged: (_) {
                            removeFocus(context);
                            accountClientStore.alterMoney();
                            accountClientStore.alterCard();
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Cartão'),
                        leading: Checkbox(
                          value: accountClientStore.card,
                          onChanged: (_) {
                            removeFocus(context);
                            accountClientStore.alterCard();
                            accountClientStore.alterMoney();
                          },
                        ),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      accountClientStore.card
                          ? Column(
                              children: <Widget>[
                                SizedBox(
                                  height: space,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: colorCard),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      'Selecione a bandeira do cartão',
                                    ),
                                    value: accountClientStore.valueSelectFlag,
                                    items: accountClientStore.listFlagCards
                                        .map((item) {
                                      return DropdownMenuItem(
                                        child: Text(item.description),
                                        value: item.id,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      removeFocus(context);
                                      accountClientStore
                                          .setValueSelectFlag(value);
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    accountClientStore.flagCardPaymentDtoOK
                                        ? accountClientStore
                                                .flagCardPaymentDto.credit
                                            ? Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    value: accountClientStore
                                                        .credit,
                                                    onChanged: (value) {
                                                      removeFocus(context);
                                                      accountClientStore
                                                          .alterDebit();
                                                      accountClientStore
                                                          .alterCredit();
                                                    },
                                                  ),
                                                  Text(
                                                    'Crédito',
                                                    style: TextStyle(
                                                        fontSize: 18.0),
                                                  )
                                                ],
                                              )
                                            : Container()
                                        : Container(),
                                    accountClientStore.flagCardPaymentDtoOK
                                        ? accountClientStore
                                                .flagCardPaymentDto.debit
                                            ? Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    value: accountClientStore
                                                        .debit,
                                                    onChanged: (value) {
                                                      removeFocus(context);
                                                      accountClientStore
                                                          .alterDebit();
                                                      accountClientStore
                                                          .alterCredit();
                                                    },
                                                  ),
                                                  Text(
                                                    'Débito',
                                                    style: TextStyle(
                                                        fontSize: 18.0),
                                                  )
                                                ],
                                              )
                                            : Container()
                                        : Container(),
                                  ],
                                )
                              ],
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Fechar',
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
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                          Colors.blue),
                                                )
                                              : Icon(Icons.send),
                                          height: 28,
                                          width: 28,
                                        ),
                                      )
                                    ],
                                  ),
                                  onPressed: accountClientStore
                                      .buttonCloseAccountPressed)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }

  void removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
