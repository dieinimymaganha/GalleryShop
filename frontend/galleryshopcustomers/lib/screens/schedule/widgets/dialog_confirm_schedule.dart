import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/models/schedule.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';
import 'package:galleryshopcustomers/widgets/alert_dialog_sending.dart';
import 'package:galleryshopcustomers/widgets/custom_alert_dialog.dart';
import 'package:mobx/mobx.dart';

import '../schedule_appointment_screen.dart';

class DialogConfirmSchedule extends StatefulWidget {
  final ScheduleDtoAppointment scheduleDtoAppointment;

  DialogConfirmSchedule({this.scheduleDtoAppointment});

  @override
  _DialogConfirmScheduleState createState() => _DialogConfirmScheduleState(
      scheduleDtoAppointment: scheduleDtoAppointment);
}

class _DialogConfirmScheduleState extends State<DialogConfirmSchedule> {
  ScheduleStore scheduleStore = ScheduleStore();

  _DialogConfirmScheduleState({ScheduleDtoAppointment scheduleDtoAppointment})
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
            builder: (context) => buildAlertDialogScheduleOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScheduleAppointmentScreen(
                  appointmentConsult: true,
                )));
      }
    });

    disposer =
        reaction((_) => scheduleStore.scheduleDuplicate, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context,
            builder: (context) => buildAlertDialogDuplicate());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });

    disposer = reaction((_) => scheduleStore.scheduleNotAvailable,
        (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context,
            builder: (context) => buildAlertDialogScheduleBlock());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });

    disposer =
        reaction((_) => scheduleStore.scheduleConflit, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogConflit());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
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
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return scheduleStore.scheduleSend
            ? AlertDialogSending()
            : buildAlertDialog(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirmar',
        style: TextStyle(color: Colors.blue),
      ),
      content: Text(
          'Horário ${scheduleStore.scheduleDtoAppointment.startAttendance} | ${scheduleStore.scheduleDtoAppointment.day}'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            scheduleStore.send(scheduleStore.scheduleDtoAppointment.id);
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

  CustomAlertDialog buildAlertDialogScheduleOK() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Agendado com sucesso!',
      color: Colors.blueAccent,
    );
  }

  CustomAlertDialog buildAlertDialogScheduleError() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      message: 'Falha ao agendar!\nTente novamente',
      color: Colors.redAccent,
    );
  }

  CustomAlertDialog buildAlertDialogScheduleBlock() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Horário não está mais disponivel',
      color: Colors.deepOrange,
    );
  }

  CustomAlertDialog buildAlertDialogDuplicate() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Já existe agendamento\n nesse mesmo horario',
      color: Colors.deepOrange,
    );
  }

  CustomAlertDialog buildAlertDialogConflit() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Conflito de horárioz consulte\n seus horarios agendados',
      color: Colors.deepOrange,
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
