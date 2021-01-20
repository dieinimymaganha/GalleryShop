import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:galleryshop/screens/financial/flag_card_payment_list_screen.dart';
import 'package:galleryshop/stores/financial_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:mobx/mobx.dart';

class CreateNewFlagCardPaymentScreen extends StatefulWidget {
  final FlagCardPaymentDto flagCardPaymentDto;

  CreateNewFlagCardPaymentScreen({this.flagCardPaymentDto});

  @override
  _CreateNewFlagCardPaymentScreenState createState() =>
      _CreateNewFlagCardPaymentScreenState(
          flagCardPaymentDto: flagCardPaymentDto);
}

class _CreateNewFlagCardPaymentScreenState
    extends State<CreateNewFlagCardPaymentScreen> {
  FinancialStore financialStore = FinancialStore();

  _CreateNewFlagCardPaymentScreenState({FlagCardPaymentDto flagCardPaymentDto})
      : financialStore = FinancialStore(flagCardPaymentDto: flagCardPaymentDto);

  ReactionDisposer disposer;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    financialStore.setDataInitial();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => financialStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          financialStore.change
              ? 'Cartão alterado com sucesso!'
              : 'Cartão cadastrado  com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FlagCardPaymentListScreen()));
    });

    disposer = reaction((_) => financialStore.duplicate, (created) async {
      if (created) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Cartão já cadastrado!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 2),
        ));
      }
      await Future.delayed(Duration(seconds: 2));
    });

    disposer =
        reaction((_) => financialStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Falha ao cadastrar!',
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
            title: Text(financialStore.change
                ? 'Editar cartão'
                : 'Cadastrar novo cartão'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Container(
            padding:
                EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 10.0),
            child: ListView(
              children: <Widget>[
                Form(
                  autovalidate: true,
                  key: financialStore.formState,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        controller: financialStore.controllerFieldDescription,
                        onChanged: financialStore.setDescription,
                        obscure: false,
                        mandatory: true,
                        enabled: !financialStore.sending,
                        tip: 'Nome da bandeira do cartão',
                        label: 'Nome da bandeira do cartão',
                        icon: Icon(Icons.credit_card),
                        validator: (value) {
                          return validatorTax(value);
                        },
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        'Selecione as opções do cartão:',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 50.0, left: 50.0, top: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: colorCard,
                        ),
                        child: Column(
                          children: <Widget>[
                            SwitchListTile(
                              value: financialStore.credit,
                              onChanged: (_) {
                                setState(() {
                                  financialStore.credit =
                                      !financialStore.credit;
                                });
                              },
                              title:
                                  Text(financialStore.credit ? '' : 'Crédito'),
                              subtitle: financialStore.credit
                                  ? CustomForm(
                                      controller: financialStore
                                          .controllerFieldCreditTax,
                                      onChanged: financialStore.setTaxCredit,
                                      validator: (value) {
                                        return validatorTax(value);
                                      },
                                      obscure: false,
                                      mandatory: false,
                                      enabled: !financialStore.sending,
                                      tip: 'Taxa %',
                                      label: 'Crédito',
                                      textInputType: TextInputType.number,
                                    )
                                  : Container(),
                              selected: financialStore.credit,
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: space,
                            ),
                            SwitchListTile(
                              value: financialStore.debit,
                              onChanged: (_) {
                                setState(() {
                                  financialStore.debit = !financialStore.debit;
                                });
                              },
                              title: Text(financialStore.debit ? '' : 'Débito'),
                              subtitle: financialStore.debit
                                  ? CustomForm(
                                      controller: financialStore
                                          .controllerFieldDebitTax,
                                      onChanged: financialStore.setTaxDebit,
                                      validator: (value) {
                                        return validatorTax(value);
                                      },
                                      obscure: false,
                                      mandatory: false,
                                      enabled: !financialStore.sending,
                                      tip: 'Taxa %',
                                      label: 'Débito',
                                      textInputType: TextInputType.number,
                                    )
                                  : Container(),
                              selected: financialStore.debit,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: space,
                ),
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
                                financialStore.change ? 'Editar' : 'Cadastrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: financialStore.sending
                                    ? CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(Colors.blue),
                                      )
                                    : SizedBox(
                                        child: Icon(Icons.send),
                                        height: 28,
                                        width: 28,
                                      ),
                              )
                            ],
                          ),
                          onPressed: financialStore.change
                              ? financialStore.buttonChangePressed
                              : financialStore.buttonPressed)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String validatorTax(String value) {
  if (value.isEmpty) {
    return 'Preenchimento obrigatório';
  } else if (value == null) {
    return 'Preenchimento obrigatório';
  } else {
    return null;
  }
}
