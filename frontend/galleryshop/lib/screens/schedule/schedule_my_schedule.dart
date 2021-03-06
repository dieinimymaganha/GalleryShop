import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

import 'widgets/card_widget_schedule_time.dart';

class ScheduleMySchedule extends StatefulWidget {
  final int idEmployee;
  final int idTypeEmployee;

  ScheduleMySchedule({this.idEmployee, this.idTypeEmployee});

  @override
  _ScheduleMyScheduleState createState() => _ScheduleMyScheduleState(
      idEmployee: idEmployee, idTypeEmployee: idTypeEmployee);
}

class _ScheduleMyScheduleState extends State<ScheduleMySchedule> {
  _ScheduleMyScheduleState({int idEmployee, int idTypeEmployee})
      : scheduleStore = ScheduleStore(
            idEmployee: idEmployee, idTypeEmployee: idTypeEmployee);

  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.createInfoSchedule();
    scheduleStore.loagingPageInit();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title:
                scheduleStore.errorLoadingTypeEmployee ? Text('Minha agenda') : Text('Minha agenda ${scheduleStore.typeEmployeeDto.description}'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: scheduleStore.errorList
              ? Container(
                  child: scheduleStore.listEmpty
                      ? CenteredMessage(
                          'Não á horários disponiveis',
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
                                onPressed: scheduleStore.reloadList,
                              )
                            ],
                          ),
                        ),
                )
              : scheduleStore.loadingPageScheduleTime
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
              : SingleChildScrollView(
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
                        weekendStyle:
                        TextStyle().copyWith(color: Colors.blue[800]),
                        holidayStyle:
                        TextStyle().copyWith(color: Colors.blue[800]),
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
                          formatButtonTextStyle:
                          TextStyle(color: Colors.white),
                          formatButtonShowsNext: false),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle:
                        TextStyle().copyWith(color: Colors.blue[600]),
                      ),
                      onDaySelected: (date, events) {
                        scheduleStore.setListMySchedule();
                        setState(() {
                          scheduleStore.selectedEvents = events;
                        });
                      },
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                                margin: EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: colorAppbar,
                                    shape: BoxShape.circle),
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
                        markersBuilder:
                            (context, date, events, holidays) {
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
                      calendarController:
                      scheduleStore.calendarController,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Horários',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Column(
                      children: scheduleStore.selectedEvents
                          .map<Widget>((schedule) {
                        return CardWidgetScheduleTime(
                          scheduleDto: schedule,
                        );
                      }).toList()),
                ],
              )),
        );
      },
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
