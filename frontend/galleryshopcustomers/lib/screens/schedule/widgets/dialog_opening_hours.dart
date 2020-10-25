import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/models/opening_hours.dart';
import 'package:galleryshopcustomers/stores/opening_hours_store.dart';
import 'package:galleryshopcustomers/widgets/alert_dialog_sending.dart';
import 'package:galleryshopcustomers/widgets/custom_alert_dialog.dart';

import 'package:mobx/mobx.dart';

import '../opening_hours_screen.dart';

class DialogOpeningHours extends StatefulWidget {
  final OpeninigHoursDto openinigHoursDto;

  DialogOpeningHours({this.openinigHoursDto});

  @override
  _DialogOpeningHoursState createState() =>
      _DialogOpeningHoursState(openinigHoursDto: openinigHoursDto);
}

class _DialogOpeningHoursState extends State<DialogOpeningHours> {
  OpeningHoursStore openingHoursStore = OpeningHoursStore();

  _DialogOpeningHoursState({OpeninigHoursDto openinigHoursDto})
      : openingHoursStore =
            OpeningHoursStore(openinigHoursDto: openinigHoursDto);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => openingHoursStore.excluded, (excluded) async {
      if (excluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OpeningHoursScreen()));
      }
    });

    disposer =
        reaction((_) => openingHoursStore.excludedFail, (excludedFail) async {
          if (excludedFail) {
            showDialog(
                context: context, builder: (context) => buildAlertDialogError());
            await Future.delayed(Duration(seconds: 2));
            Navigator.of(context).pop();
          }
        });

  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return openingHoursStore.sending
            ? AlertDialogSending()
            : buildAlertDialog();
      },
    );
  }

  CustomAlertDialog buildAlertDialogOK() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.message,
        color: Colors.white,
      ),
      message: 'Excluido com sucesso!',
      color: Colors.blueAccent,
    );
  }

  CustomAlertDialog buildAlertDialogError() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      message: 'Falha ao excluir!',
      color: Colors.redAccent,
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        'Excluir',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        'Dia da semana: ${widget.openinigHoursDto.dayOfTheWeek == 'SABADO' ? 'SÁBADO' : widget.openinigHoursDto.dayOfTheWeek == 'TERCA' ? 'TERÇA' : widget.openinigHoursDto.dayOfTheWeek}',
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: openingHoursStore.buttoExcludePressed,
          child: Text('Sim'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Não',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
