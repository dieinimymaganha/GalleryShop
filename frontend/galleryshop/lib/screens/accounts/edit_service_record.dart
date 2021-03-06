import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/detail_account_client.dart';
import 'package:galleryshop/screens/accounts/employee/detail_account_employee.dart';
import 'package:galleryshop/screens/accounts/widget/dialog_exclude_service_record.dart';
import 'package:galleryshop/stores/billed_service_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

class EditServiceRecordScreen extends StatefulWidget {
  final int idClient;
  final int idEmployee;
  final bool consultMyAccount;

  EditServiceRecordScreen(
      {this.idClient, this.idEmployee, this.consultMyAccount});

  @override
  _EditServiceRecordScreenState createState() => _EditServiceRecordScreenState(
      idClient: idClient,
      idEmployee: idEmployee,
      consultMyAccount: consultMyAccount);
}

class _EditServiceRecordScreenState extends State<EditServiceRecordScreen> {
  BilledServiceStore billedServiceStore = BilledServiceStore();

  _EditServiceRecordScreenState(
      {int idClient, int idEmployee, bool consultMyAccount})
      : billedServiceStore = BilledServiceStore(
            idClient: idClient,
            idEmployee: idEmployee,
            consultMyAccount: consultMyAccount);

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
                  billedServiceStore.accountClientProcess
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailAccountClient(
                                idClient: billedServiceStore.idClient,
                              )))
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailAccountEmployee(
                              idEmployee: billedServiceStore.idEmployee,
                              consultMyAccount:
                                  billedServiceStore.consultMyAccount)));
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
                                  onLongPress: () {
                                    billedServiceStore.accountClientProcess
                                        ? showDialog(
                                            context: context,
                                            builder: (context) =>
                                                DialogExcludeServiceRecord(
                                                  idService:
                                                      serviceRecordDto.id,
                                                  idClient: billedServiceStore
                                                      .idClient,
                                                ))
                                        : billedServiceStore.consultMyAccount
                                            ? Container()
                                            : showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    DialogExcludeServiceRecord(
                                                        idService:
                                                            serviceRecordDto.id,
                                                        idEmployee:
                                                            billedServiceStore
                                                                .idEmployee,
                                                        consultMyAccount:
                                                            billedServiceStore
                                                                .consultMyAccount));
                                  },
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
