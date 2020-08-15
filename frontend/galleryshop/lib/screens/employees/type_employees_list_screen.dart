import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/employees/edit_type_employee.dart';
import 'package:galleryshop/screens/employees/widget/button_create_new_type_employee.dart';
import 'package:galleryshop/stores/type_employee_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/progress.dart';

class TypeEmployeeListScreen extends StatefulWidget {
  @override
  _TypeEmployeeListScreenState createState() => _TypeEmployeeListScreenState();
}

class _TypeEmployeeListScreenState extends State<TypeEmployeeListScreen> {
  TypeEmployeeStore typeEmployeeStore = TypeEmployeeStore();

  @override
  void initState() {
    super.initState();
    typeEmployeeStore.setList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tipos Funcionarios e serviços'),
            centerTitle: true,
            backgroundColor: colorAppbar,
            leading: IconButton(
              icon: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BaseScreen()));
                },
              ),
            ),
          ),
          body: typeEmployeeStore.errorList
              ? Container(
                  child: typeEmployeeStore.listEmpty
                      ? CenteredMessage(
                          'Não á dados Cadastrados',
                          icon: Icons.description,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text(
                                  'Falha ao carregar',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              FlatButton(
                                  child: Text('Clique para recarregar!'),
                                  onPressed: typeEmployeeStore.reloadList)
                            ],
                          ),
                        ))
              : Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                  child: typeEmployeeStore.loading
                      ? Center(child: CircularProgressIndicator())
                      : ListView(
                          children: typeEmployeeStore.listTypeEmployee
                              .map((typeEmployeeModel) {
                            return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        EditTypeEmployeeDialog(
                                            typeEmployeeModel:
                                                typeEmployeeModel));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: colorCard,
                                child: ExpansionTile(
                                  title: Text(
                                    typeEmployeeModel.description,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  children: <Widget>[
                                    Column(
                                        children: typeEmployeeModel.services
                                            .map<Widget>((service) {
                                      return Column(
                                        children: <Widget>[
                                          Divider(
                                            color: Colors.white,
                                            thickness: 2,
                                          ),
                                          ListTile(
                                              leading: Icon(Icons.beenhere,
                                                  color: Colors.blue),
                                              title: Text(
                                                service.description,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              subtitle: service.value == null
                                                  ? Text(
                                                      'Preço variavel',
                                                      style: TextStyle(
                                                          color: Colors.indigo),
                                                    )
                                                  : Text(
                                                      'R\$ ${service.value.toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          color: Colors.teal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                        ],
                                      );
                                    }).toList())
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )),
          floatingActionButton: ButtonCreateNewTypeEmployee(),
        );
      },
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
