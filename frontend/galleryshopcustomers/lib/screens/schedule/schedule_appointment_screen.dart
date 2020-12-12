import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';

import 'widgets/card_widget_appointment.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  ScheduleStore scheduleStore = ScheduleStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Horários agendados'),
        backgroundColor: colorAppbar,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
                children: scheduleStore.dataSchedule.map<Widget>((schedule) {
              return CardWidgetScheduleAppointment(
                scheduleDto: schedule,
              );
            }).toList()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scheduleStore.getAppointmentClient();
  }
}
