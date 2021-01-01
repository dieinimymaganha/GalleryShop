import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/schedule/schedule_appointment_screen.dart';
import 'package:galleryshop/stores/schedule_store.dart';

import 'schedule_my_schedule.dart';

class ScheduleMyOptions extends StatefulWidget {
  final bool appointmentConsult;

  ScheduleMyOptions({this.appointmentConsult});

  @override
  _ScheduleMyOptionsState createState() =>
      _ScheduleMyOptionsState(appointmentConsult: appointmentConsult);
}

class _ScheduleMyOptionsState extends State<ScheduleMyOptions> {
  _ScheduleMyOptionsState({bool appointmentConsult})
      : scheduleStore = ScheduleStore(appointmentConsult: appointmentConsult);

  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.loadingInitOptionsSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(scheduleStore.appointmentConsult
                ? 'Consultar horários agendados'
                : 'Consultar horários disponíveis'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: scheduleStore.loadingPageScheduleTime
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : scheduleStore.errorLoadingOptionsMySchedule
                  ? Center(
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
                              onPressed:
                                  scheduleStore.realoadListOptionsMySchedule)
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 2, left: 8, right: 8),
                        child: Column(
                          children: scheduleStore.employeeDto.typeEmployees
                              .map<Widget>((typeEmployee) {
                            return Column(
                              children: <Widget>[
                                GestureDetector(
                                  child: ListTile(
                                    title: Text(typeEmployee.description),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                  ),
                                  onTap: () {
                                    scheduleStore.appointmentConsult
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ScheduleAppointmentScreen(
                                                      idEmployee: scheduleStore
                                                          .employeeDto.id,
                                                      idTypeEmployee:
                                                          typeEmployee.id,
                                                      appointmentConsult: true,
                                                    )))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ScheduleMySchedule(
                                                      idEmployee: scheduleStore
                                                          .employeeDto.id,
                                                      idTypeEmployee:
                                                          typeEmployee.id,
                                                    )));
                                  },
                                ),
                                Divider(
                                  color: Colors.grey[400],
                                  thickness: 0.5,
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
