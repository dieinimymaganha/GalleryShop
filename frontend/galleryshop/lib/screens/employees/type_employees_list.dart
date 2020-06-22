import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/screens/client/widget/buttom_create_client.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/progress.dart';

class TypeEmployeeList extends StatelessWidget {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Tipos Funcionario'),
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
                      return InkWell(
                        onTap: () {
                          print('Clicou');
                        },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Icon(Icons.account_circle),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 2,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            typeEmployeeModel.description,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
      floatingActionButton: ButtomCreateClient(),
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
