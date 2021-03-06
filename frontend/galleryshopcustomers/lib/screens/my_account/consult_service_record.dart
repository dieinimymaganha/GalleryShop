import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/data/function_generic.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/my_account/detail_my_account.dart';
import 'package:galleryshopcustomers/stores/billed_service_store.dart';
import 'package:galleryshopcustomers/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

class ConsultServiceRecordScreen extends StatefulWidget {
  final int idClient;

  ConsultServiceRecordScreen({this.idClient});

  @override
  _ConsultServiceRecordScreenState createState() =>
      _ConsultServiceRecordScreenState(idClient: idClient);
}

class _ConsultServiceRecordScreenState extends State<ConsultServiceRecordScreen> {
  BilledServiceStore billedServiceStore = BilledServiceStore();

  _ConsultServiceRecordScreenState({int idClient})
      : billedServiceStore = BilledServiceStore(
          idClient: idClient,
        );

  @override
  void initState() {
    super.initState();
    billedServiceStore.setListCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Serviços registrados'),
            centerTitle: true,
            backgroundColor: colorAppbar,
            leading: IconButton(
              icon: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailMyAccount(
                            idClient: billedServiceStore.idClient,
                          )));
                },
              ),
            ),
          ),
          body: billedServiceStore.errorList
              ? Container(
                  child: billedServiceStore.listEmpty
                      ? CenteredMessage('Não á serviços registrados',
                          icon: Icons.description)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text(
                                  'Falha do carregar',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FlatButton(
                                child: Text('Clique para recarregar'),
                                onPressed:
                                    billedServiceStore.reloadPageExcludeService,
                              )
                            ],
                          ),
                        ),
                )
              : Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCalendar(
                          locale: 'pt_BR',
                          events: billedServiceStore.events,
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
                            billedServiceStore.setListCalendar();
                            setState(() {
                              billedServiceStore.selectedEvents = events;
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
                          calendarController:
                              billedServiceStore.calendarController,
                        ),
                      ),
                      Column(
                        children: billedServiceStore.selectedEvents
                            .map<Widget>((serviceRecordDto) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                  child: Card(
                                color: colorCard,
                                child: ListTile(
                                  title: Text(serviceRecordDto
                                      .billedServiceDto.description),
                                  subtitle: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Funcionário : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                              '${serviceRecordDto.employeeDtoBasic.name} | ${serviceRecordDto.billedServiceDto.typeEmployee}'),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Valor : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(convertMonetary(serviceRecordDto
                                              .billedServiceDto.value))
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Desconto : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(convertMonetary(serviceRecordDto
                                              .billedServiceDto.discount))
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Valor cobrado : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(convertMonetary(serviceRecordDto
                                              .billedServiceDto.valueFinal))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: billedServiceStore.calendarController.isSelected(date)
            ? Colors.green
            : billedServiceStore.calendarController.isToday(date)
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
