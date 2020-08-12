import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_employee.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/client/widget/button_create_client.dart';
import 'package:galleryshop/screens/employees/create_new_employee_screen.dart';
import 'package:galleryshop/screens/employees/employees_base_screen.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';
import 'package:galleryshop/widgets/progress.dart';

import 'widget/dialog_employee.dart';

const _titleAppbar = 'Lista de funcionários';

class EmployeesListScreen extends StatelessWidget {
  final EmployeeWebClient _webClient = EmployeeWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppbar),
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
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: FutureBuilder<List<EmployeeModel>>(
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
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateNewEmployeeScreen(
                                        employeeModel: employeeModel,
                                      )));
                            },
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => DialogEmployee(
                                        employeeModel: employeeModel,
                                      ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              color: colorCard,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
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
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Nome: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    employeeModel.name,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Sobrenome: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    employeeModel.lastName,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Data Nascimento: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    convertData(employeeModel
                                                        .birthdate
                                                        .toString()),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.grey[200],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  employeeModel.typeEmployees
                                                              .length ==
                                                          1
                                                      ? Text('Função:')
                                                      : Text(
                                                          'Funções:',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                  Column(
                                                    children: employeeModel
                                                        .typeEmployees
                                                        .map((typeEm) {
                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(typeEm
                                                              .description),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
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
      ),
      floatingActionButton: ButtonCreateClient(),
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
