import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/bar_shop/sale/sale_product.dart';
import 'package:galleryshop/stores/sale_product_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:table_calendar/table_calendar.dart';

import 'DetailAccountClient.dart';
import 'widget/dialog_exclude_sale.dart';

class ConsultSalesAccountClient extends StatefulWidget {
  final int idClient;

  ConsultSalesAccountClient({this.idClient});

  @override
  _ConsultSalesAccountClientState createState() =>
      _ConsultSalesAccountClientState(idClient: idClient);
}

class _ConsultSalesAccountClientState extends State<ConsultSalesAccountClient> {
  SaleProductStore saleProductStore = SaleProductStore();

  _ConsultSalesAccountClientState({int idClient})
      : saleProductStore = SaleProductStore(idClient: idClient);

  @override
  void initState() {
    super.initState();
    saleProductStore.setListCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Consultar vendas'),
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
                      builder: (context) => DetailAccountClient(
                            idClient: saleProductStore.idClient,
                          )));
                },
              ),
            ),
          ),
          body: saleProductStore.errorList
              ? Container(
                  child: saleProductStore.listEmpty
                      ? CenteredMessage(
                          'Não á vendas registradas',
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
                              onPressed: saleProductStore.reloadPageSales,
                            )
                          ],
                        )),
                )
              : Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCalendar(
                          locale: 'pt_BR',
                          events: saleProductStore.events,
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
                            saleProductStore.setListCalendar();
                            setState(() {
                              saleProductStore.selectedEvents = events;
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
                              saleProductStore.calendarController,
                        ),
                      ),
                      Column(
                        children: saleProductStore.selectedEvents
                            .map<Widget>((saleDto) {
                          return Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onLongPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              DialogExcludeSale(
                                                saleDto: saleDto,
                                                idClient:
                                                    saleProductStore.idClient,
                                              ));
                                    },
                                    onDoubleTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SaleProduct(
                                                idClient: saleProductStore.idClient,
                                                saleDto: saleDto,
                                              )));
                                    },
                                    child: Card(
                                      color: colorCard,
                                      child: ListTile(
                                        title: Text(
                                            saleDto.productSoldDto.description),
                                        subtitle: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text('Quantidade: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0)),
                                                Text(
                                                  saleDto
                                                      .productSoldDto.quantity
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text('Total: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0)),
                                                Text(
                                                  convertMonetary(saleDto
                                                      .productSoldDto
                                                      .valueTotal),
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        isThreeLine: true,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
        color: saleProductStore.calendarController.isSelected(date)
            ? Colors.green
            : saleProductStore.calendarController.isToday(date)
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