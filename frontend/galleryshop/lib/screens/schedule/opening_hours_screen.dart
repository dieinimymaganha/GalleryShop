import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/schedule/button_create_opening_hours.dart';
import 'package:galleryshop/stores/opening_hours_store.dart';

class OpeningHoursScreen extends StatefulWidget {
  @override
  _OpeningHoursScreenState createState() => _OpeningHoursScreenState();
}

class _OpeningHoursScreenState extends State<OpeningHoursScreen> {
  OpeningHoursStore openingHoursStore = OpeningHoursStore();

  @override
  void initState() {
    super.initState();
    openingHoursStore.setIdEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horario de atendimento'),
          centerTitle: true,
          backgroundColor: colorAppbar,
          leading: IconButton(
            icon: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BaseScreen()));
              },
            ),
          ),
        ),
        body: Container(
          child: Observer(
            builder: ((_) {
              return ListView(
                children:
                    openingHoursStore.listOpeningHours.map((openingHoursModel) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onDoubleTap: () {},
                          onLongPress: () {},
                          child: ListTile(
                            title: Text(
                              openingHoursModel.dayOfTheWeek == 'TERCA'
                                  ? 'TERÇA'
                                  : openingHoursModel.dayOfTheWeek == 'SABADO'
                                      ? 'SÁBADO'
                                      : openingHoursModel.dayOfTheWeek, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('Horario atendimento: ', style: TextStyle(color: Colors.black87),),
                                    Text(openingHoursModel.endJourneyLate ==
                                            null
                                        ? '${openingHoursModel.earlyMorningJourney} ás ${openingHoursModel.endMorningJourney}'
                                        : '${openingHoursModel.earlyMorningJourney} ás ${openingHoursModel.endJourneyLate}')
                                  ],
                                ),
                                openingHoursModel.endJourneyLate == null
                                    ? Container()
                                    : Row(
                                        children: <Widget>[
                                          Text('Horario almoço: ', style: TextStyle(color: Colors.black87),),
                                          Text(
                                              '${openingHoursModel.endMorningJourney} ás ${openingHoursModel.earlyAfternoonJourney}')
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),

          ),

        ),
    floatingActionButton: ButtonCreateNewOpeningHours(),);
  }
}
