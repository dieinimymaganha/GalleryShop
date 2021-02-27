import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/employees/create_new_employee_screen.dart';
import 'package:galleryshop/screens/employees/widget/button_create_employee.dart';
import 'package:galleryshop/stores/employee_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';

const _titleAppbar = 'Lista de funcionários';

class EmployeesListScreen extends StatefulWidget {
  @override
  _EmployeesListScreenState createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  EmployeeStore employeeStore = EmployeeStore();

  @override
  void initState() {
    super.initState();
    employeeStore.setList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
            body: employeeStore.errorList
                ? Container(
                    child: employeeStore.listEmpty
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
                                    onPressed: employeeStore.reloadList)
                              ],
                            ),
                          ))
                : Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: employeeStore.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView(
                            children:
                                employeeStore.listEmployee.map((employeeModel) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onDoubleTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateNewEmployeeScreen(
                                                  employeeModel: employeeModel,
                                                  editMyAccount: false,
                                                )));
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          employeeModel.name,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'Sobrenome: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          employeeModel
                                                              .lastName,
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'Data Nascimento: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          convertData(
                                                            employeeModel
                                                                .birthdate
                                                                .toString(),
                                                          ),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueAccent),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      color: Colors.grey[200],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          employeeModel
                                                                      .typeEmployees
                                                                      .length ==
                                                                  1
                                                              ? 'Função:'
                                                              : 'Funções:',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children:
                                                              employeeModel
                                                                  .typeEmployees
                                                                  .map<Widget>(
                                                                      (typeEm) {
                                                            return Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(typeEm
                                                                        .description
                                                                        .toString()),
                                                                  ],
                                                                ),
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
                            }).toList(),
                          ),
                  ),
            floatingActionButton: ButtonCreateNewEmployee(
              editMyAccount: false,
            ));
      },
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
