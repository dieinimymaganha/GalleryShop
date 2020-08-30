import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
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
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Observer(
            builder: ((_) {
              return ListView(
                children:
                    openingHoursStore.listOpeningHours.map((openingHoursModel) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: InkWell(
                      onDoubleTap: () {},
                      onLongPress: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        color: colorCard,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          openingHoursModel.dayOfTheWeek ==
                                                  'TERCA'
                                              ? 'TERÇA'
                                              : openingHoursModel
                                                          .dayOfTheWeek ==
                                                      'SABADO'
                                                  ? 'SÁBADO'
                                                  : openingHoursModel
                                                      .dayOfTheWeek,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'Horario manhã:',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(openingHoursModel
                                                .earlyMorningJourney),
                                            Text(openingHoursModel
                                                .endMorningJourney),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        openingHoursModel
                                                    .earlyAfternoonJourney ==
                                                null
                                            ? Container()
                                            : Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Horario tarde:',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(openingHoursModel
                                                      .earlyAfternoonJourney)
                                                ],
                                              ),
                                        openingHoursModel.endJourneyLate == null
                                            ? Container()
                                            : Column(
                                                children: <Widget>[
                                                  Text(openingHoursModel
                                                      .endJourneyLate)
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ));
  }
}
