import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/stores/billed_service_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

import '../edit_service_account_client.dart';

class DialogExcludeServiceRecord extends StatefulWidget {
  final int idService;
  final int idClient;
  final int idEmployee;

  DialogExcludeServiceRecord({this.idService, this.idClient, this.idEmployee});

  @override
  _DialogExcludeServiceRecordState createState() =>
      _DialogExcludeServiceRecordState(
          idService: idService, idClient: idClient, idEmployee: idEmployee);
}

class _DialogExcludeServiceRecordState
    extends State<DialogExcludeServiceRecord> {
  BilledServiceStore billedServiceStore = BilledServiceStore();

  _DialogExcludeServiceRecordState(
      {int idService, int idClient, int idEmployee})
      : billedServiceStore = BilledServiceStore(
            idService: idService, idClient: idClient, idEmployee: idEmployee);

  ReactionDisposer disposer;

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => billedServiceStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        billedServiceStore.accountClientProcess
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => EditServiceAccountClientScreen(
                      idClient: billedServiceStore.idClient,
                    )))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => EditServiceAccountClientScreen(
                      idEmployee: billedServiceStore.idEmployee,
                    )));
      }
    });

    disposer =
        reaction((_) => billedServiceStore.excludedFail, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogError());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });

    disposer = reaction((_) => billedServiceStore.excludedUnauthorized,
        (excludedUnauthorized) async {
      if (excludedUnauthorized) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogBlock());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return billedServiceStore.sending
            ? AlertDialogSending()
            : buildAlertDialog(context);
      },
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Excluir'),
      actions: <Widget>[
        FlatButton(
            onPressed: billedServiceStore.buttonExcludeServicePressed,
            child: Text(
              'Sim',
              style: TextStyle(color: Colors.redAccent),
            )),
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
