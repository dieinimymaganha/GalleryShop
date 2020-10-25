import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleStore scheduleStore = ScheduleStore();

  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    scheduleStore.setListSchedule();
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
