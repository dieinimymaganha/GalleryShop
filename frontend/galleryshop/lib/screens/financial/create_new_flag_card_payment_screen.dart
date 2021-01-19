import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/financial_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class CreateNewFlagCardPaymentScreen extends StatefulWidget {
  @override
  _CreateNewFlagCardPaymentScreenState createState() =>
      _CreateNewFlagCardPaymentScreenState();
}

class _CreateNewFlagCardPaymentScreenState
    extends State<CreateNewFlagCardPaymentScreen> {
  FinancialStore financialStore = FinancialStore();

  @override
  void initState() {
    super.initState();
    financialStore.initCreateNew();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cadastrar novo cartão'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Container(
            padding:
                EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 10.0),
            child: ListView(
              children: <Widget>[
                Form(
                  autovalidate: !financialStore.taxCreditValid,
                  key: financialStore.formState,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        controller: financialStore.controllerFieldDescription,
                        onChanged: financialStore.setDescription,
                        obscure: false,
                        mandatory: true,
                        enabled: true,
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
                              value: financialStore.flagCardPaymentForm.credit,
                              onChanged: (_) {
                                setState(() {
                                  financialStore.flagCardPaymentForm.credit =
                                      !financialStore
                                          .flagCardPaymentForm.credit;
                                });
                              },
                              title: Text(
                                  financialStore.flagCardPaymentForm.credit
                                      ? ''
                                      : 'Crédito'),
                              subtitle: financialStore
                                      .flagCardPaymentForm.credit
                                  ? CustomForm(
                                      controller: financialStore
                                          .controllerFieldCreditTax,
                                      onChanged: financialStore.setTaxCredit,
                                      validator: (value) {
                                        return validatorTax(value);
                                      },
                                      obscure: false,
                                      mandatory: false,
                                      enabled: true,
                                      tip: 'Taxa %',
                                      label: 'Crédito',
                                    )
                                  : Container(),
                              selected:
                                  financialStore.flagCardPaymentForm.credit,
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: space,
                            ),
                            SwitchListTile(
                              value: financialStore.flagCardPaymentForm.debit,
                              onChanged: (_) {
                                setState(() {
                                  financialStore.flagCardPaymentForm.debit =
                                      !financialStore.flagCardPaymentForm.debit;
                                });
                              },
                              title: Text(
                                  financialStore.flagCardPaymentForm.debit
                                      ? ''
                                      : 'Débito'),
                              subtitle: financialStore.flagCardPaymentForm.debit
                                  ? CustomForm(
                                controller: financialStore
                                    .controllerFieldDebitTax,
                                onChanged: financialStore.setTaxDebit,
                                validator: (value) {
                                  return validatorTax(value);
                                },
                                obscure: false,
                                mandatory: false,
                                enabled: true,
                                tip: 'Taxa %',
                                label: 'Débito',
                              )
                                  : Container(),
                              selected:
                                  financialStore.flagCardPaymentForm.debit,
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
                                'Cadastrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {})),
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
  }
  return null;
}
