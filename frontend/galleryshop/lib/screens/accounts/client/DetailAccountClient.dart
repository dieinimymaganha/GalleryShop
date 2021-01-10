import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/schedule/widgets/card_widget_schedule_appointment.dart';
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
            title: Text('Conta Cindy'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Card(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
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
                                borderRadius: BorderRadius.circular(20.0)),
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
                                borderRadius: BorderRadius.circular(20.0)),
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
              Divider(
                thickness: 0.5,
              ),
              Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 500.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TableCalendar(
                            locale: 'pt_BR',
                            events: accountClientStore.events,
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
                              accountClientStore.setCalendar();
                              setState(() {
                                accountClientStore.selectedEvents = events;
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
                            accountClientStore.calendarController,
                          ),
                          criaTabela(),
                        ],
                      )
                    ),
                  ),

                ],
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

  criaTabela() {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Pontos, Time, Gols"),
        _criarLinhaTable("25, Palmeiras,16 "),
        _criarLinhaTable("20, Santos, 5"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
        _criarLinhaTable("17, Flamento, 6"),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
