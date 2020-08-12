import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/employees/edit_type_employee.dart';
import 'package:galleryshop/screens/employees/widget/button_create_new_type_employee.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/progress.dart';

class TypeEmployeeListScreen extends StatelessWidget {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => BaseScreen()));
            },
          ),
        ),
      ),
      body: FutureBuilder<List<TypeEmployeeModel>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<TypeEmployeeModel> typeEmployees = snapshot.data;
                if (typeEmployees.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final TypeEmployeeModel typeEmployeeModel =
                          typeEmployees[index];
                      return GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) => EditTypeEmployeeDialog(
                                  typeEmployeeModel: typeEmployeeModel));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: colorCard,
                          child: ExpansionTile(
                            title: Text(
                              typeEmployeeModel.description,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            children: <Widget>[
                              Column(
                                  children:
                                      typeEmployeeModel.services.map((service) {
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
                                                style:
                                                    TextStyle(color: Colors.indigo),
                                              )
                                            : Text(
                                                'R\$ ${service.value.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.w700),
                                              )),
                                  ],
                                );
                              }).toList())
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: typeEmployees.length,
                  );
                }
              }

              return CenteredMessage(
                'Nenhum cliente encontrados',
                icon: Icons.warning,
              );
              break;
          }
          return CenteredMessage('Erro desconhecido');
        },
      ),
      floatingActionButton: ButtonCreateNewTypeEmployee(),
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
