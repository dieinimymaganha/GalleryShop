import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/models/schedule.dart';

class CardWidgetScheduleAppointment extends StatelessWidget {
  ScheduleDto scheduleDto;

  CardWidgetScheduleAppointment({this.scheduleDto});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                scheduleDto.startAttendance,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              lineGen(
                lines: [20.0, 30.0, 40.0, 10.0],
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
                    height: 21.0,
                    child: Row(
                      children: <Widget>[
                        Text(
                            '${scheduleDto.startAttendance} - ${scheduleDto.endAttendance} | '),
                        Text(scheduleDto.nicknameEmployee),
                      ],
                    ),
                  ),
                  Text(
                    scheduleDto.typeEmployee,
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        )
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
            4,
            (index) => Container(
                  height: 2.0,
                  width: lines[index],
                  color: Color(0xffd0d2d8),
                  margin: EdgeInsets.symmetric(vertical: 14.0),
                )));
  }
}
