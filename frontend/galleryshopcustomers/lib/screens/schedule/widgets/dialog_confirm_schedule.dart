import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';

class DialogConfirmSchedule extends StatefulWidget {
  final ScheduleDto scheduleDto;

  DialogConfirmSchedule({this.scheduleDto});

  @override
  _DialogConfirmScheduleState createState() => _DialogConfirmScheduleState(scheduleDto: scheduleDto);
}

class _DialogConfirmScheduleState extends State<DialogConfirmSchedule> {
  ScheduleStore scheduleStore = ScheduleStore();

  _DialogConfirmScheduleState({ScheduleDto scheduleDto})
      : scheduleStore = ScheduleStore(scheduleDto: scheduleDto);

  @override
  Widget build(BuildContext context) {
    return buildAlertDiaglo(context);
  }

  @override
  void initState() {
    super.initState();
  }

  AlertDialog buildAlertDiaglo(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirmar',
        style: TextStyle(color: Colors.blue),
      ),
      content: Text('Horário 09:00 - Dia 25/10'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            'Sim',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Não',
            style: TextStyle(color: Colors.blueGrey),
          ),
        )
      ],
      elevation: 24.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
