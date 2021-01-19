import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/financial/widget/button_create_flag_card_payment.dart';
import 'package:galleryshop/stores/financial_store.dart';

class FlagCardPaymentListScreen extends StatefulWidget {
  @override
  _FlagCardPaymentListScreenState createState() =>
      _FlagCardPaymentListScreenState();
}

class _FlagCardPaymentListScreenState extends State<FlagCardPaymentListScreen> {
  FinancialStore financialStore = FinancialStore();

  @override
  void initState() {
    super.initState();
    financialStore.initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de cartões'),
        centerTitle: true,
        backgroundColor: colorAppbar,
      ),
      body: Observer(
        builder: (_) {
          return ListView(
            children:
                financialStore.dataFlagCardPayment.map((flagCardPaymentDto) {
              return GestureDetector(
                onDoubleTap: () {},
                onLongPress: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: colorCard,
                    elevation: 3,
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Icon(
                          Icons.credit_card,
                          color: Colors.blue,
                        ),
                      ),
                      title: Column(
                        children: <Widget>[
                          Text(
                            flagCardPaymentDto.description,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            thickness: 1.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  flagCardPaymentDto.credit
                                      ? Column(
                                          children: <Widget>[
                                            Text(
                                              'Crédito',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                                'Taxa ${flagCardPaymentDto.taxCredit.toString()} %')
                                          ],
                                        )
                                      : Column(
                                          children: <Widget>[
                                            Text(
                                              'Crédito',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('Não ativado'),
                                          ],
                                        ),
                                ],
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                  )),
                              Row(
                                children: <Widget>[
                                  flagCardPaymentDto.debit
                                      ? Column(
                                          children: <Widget>[
                                            Text(
                                              'Débito',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                                'Taxa ${flagCardPaymentDto.taxDebit.toString()} %')
                                          ],
                                        )
                                      : Column(
                                          children: <Widget>[
                                            Text(
                                              'Débito',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('Não ativado'),
                                          ],
                                        ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: ButtonCreateFlagCardPayment(),
    );
  }
}
