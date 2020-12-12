import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/base/base_screen.dart';
import 'package:galleryshopcustomers/screens/schedule/schedule_time.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';

class ScheduleConsultServices extends StatefulWidget {
  @override
  _ScheduleConsultServicesState createState() =>
      _ScheduleConsultServicesState();
}

class _ScheduleConsultServicesState extends State<ScheduleConsultServices> {
  ScheduleStore scheduleStore = ScheduleStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    scheduleStore.getServices();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => scheduleStore.sendEmployee, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Enviando',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScheduleTime(
                  idEmployee: scheduleStore.idEmployee,
                  idTypeEmployee: scheduleStore.idTypeEmployee,
                )));
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
            title: Text('Consultar agendas'),
            backgroundColor: colorAppbar,
            centerTitle: true,
              leading: IconButton(
                icon: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => BaseScreen()));
                  },
                ),
              )
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                DropdownButton(
                  hint: Text('Selecione o tipo de funcionário'),
                  value: scheduleStore.valueSelectTypeEmployee,
                  items: scheduleStore.dataServices.map((item) {
                    return DropdownMenuItem(
                      child: Text(item.description.toString()),
                      value: item.description.toString(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    scheduleStore.selectTypeService(value);
                    scheduleStore.resetEmployee();
                    scheduleStore.setIdTypeEmployee(value);
                  },
                ),
                scheduleStore.loadingListEmployee
                    ? Container()
                    : scheduleStore.loadingValues
                        ? LinearProgressIndicator()
                        : DropdownButton(
                            hint: Text('Selecione o funcionário'),
                            value: scheduleStore.valueSelectEmployee,
                            items: scheduleStore.listEmployee.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.nickname.toString()),
                                value: item.id,
                              );
                            }).toList(),
                            onChanged: (value) {
                              scheduleStore.selectEmployee(value);
                              scheduleStore.setIdEmployee(value);
                            },
                          ),
                SizedBox(
                  height: 10,
                ),
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
                  child: SizedBox.expand(child: Observer(
                    builder: (_) {
                      return FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Buscar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: scheduleStore.sendEmployee
                                      ? CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.blue),
                                        )
                                      : Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: scheduleStore.sendPressed);
                    },
                  )),
                ),
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
