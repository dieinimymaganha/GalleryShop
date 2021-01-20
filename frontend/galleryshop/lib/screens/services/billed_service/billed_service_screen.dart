import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/billed_service_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class BilledServiceScreen extends StatefulWidget {
  final String typeEmployee;
  final int idEmployee;
  final int idClient;
  final String descTypeEmployee;

  BilledServiceScreen(
      {this.typeEmployee,
      this.idEmployee,
      this.idClient,
      this.descTypeEmployee});

  @override
  _BilledServiceScreenState createState() => _BilledServiceScreenState(
      typeEmployee: typeEmployee,
      idEmployee: idEmployee,
      idClient: idClient,
      descTypeEmployee: descTypeEmployee);
}

class _BilledServiceScreenState extends State<BilledServiceScreen> {
  BilledServiceStore billedServiceStore = BilledServiceStore();

  _BilledServiceScreenState(
      {String typeEmployee,
      int idEmployee,
      int idService,
      int idClient,
      String descTypeEmployee})
      : billedServiceStore = BilledServiceStore(
            typeEmployee: typeEmployee,
            idEmployee: idEmployee,
            idClient: idClient,
            descTypeEmployee: descTypeEmployee);

  @override
  void initState() {
    super.initState();
    billedServiceStore.initPageBilled();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
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
                                  'Selecione o tipo de funcionário',
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
                                      },
                                    ),
                                  ),
                            SizedBox(
                              height: space,
                            ),
                            CustomForm(
                              enabled: true,
                              mandatory: false,
                              obscure: false,
                              label: 'Valor',
                              tip: 'Teste',
                            ),
                            SizedBox(
                              height: space,
                            ),
                            CustomForm(
                              enabled: true,
                              mandatory: false,
                              obscure: false,
                              label: 'Desconto',
                              tip: 'Teste',
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
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
