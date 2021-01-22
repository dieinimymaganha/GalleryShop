import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/close_account_screen.dart';
import 'package:galleryshop/screens/services/billed_service/billed_service_screen.dart';
import 'package:galleryshop/stores/account_client_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
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

  void choiceAction(String choice) {
    if (choice == OptionsMenuDetailClient.editServices) {
      print('Editar');
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BilledServiceScreen(
                    idClient: accountClientStore.accountClientDto.clientDto.id,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(accountClientStore.loading
                ? 'Carregando'
                : accountClientStore.accountClientDto.clientDto.name),
            centerTitle: true,
            backgroundColor: colorAppbar,
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return OptionsMenuDetailClient.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
          ),
          body: accountClientStore.errorList
              ? Container(
                  child: accountClientStore.listEmpty
                      ? CenteredMessage(
                          'Não á lançamentos',
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
                                onPressed: accountClientStore.reloadList,
                              )
                            ],
                          ),
                        ),
                )
              : accountClientStore.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: ListView(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Card(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 35.5,
                                                    bottom: 35.0,
                                                    left: 18.0,
                                                    right: 18.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Total a pagar',
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            color:
                                                                Colors.white)),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'R\$: ${accountClientStore.totalPayable.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              color: Colors.blueAccent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 30,
                                                    bottom: 30,
                                                    left: 18.0,
                                                    right: 18.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'Total gasto',
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'R\$: ${accountClientStore.accountClientDto.amount.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                    Text(
                                                      'Valor de todos periodos',
                                                      style: TextStyle(
                                                          fontSize: 10.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              color: Colors.teal,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 30,
                                                    bottom: 30,
                                                    left: 18.0,
                                                    right: 18.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Total pago',
                                                        style: TextStyle(
                                                            fontSize: 20.0)),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'R\$: ${accountClientStore.accountClientDto.amountPaid.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                    Text(
                                                      'Valor de todos periodos',
                                                      style: TextStyle(
                                                          fontSize: 10.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              color: accountClientStore
                                                      .balanceNegative
                                                  ? Colors.red
                                                  : accountClientStore
                                                          .balanceZero
                                                      ? Colors.grey
                                                      : Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 35.5,
                                                    bottom: 35.0,
                                                    left: 38.0,
                                                    right: 38.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Saldo anterior',
                                                        style: TextStyle(
                                                            fontSize: 20.0)),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'R\$: ${accountClientStore.accountClientDto.balance.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 16.0),
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
                                              initialCalendarFormat:
                                                  CalendarFormat.month,
                                              calendarStyle: CalendarStyle(
                                                outsideDaysVisible: false,
                                                weekendStyle: TextStyle()
                                                    .copyWith(
                                                        color:
                                                            Colors.blue[800]),
                                                holidayStyle: TextStyle()
                                                    .copyWith(
                                                        color:
                                                            Colors.blue[800]),
                                              ),
                                              availableCalendarFormats: const {
                                                CalendarFormat.month: 'Mês',
                                                CalendarFormat.week: 'Semana',
                                              },
                                              headerStyle: HeaderStyle(
                                                  centerHeaderTitle: true,
                                                  formatButtonDecoration:
                                                      BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  formatButtonTextStyle:
                                                      TextStyle(
                                                          color: Colors.white),
                                                  formatButtonShowsNext: false),
                                              startingDayOfWeek:
                                                  StartingDayOfWeek.monday,
                                              daysOfWeekStyle: DaysOfWeekStyle(
                                                weekendStyle: TextStyle()
                                                    .copyWith(
                                                        color:
                                                            Colors.blue[600]),
                                              ),
                                              onDaySelected: (date, events) {
                                                accountClientStore
                                                    .setCalendar();
                                                setState(() {
                                                  accountClientStore
                                                      .calculateTotalAndSetSelectEvents(
                                                          events);
                                                });
                                              },
                                              builders: CalendarBuilders(
                                                selectedDayBuilder: (context,
                                                        date, events) =>
                                                    Container(
                                                        margin:
                                                            EdgeInsets.all(4.0),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    colorAppbar,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Text(
                                                          date.day.toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                todayDayBuilder:
                                                    (context, date, events) {
                                                  return Container(
                                                      margin: EdgeInsets.all(4),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .teal.shade300,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Text(
                                                        date.day.toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ));
                                                },
                                                markersBuilder: (context, date,
                                                    events, holidays) {
                                                  final children = <Widget>[];
                                                  if (events.isNotEmpty) {
                                                    children.add(
                                                      Positioned(
                                                        right: 1,
                                                        bottom: 1,
                                                        child:
                                                            _buildEventsMarker(
                                                                date, events),
                                                      ),
                                                    );
                                                  }
                                                  return children;
                                                },
                                              ),
                                              calendarController:
                                                  accountClientStore
                                                      .calendarController,
                                            ),
                                            accountClientStore.notService
                                                ? Container()
                                                : SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: DataTable(
                                                        columns: const <
                                                            DataColumn>[
                                                          DataColumn(
                                                            label: Text(
                                                              'Serviço',
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Text(
                                                              'Funcionário',
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Text(
                                                              'Valor',
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Text(
                                                              'Desconto',
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Text(
                                                              'Valor a pagar',
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                          ),
                                                        ],
                                                        rows: accountClientStore
                                                            .selectedEvents
                                                            .map((e) {
                                                          return DataRow(
                                                            cells: <DataCell>[
                                                              DataCell(Text(e
                                                                  .billedServiceDto
                                                                  .description)),
                                                              DataCell(Text(e
                                                                  .billedServiceDto
                                                                  .typeEmployee)),
                                                              DataCell(Text(e
                                                                  .billedServiceDto
                                                                  .value
                                                                  .toString())),
                                                              DataCell(Text(e
                                                                  .billedServiceDto
                                                                  .discount
                                                                  .toString())),
                                                              DataCell(Text(e
                                                                  .billedServiceDto
                                                                  .valueFinal
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
                              accountClientStore.notService
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          child: Card(
                                        color: Colors.blueGrey,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Total do dia: ',
                                              style: TextStyle(fontSize: 36.0),
                                            ),
                                            Text(
                                              'R\$ ${accountClientStore.amountPayable}',
                                              style: TextStyle(
                                                  fontSize: 36.0,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.3, 1],
                                      colors: [
                                        Color(0XFF212121),
                                        Color(0XFF616161),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: SizedBox.expand(
                                      child: FlatButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Fechar conta',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              Container(
                                                child: SizedBox(
                                                  child: accountClientStore
                                                          .sending
                                                      ? CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  Colors.blue),
                                                        )
                                                      : Icon(Icons.send),
                                                  height: 28,
                                                  width: 28,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CloseAccountScreen(
                                                          idClient:
                                                              accountClientStore
                                                                  .idClient,
                                                        )));
                                          })),
                                ),
                              ),
                            ],
                          ),
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

class OptionsMenuDetailClient {
  static const String editServices = 'Editar serviços';
  static const String insertServices = 'Inserir serviços';

  static const List<String> choices = <String>[
    editServices,
    insertServices,
  ];
}
