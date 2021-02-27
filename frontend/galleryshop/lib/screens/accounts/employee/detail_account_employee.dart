import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/widget/option_menu_detail_account_client.dart';
import 'package:galleryshop/screens/accounts/consult_sales_account.dart';
import 'package:galleryshop/screens/accounts/employee/account_list_employee_screen.dart';
import 'package:galleryshop/screens/accounts/employee/consult_payment_account_employee.dart';
import 'package:galleryshop/screens/bar_shop/sale/sale_product.dart';
import 'package:galleryshop/screens/services/billed_service/billed_service_screen.dart';
import 'package:galleryshop/stores/account_employee_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

import '../close_account_screen.dart';
import '../edit_service_record.dart';

class DetailAccountEmployee extends StatefulWidget {
  final int idEmployee;
  final bool consultMyAccount;

  DetailAccountEmployee({this.idEmployee, this.consultMyAccount});

  @override
  _DetailAccountEmployeeState createState() => _DetailAccountEmployeeState(
      idEmployee: idEmployee, consultMyAccount: consultMyAccount);
}

class _DetailAccountEmployeeState extends State<DetailAccountEmployee> {
  AccountEmployeeStore accountEmployeeStore = AccountEmployeeStore();

  _DetailAccountEmployeeState({int idEmployee, bool consultMyAccount})
      : accountEmployeeStore = AccountEmployeeStore(
            idEmployee: idEmployee, consultMyAccount: consultMyAccount);

  @override
  void initState() {
    super.initState();
    accountEmployeeStore.iniPageEmployee();
  }

