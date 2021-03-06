import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/models/schedule.dart';

import 'dialog_confirm_schedule.dart';

class CardWidgetScheduleTime extends StatelessWidget {
  ScheduleDtoAppointment scheduleDtoAppointment;

  CardWidgetScheduleTime({this.scheduleDtoAppointment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          thickness: 1.0,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    scheduleDtoAppointment.startAttendance,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  lineGen(
                    lines: [40.0, 30.0, 20.0],
                  ),
                  Text(
                    scheduleDtoAppointment.endAttendance,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: colorAppbar,
                    borderRadius: (BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)))),
                child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  color: colorCard,
                  padding: EdgeInsets.only(
                    left: 16.0,
                    top: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 18.0,
                        child: Row(
                          children: <Widget>[
                            Text('Profissional: '),
                            Text(
                              scheduleDtoAppointment.nicknameEmployee,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        scheduleDtoAppointment.typeEmployee,
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FlatButton(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.event_available,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      'Confirmar horário',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          DialogConfirmSchedule(
                                            scheduleDtoAppointment: scheduleDtoAppointment,
                                          ));
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class lineGen extends StatelessWidget {
  final lines;

  const lineGen({
    Key key,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            3,
            (index) => Container(
                  height: 2.0,
                  width: lines[index],
                  color: Color(0xffd0d2d8),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                )));
  }
}
