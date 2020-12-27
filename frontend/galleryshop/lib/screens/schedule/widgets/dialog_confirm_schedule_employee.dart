import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/models/schedule.dart';
import 'package:galleryshop/screens/schedule/schedule_base_screen.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/custom_alert_dialog.dart';
import 'package:mobx/mobx.dart';

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
            builder: (context) => ScheduleBaseScreen()));
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

  AlertDialog buildAlertDialog(BuildContext context) {
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
            onPressed: () {
              scheduleStore
                  .sendConfirmScheduleEmployee(scheduleStore.scheduleDto.id);
            },
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
      message: 'Conflito de horários consulte\n seus horarios agendados',
      color: Colors.deepOrange,
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
