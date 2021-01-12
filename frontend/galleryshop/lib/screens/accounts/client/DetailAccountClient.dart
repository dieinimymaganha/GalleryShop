import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/widget/insert_service.dart';
import 'package:galleryshop/stores/account_client_store.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailAccountClient extends StatefulWidget {
  final int idClient;

  DetailAccountClient({this.idClient});

  @override
  _DetailAccountClientState createState() =>
      _DetailAccountClientState(idClient: idClient);
}

class _DetailAccountClientState extends State<DetailAccountClient> {
  AccountClientStore accountClientStore = AccountClientStore();

  _DetailAccountClientState({int idClient})
      : accountClientStore = AccountClientStore(idClient: idClient);

  @override
  void initState() {
    super.initState();
    accountClientStore.iniPageClient();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(accountClientStore.accountClientDto.clientDto.name),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 8.0, right: 8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Card(
                                  color: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Valor total',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'R\$: ${accountClientStore.accountClientDto.amount.toString()}',
                                          style: TextStyle(fontSize: 16.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text('Valor pago',
                                            style: TextStyle(fontSize: 20.0)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'R\$: ${accountClientStore.accountClientDto.amountPaid.toString()}',
                                          style: TextStyle(fontSize: 16.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: accountClientStore.balanceNegative
                                      ? Colors.red
                                      : accountClientStore.balanceZero
                                          ? Colors.grey
                                          : Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text('Saldo',
                                            style: TextStyle(fontSize: 20.0)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'R\$: ${accountClientStore.accountClientDto.balance.toString()}',
                                          style: TextStyle(fontSize: 16.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                TableCalendar(
                                  locale: 'pt_BR',
                                  events: accountClientStore.events,
                                  initialCalendarFormat: CalendarFormat.month,
                                  calendarStyle: CalendarStyle(
                                    outsideDaysVisible: false,
                                    weekendStyle: TextStyle()
                                        .copyWith(color: Colors.blue[800]),
                                    holidayStyle: TextStyle()
                                        .copyWith(color: Colors.blue[800]),
                                  ),
                                  availableCalendarFormats: const {
                                    CalendarFormat.month: 'Mês',
                                    CalendarFormat.week: 'Semana',
                                  },
                                  headerStyle: HeaderStyle(
                                      centerHeaderTitle: true,
                                      formatButtonDecoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      formatButtonTextStyle:
                                          TextStyle(color: Colors.white),
                                      formatButtonShowsNext: false),
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    weekendStyle: TextStyle()
                                        .copyWith(color: Colors.blue[600]),
                                  ),
                                  onDaySelected: (date, events) {
                                    accountClientStore.setCalendar();
                                    setState(() {
                                      accountClientStore.selectedEvents =
                                          events;
                                    });
                                  },
                                  builders: CalendarBuilders(
                                    selectedDayBuilder:
                                        (context, date, events) => Container(
                                            margin: EdgeInsets.all(4.0),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: colorAppbar,
                                                shape: BoxShape.circle),
                                            child: Text(
                                              date.day.toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            child: _buildEventsMarker(
                                                date, events),
                                          ),
                                        );
                                      }
                                      return children;
                                    },
                                  ),
                                  calendarController:
                                      accountClientStore.calendarController,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'Serviço',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Funcionário',
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
                                        DataColumn(
                                          label: Text(
                                            'Desconto',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Valor a pagar',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ],
                                      rows: accountClientStore.selectedEvents
                                          .map((e) {
                                        return DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text(e
                                                .billedServiceDto.description)),
                                            DataCell(Text(e.billedServiceDto
                                                .typeEmployee)),
                                            DataCell(Text(e
                                                .billedServiceDto.valueFinal
                                                .toString())),
                                            DataCell(Text(e
                                                .billedServiceDto.valueFinal
                                                .toString())),
                                            DataCell(Text(e
                                                .billedServiceDto.valueFinal
                                                .toString())),
                                          ],
                                        );
                                      }).toList()),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Card(
                        color: Colors.blueGrey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Total: ', style: TextStyle(fontSize: 36.0),),
                            Text('R\$ ${accountClientStore.amountPayable}', style: TextStyle(fontSize: 36.0, color: Colors.white),)
                          ],
                        ),
                      )
                    ),
                  )
                ],
              ),
            ],
          ),
          floatingActionButton: ButtonInsertService(),
        );
      },
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accountClientStore.calendarController.isSelected(date)
            ? Colors.green
            : accountClientStore.calendarController.isToday(date)
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