  void choiceAction(String choice) {
    if (choice == OptionsMenuDetailAccount.insertServices) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BilledServiceScreen(
                  accountEmployeeId: accountEmployeeStore.accountEmployeeDto.id,
                  consultMyAccount: accountEmployeeStore.consultMyAccount)));
    } else if (choice == OptionsMenuDetailAccount.consultServices) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditServiceRecordScreen(
                    idEmployee: accountEmployeeStore
                        .accountEmployeeDto.employeeDtoBasic.id,
                    consultMyAccount: accountEmployeeStore.consultMyAccount,
                  )));
    } else if (choice == OptionsMenuDetailAccount.updatePage) {
      accountEmployeeStore.iniPageEmployee();
    } else if (choice == OptionsMenuDetailAccount.consultPayment) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConsultPaymentAccountEmployee(
                    idAccount: accountEmployeeStore.accountEmployeeDto.id,
                  )));
    } else if (choice == OptionsMenuDetailAccount.insertProduct) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SaleProduct(
                    idEmployee: accountEmployeeStore
                        .accountEmployeeDto.employeeDtoBasic.id,
                    consultMyAccount: accountEmployeeStore.consultMyAccount,
                  )));
    } else if (choice == OptionsMenuDetailAccount.consultSales) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConsultSalesAccount(
                    idEmployee: accountEmployeeStore
                        .accountEmployeeDto.employeeDtoBasic.id,
                    consultMyAccount: accountEmployeeStore.consultMyAccount,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(accountEmployeeStore.loading
                ? 'Carregando'
                : accountEmployeeStore
                    .accountEmployeeDto.employeeDtoBasic.name),
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
                      builder: (context) => AccountListEmployeeScreen()));
                },
              ),
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return accountEmployeeStore.consultMyAccount
                      ? OptionsMenuDetailConsultMyAccount.choices
                          .map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList()
                      : OptionsMenuDetailAccount.choices.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                },
              )
            ],
          ),
          body: accountEmployeeStore.errorList
              ? Container(
                  child: accountEmployeeStore.listEmpty
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
                                onPressed: accountEmployeeStore.reloadList,
                              )
                            ],
                          ),
                        ),
                )
              : accountEmployeeStore.loading
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
                                                      'R\$: ${convertMonetary(accountEmployeeStore.totalPayable)}',
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
                                                      'R\$: ${convertMonetary(accountEmployeeStore.accountEmployeeDto.amount)}',
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
                                                      'R\$: ${convertMonetary(accountEmployeeStore.accountEmployeeDto.amountPaid)}',
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
                                              color: accountEmployeeStore
                                                      .balanceNegative
                                                  ? Colors.red
                                                  : accountEmployeeStore
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
                                                    left: 11.0,
                                                    right: 11.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('Saldo anterior',
                                                        style: TextStyle(
                                                            fontSize: 20.0)),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'R\$: ${convertMonetary(accountEmployeeStore.accountEmployeeDto.balance)}',
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
                                              holidays:
                                                  accountEmployeeStore.events2,
                                              events:
                                                  accountEmployeeStore.events,
                                              initialCalendarFormat:
                                                  CalendarFormat.month,
                                              calendarStyle: CalendarStyle(
                                                outsideDaysVisible: true,
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
                                              onDaySelected: (date, holidays) {
                                                accountEmployeeStore
                                                    .setCalendar();
                                                setState(() {
                                                  accountEmployeeStore
                                                      .calculateTotalAndSetSelectEvents(
                                                          holidays);
                                                  accountEmployeeStore
                                                      .setSelectedEventsSales(
                                                          date);
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

                                                  if (holidays.isNotEmpty) {
                                                    children.add(
                                                      Positioned(
                                                        bottom: 1,
                                                        child:
                                                            _buildHolidaysMarker(
                                                                date, holidays),
                                                      ),
                                                    );
                                                  }

                                                  return children;
                                                },
                                              ),
                                              calendarController:
                                                  accountEmployeeStore
                                                      .calendarController,
                                            ),
                                            accountEmployeeStore.notService
                                                ? Container()
                                                : SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: space,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      'Serviços realizados',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20.0,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    DataTable(
                                                                        columns: const <
                                                                            DataColumn>[
                                                                          DataColumn(
                                                                            label:
                                                                                Text(
                                                                              'Serviço',
                                                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
                                                                            ),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text(
                                                                              'Funcionário',
                                                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
                                                                            ),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text(
                                                                              'Valor',
                                                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
                                                                            ),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text(
                                                                              'Desconto',
                                                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
                                                                            ),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text(
                                                                              'Valor a pagar',
                                                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        rows: accountEmployeeStore
                                                                            .selectedEvents
                                                                            .map((e) {
                                                                          return DataRow(
                                                                            cells: <DataCell>[
                                                                              DataCell(Text(e.billedServiceDto.description)),
                                                                              DataCell(Text(e.billedServiceDto.typeEmployee)),
                                                                              DataCell(Text(convertMonetary(e.billedServiceDto.value))),
                                                                              DataCell(Text(convertMonetary(e.billedServiceDto.discount))),
                                                                              DataCell(Text(convertMonetary(e.billedServiceDto.valueFinal))),
                                                                            ],
                                                                          );
                                                                        }).toList()),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: space,
                                            ),
                                            accountEmployeeStore.notSale
                                                ? Container()
                                                : SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[400],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(10),
                                                          ),
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Produtos comprados no Bar',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  height: space,
                                                                ),
                                                                DataTable(
                                                                    columns: const <
                                                                        DataColumn>[
                                                                      DataColumn(
                                                                        label:
                                                                            Text(
                                                                          'Produto',
                                                                          style: TextStyle(
                                                                              fontStyle: FontStyle.italic,
                                                                              fontSize: 16.0),
                                                                        ),
                                                                      ),
                                                                      DataColumn(
                                                                        label:
                                                                            Text(
                                                                          'Valor unidade',
                                                                          style: TextStyle(
                                                                              fontStyle: FontStyle.italic,
                                                                              fontSize: 16.0),
                                                                        ),
                                                                      ),
                                                                      DataColumn(
                                                                        label:
                                                                            Text(
                                                                          'Quantidade',
                                                                          style: TextStyle(
                                                                              fontStyle: FontStyle.italic,
                                                                              fontSize: 16.0),
                                                                        ),
                                                                      ),
                                                                      DataColumn(
                                                                        label:
                                                                            Text(
                                                                          'Valor total',
                                                                          style: TextStyle(
                                                                              fontStyle: FontStyle.italic,
                                                                              fontSize: 16.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    rows: accountEmployeeStore
                                                                        .selectedEventsSales
                                                                        .map(
                                                                            (e) {
                                                                      return DataRow(
                                                                        cells: <
                                                                            DataCell>[
                                                                          DataCell(Text(e
                                                                              .productSoldDto
                                                                              .description)),
                                                                          DataCell(Text(convertMonetary(e
                                                                              .productSoldDto
                                                                              .value))),
                                                                          DataCell(Text(e
                                                                              .productSoldDto
                                                                              .quantity
                                                                              .toString())),
                                                                          DataCell(Text(convertMonetary(e
                                                                              .productSoldDto
                                                                              .valueTotal))),
                                                                        ],
                                                                      );
                                                                    }).toList()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              accountEmployeeStore.valueToday
                                  ? Container()
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
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
                                                style:
                                                    TextStyle(fontSize: 36.0),
                                              ),
                                              Text(
                                                'R\$ ${convertMonetary(accountEmployeeStore.totalDay)}',
                                                style: TextStyle(
                                                    fontSize: 36.0,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                              accountEmployeeStore.consultMyAccount
                                  ? Container()
                                  : Padding(
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      'Fechar conta',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Container(
                                                      child: SizedBox(
                                                        child: accountEmployeeStore
                                                                .sending
                                                            ? CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation(
                                                                        Colors
                                                                            .blue),
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
                                                                idEmployee:
                                                                    accountEmployeeStore
                                                                        .idEmployee,
                                                                consultMyAccount: accountEmployeeStore.consultMyAccount,
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
        color: accountEmployeeStore.calendarController.isSelected(date)
            ? Colors.teal
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

  Widget _buildHolidaysMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accountEmployeeStore.calendarController.isSelected(date)
            ? Colors.green
            : accountEmployeeStore.calendarController.isToday(date)
                ? Colors.blueGrey
                : Colors.blueGrey[400],
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
