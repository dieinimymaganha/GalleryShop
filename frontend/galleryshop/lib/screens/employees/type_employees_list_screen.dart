import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/screens/client/widget/button_create_client.dart';
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
                      return Card(
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
                              return ListTile(
                                  leading: Icon(Icons.beenhere,
                                      color: Colors.blue),
                                  title: Text(service.description, style: TextStyle(fontSize: 18),),
                                  subtitle: service.value == null
                                      ? Text('Preço variavel', style: TextStyle(color: Colors.indigo),)
                                      : Text(
                                          'R\$ ${service.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),));
                            }).toList()
                                      ..add(ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.add,
                                            color: colorAppbar,
                                          ),
                                        ),
                                        title: Text('Adicionar'),
                                        onTap: () {},
                                      )))
                          ],
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
