import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:galleryshop/stores/schedule_store.dart';

class DialogConfirmScheduleEmployee extends StatefulWidget {
  final ScheduleDto scheduleDto;
  final ClientDto clientDto;

  DialogConfirmScheduleEmployee({this.scheduleDto, this.clientDto});

  @override
  _DialogConfirmScheduleEmployeeState createState() =>
      _DialogConfirmScheduleEmployeeState(
          scheduleDto: scheduleDto, clientDto: clientDto);
}

class _DialogConfirmScheduleEmployeeState
    extends State<DialogConfirmScheduleEmployee> {
  ScheduleStore scheduleStore = ScheduleStore();

  _DialogConfirmScheduleEmployeeState(
      {ScheduleDto scheduleDto, ClientDto clientDto})
      : scheduleStore =
            ScheduleStore(scheduleDto: scheduleDto, clientDto: clientDto);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirmar',
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Horário ${scheduleStore.scheduleDto.startAttendance}'),
          SizedBox(
            height: 8.0,
          ),
          Text(
              'Cliente: ${scheduleStore.clientDto.name} ${scheduleStore.clientDto.lastName}')
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              'Sim',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
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
