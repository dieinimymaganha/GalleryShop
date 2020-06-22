import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/screens/client/widget/buttom_create_client.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';
import 'package:galleryshop/widgets/progress.dart';

const _titleAppbar = 'Lista de funcionários';

class EmployeesList extends StatelessWidget {
  final EmployeeWebClient _webClient = EmployeeWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppbar),
        centerTitle: true,
        backgroundColor: colorAppbar,
      ),
      body: FutureBuilder<List<EmployeeModel>>(
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
                final List<EmployeeModel> employees = snapshot.data;
                if (employees.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final EmployeeModel employeeModel = employees[index];
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.person),
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
                                            employeeModel.nickname,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'Nome: ${employeeModel.name}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            'Sobrenome: ${employeeModel.lastName}',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            'Data Nascimento: ${convertData(employeeModel.birthdate.toString())}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                              'Especialista: ${employeeModel.typeEmployees[0].description}'),
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
                    itemCount: employees.length,
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
