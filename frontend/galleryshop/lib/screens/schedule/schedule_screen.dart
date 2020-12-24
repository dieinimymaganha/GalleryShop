import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  final int idEmployee;
  final int idTypeEmployee;


  ScheduleScreen({this.idEmployee, this.idTypeEmployee});

  @override
  _ScheduleScreenState createState() =>
      _ScheduleScreenState(
          idEmployee: idEmployee, idTypeEmployee: idTypeEmployee);
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  _ScheduleScreenState({int idEmployee, int idTypeEmployee})
      : scheduleStore = ScheduleStore(
      idEmployee: idEmployee, idTypeEmployee: idTypeEmployee);

  ScheduleStore scheduleStore = ScheduleStore();

  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    scheduleStore.setListMySchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha agenda'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: Container(
        child: TableCalendar(
          locale: 'pt_BR',
          calendarController: _controller,
          initialCalendarFormat: CalendarFormat.week,
          formatAnimation: FormatAnimation.slide,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(selectedColor: Colors.blueGrey),
        ),
      ),
    );
  }
}
