import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/client_store.dart';

class ScheduleConfirmAppointment extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Texto $index");

  @override
  _ScheduleConfirmAppointmentState createState() =>
      _ScheduleConfirmAppointmentState();
}

class _ScheduleConfirmAppointmentState
    extends State<ScheduleConfirmAppointment> {
  ClientStore clientStore = ClientStore();

  @override
  void initState() {
    super.initState();
    clientStore.setList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: colorAppbar,
              title: TextField(
                onChanged: clientStore.setFilter,
                decoration: InputDecoration(hintText: 'Pesquisar'),
              ),
            ),
            body: ListView(
              children: clientStore.lisFiltered.map((clientModel) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,),
                  child: InkWell(
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
                                      bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        clientModel.nickname,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w700,
                                            fontSize: 18),
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
                                            clientModel.name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .w400),
                                          )
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
                                            clientModel.lastName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .w400),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'CPF: ',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                          Text(
                                            clientModel.cpf,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .w400),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Telefone: ',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                          Text(
                                            clientModel.phoneNumber,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .w400),
                                          )
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
                                              clientModel
                                                  .birthdate
                                                  .toString(),
                                            ),
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ));
      },
    );
  }
}
