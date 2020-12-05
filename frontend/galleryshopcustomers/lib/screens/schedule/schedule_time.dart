import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/schedule/widgets/dialog_confirm_schedule.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleTime extends StatefulWidget {
  final int idEmployee;

  ScheduleTime({this.idEmployee});

  @override
  _ScheduleTimeState createState() =>
      _ScheduleTimeState(idEmployee: idEmployee);
}

class _ScheduleTimeState extends State<ScheduleTime> {
  _ScheduleTimeState({int idEmployee})
      : scheduleStore = ScheduleStore(idEmployee: idEmployee);

  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.setListSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar horário'),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Agenda",
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 10),
                    Text("Eve - Barbeiro",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  locale: 'pt_BR',
                  events: scheduleStore.events,
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
                    holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Mês',
                    CalendarFormat.week: 'Semana',
                  },
                  headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      formatButtonTextStyle: TextStyle(color: Colors.white),
                      formatButtonShowsNext: false),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
                  ),
                  onDaySelected: (date, events) {
                    scheduleStore.setListSchedule();
                    setState(() {
                      scheduleStore.selectedEvents = events;
                    });
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: colorAppbar, shape: BoxShape.circle),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, events) {
                      return Container(
                          margin: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.teal.shade300,
                              shape: BoxShape.circle),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ));
                    },
                    markersBuilder: (context, date, events, holidays) {
                      final children = <Widget>[];

                      if (events.isNotEmpty) {
                        children.add(
                          Positioned(
                            right: 1,
                            bottom: 1,
                            child: _buildEventsMarker(date, events),
                          ),
                        );
                      }
                      return children;
                    },
                  ),
                  calendarController: scheduleStore.calendarController,
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Horários',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Column(
                children: scheduleStore.selectedEvents.map<Widget>((event) {
                  return Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                event.startAttendance.toString(),
                                style: TextStyle(fontSize: 16),
                              )),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          DialogConfirmSchedule(
                                            scheduleDto: event,
                                          ));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.green[700],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 2.0)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Agendar',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                }).toList(),
              ),
            ],
          )),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scheduleStore.calendarController.isSelected(date)
            ? Colors.green
            : scheduleStore.calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
