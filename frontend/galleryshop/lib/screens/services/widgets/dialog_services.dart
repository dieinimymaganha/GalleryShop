import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

class DialogService extends StatefulWidget {
  final ServiceDto serviceModel;

  DialogService({this.serviceModel});

  @override
  _DialogServiceState createState() =>
      _DialogServiceState(serviceModel: serviceModel);
}

class _DialogServiceState extends State<DialogService> {
  ProvisionStore serviceStore = ProvisionStore();

  _DialogServiceState({ServiceDto serviceModel})
      : serviceStore = ProvisionStore(serviceModel: serviceModel);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => serviceStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });

    disposer =
        reaction((_) => serviceStore.excludedFail, (excludedFail) async {
          if (excludedFail) {
            showDialog(
                context: context, builder: (context) => buildAlertDialogError());
            await Future.delayed(Duration(seconds: 2));
            Navigator.of(context).pop();
          }
        });
    disposer =
        reaction((_) => serviceStore.excluedBlock, (excludeBlock) async {
          if (excludeBlock) {
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
        return serviceStore.sending
            ? AlertDialogSending()
            : AlertDialog(
                title: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                ),
                content: Text(
                  'Serviço: ${widget.serviceModel.description}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: serviceStore.excludePressed,
                    child: Text(
                      'Sim',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    textColor: Colors.red,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Não'),
                    textColor: Colors.blueGrey,
                  ),
                ],
                elevation: 24.0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
      },
    );
  }
}
