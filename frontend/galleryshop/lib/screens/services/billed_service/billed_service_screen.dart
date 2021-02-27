import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/detail_account_client.dart';
import 'package:galleryshop/screens/accounts/employee/detail_account_employee.dart';
import 'package:galleryshop/stores/billed_service_store.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

class BilledServiceScreen extends StatefulWidget {
  final String typeEmployee;
  final int idEmployee;
  final int idClient;
  final int accountClientId;
  final int accountEmployeeId;
  final String descTypeEmployee;
  final int idSchedule;
  final bool concludedAppointment;
  final bool consultMyAccount;

  BilledServiceScreen(
      {this.typeEmployee,
      this.idEmployee,
      this.idClient,
      this.accountClientId,
      this.accountEmployeeId,
      this.descTypeEmployee,
      this.idSchedule,
      this.concludedAppointment,
      this.consultMyAccount});

  @override
  _BilledServiceScreenState createState() => _BilledServiceScreenState(
      typeEmployee: typeEmployee,
      idEmployee: idEmployee,
      accountClientId: accountClientId,
      accountEmployeeId: accountEmployeeId,
      descTypeEmployee: descTypeEmployee,
      idSchedule: idSchedule,
      idClient: idClient,
      concludedAppointment: concludedAppointment,
      consultMyAccount: consultMyAccount);
}

class _BilledServiceScreenState extends State<BilledServiceScreen> {
  _BilledServiceScreenState(
      {String typeEmployee,
      int idEmployee,
      int idService,
      int accountClientId,
      int accountEmployeeId,
      String descTypeEmployee,
      int idSchedule,
      int idClient,
      bool concludedAppointment,
      bool consultMyAccount})
      : billedServiceStore = BilledServiceStore(
            typeEmployee: typeEmployee,
            idEmployee: idEmployee,
            accountClientId: accountClientId,
            accountEmployeeId: accountEmployeeId,
            descTypeEmployee: descTypeEmployee,
            idSchedule: idSchedule,
            idClient: idClient,
            concludedAppointment: concludedAppointment,
            consultMyAccount: consultMyAccount);

  BilledServiceStore billedServiceStore = BilledServiceStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    billedServiceStore.initPageBilled();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => billedServiceStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Serviço registrado com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));

      billedServiceStore.accountClientProcess
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountClient(
                    idClient: billedServiceStore.accountClientDto.clientDto.id,
                  )))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailAccountEmployee(
                    idEmployee: billedServiceStore
                        .accontEmployeeDto.employeeDtoBasic.id,
                    consultMyAccount: billedServiceStore.consultMyAccount,
                  )));
    });

    disposer =
        reaction((_) => billedServiceStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Error ao registrar serviço!',
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
            title: Text('Registrar serviço'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: billedServiceStore.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
                  child: ListView(
                    children: <Widget>[
                      Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: colorCard),
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  'Selecione o funcionário',
                                ),
                                value: billedServiceStore.valueSelecIdtEmployee,
                                items: billedServiceStore.listEmployees
                                    .map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.name),
                                    value: item.id,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  billedServiceStore
                                      .setValueSelectEmployee(value);
                                  billedServiceStore
                                      .resetValueSelectTypeEmployee();
                                  billedServiceStore.resetValueSelectService();
                                  billedServiceStore.resetControllerValue();
                                },
                              ),
                            ),
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
                                  'Selecione o tipo de funcionário',
                                ),
                                value:
                                    billedServiceStore.valueSelectTypeEmployee,
                                items: billedServiceStore.listTypeEmployee
                                    .map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.description),
                                    value: item.id,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  billedServiceStore
                                      .setValueSelectTypeEmployee(value);
                                  billedServiceStore.resetValueSelectService();
                                  billedServiceStore.resetControllerValue();
                                },
                              ),
                            ),
                            SizedBox(
                              height: space,
                            ),
                            billedServiceStore.loadingServices
                                ? LinearProgressIndicator()
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        color: colorCard),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(
                                        'Selecione o Serviço',
                                      ),
                                      value:
                                          billedServiceStore.valueSelectService,
                                      items: billedServiceStore.listServices
                                          .map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item.description,
                                          ),
                                          value: item.id,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        billedServiceStore
                                            .setValueSelectService(value);
                                        billedServiceStore.setControllerValue();
                                      },
                                    ),
                                  ),
                            SizedBox(
                              height: space,
                            ),
                            CustomFormCoin(
                              controller:
                                  billedServiceStore.controllerFieldValue,
                              enabled: !billedServiceStore.sending
                                  ? billedServiceStore.enableValue
                                  : false,
                              mandatory: false,
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              label: 'Valor',
                              tip: 'Valor',
                              onChanged: billedServiceStore.setValue,
                            ),
                            SizedBox(
                              height: space,
                            ),
                            CustomFormCoin(
                              controller:
                                  billedServiceStore.controllerFieldDiscount,
                              enabled: !billedServiceStore.sending,
                              mandatory: false,
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              label: 'Desconto',
                              tip: 'Desconto',
                              onChanged: billedServiceStore.setDiscount,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              child: billedServiceStore.sending
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
                                      onPressed:
                                          billedServiceStore.buttonPressed)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
