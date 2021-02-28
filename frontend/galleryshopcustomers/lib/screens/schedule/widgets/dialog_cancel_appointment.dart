import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:galleryshopcustomers/screens/schedule/schedule_appointment_screen.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';
import 'package:galleryshopcustomers/widgets/alert_dialog_sending.dart';
import 'package:galleryshopcustomers/widgets/custom_alert_dialog.dart';
import 'package:mobx/mobx.dart';

class DialogCancelAppointment extends StatefulWidget {
  final ScheduleDtoAppointment scheduleDtoAppointment;

  DialogCancelAppointment({this.scheduleDtoAppointment});

  @override
  _DialogCancelAppointmentState createState() => _DialogCancelAppointmentState(
      scheduleDtoAppointment: scheduleDtoAppointment);
}

class _DialogCancelAppointmentState extends State<DialogCancelAppointment> {
  ScheduleStore scheduleStore = ScheduleStore();

  _DialogCancelAppointmentState({ScheduleDtoAppointment scheduleDtoAppointment})
      : scheduleStore =
            ScheduleStore(scheduleDtoAppointment: scheduleDtoAppointment);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => scheduleStore.scheduleOk, (exluded) async {
      if (exluded) {
        showDialog(
            context: context,
            builder: (context) => buildAlertDialogScheduleCanceledOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScheduleAppointmentScreen(
                  appointmentConsult: true,
                )));
      }
    });

    disposer =
        reaction((_) => scheduleStore.scheduleFail, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context,
            builder: (context) => buildAlertDialogScheduleError());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return scheduleStore.scheduleSend
          ? AlertDialogSending()
          : buildAlertDialog(context);
    });
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Cancelar',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
          'Horário ${scheduleStore.scheduleDtoAppointment.startAttendance} | ${scheduleStore.scheduleDtoAppointment.day}'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            scheduleStore
                .cancelAppointment(scheduleStore.scheduleDtoAppointment.id);
          },
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

  CustomAlertDialog buildAlertDialogScheduleCanceledOK() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Horário cancelado',
      color: Colors.blue,
    );
  }

  CustomAlertDialog buildAlertDialogScheduleError() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Não foi possivel cancelar',
      color: Colors.redAccent,
    );
  }
}
