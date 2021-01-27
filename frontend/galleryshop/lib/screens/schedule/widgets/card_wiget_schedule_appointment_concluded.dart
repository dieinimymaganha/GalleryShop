import 'package:flutter/material.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:galleryshop/screens/services/billed_service/billed_service_screen.dart';

class CardWidgetScheduleAppointmentConcluded extends StatelessWidget {
  ScheduleDtoAppointment scheduleDtoAppointment;

  CardWidgetScheduleAppointmentConcluded({this.scheduleDtoAppointment});

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
                  LineGen(
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
                    left: 8.0,
                    top: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 18.0,
                        child: Row(
                          children: <Widget>[
                            Text('Cliente: '),
                            Text(
                              scheduleDtoAppointment.clientDto.name,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(' | Apelido: '),
                            Text(
                              scheduleDtoAppointment.clientDto.nickname,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 18.0,
                        child: Row(
                          children: <Widget>[
                            Text('Data nasc: '),
                            Text(
                              convertData(
                                  scheduleDtoAppointment.clientDto.birthdate),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 18.0,
                        child: Row(
                          children: <Widget>[
                            Text('Concluido: '),
                            Text(
                              scheduleDtoAppointment.completionTime.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
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

class LineGen extends StatelessWidget {
  final lines;

  const LineGen({
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
