import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/account_employee_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

class ConsultPaymentAccountEmployee extends StatefulWidget {
  final int idAccount;

  ConsultPaymentAccountEmployee({this.idAccount});

  @override
  _ConsultPaymentAccountEmployeeState createState() =>
      _ConsultPaymentAccountEmployeeState(idAccount: idAccount);
}

class _ConsultPaymentAccountEmployeeState
    extends State<ConsultPaymentAccountEmployee> {
  AccountEmployeeStore accountEmployeeStore = AccountEmployeeStore();

  _ConsultPaymentAccountEmployeeState({int idAccount})
      : accountEmployeeStore = AccountEmployeeStore(idAccount: idAccount);

  @override
  void initState() {
    super.initState();
    accountEmployeeStore.setListCalendarPayments();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Consultar pagamentos'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: accountEmployeeStore.errorList
              ? Container(
                  child: accountEmployeeStore.listEmpty
                      ? CenteredMessage(
                          'Não á pagamentos registrados',
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
                                  'Falha do carregar',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FlatButton(
                                child: Text('Clique para recarregar'),
                                onPressed:
                                accountEmployeeStore.reloadPagePayments,
                              )
                            ],
                          ),
                        ))
              : ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCalendar(
                        locale: 'pt_BR',
                        events: accountEmployeeStore.events,
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
                          accountEmployeeStore.setListCalendarPayments();
                          setState(() {
                            accountEmployeeStore.selectedEvents = events;
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
                        accountEmployeeStore.calendarController,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: accountEmployeeStore.notService
                          ? Container()
                          : Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  DataTable(
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Meio de pagamento',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Cartão',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Valor',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ],
                                      rows: accountEmployeeStore.selectedEvents
                                          .map((e) {
                                        return DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text(
                                                e.typePaymentDto.description)),
                                            DataCell(Text(
                                                e.typePaymentDto.flag == null
                                                    ? '-'
                                                    : e.typePaymentDto.flag)),
                                            DataCell(
                                                Text(convertMonetary(e.value))),
                                          ],
                                        );
                                      }).toList()),
                                ],
                              ),
                            ),
                    )
                  ],
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
        color: accountEmployeeStore.calendarController.isSelected(date)
            ? Colors.green
            : accountEmployeeStore.calendarController.isToday(date)
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
