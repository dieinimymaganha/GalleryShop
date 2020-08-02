import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:mobx/mobx.dart';

class DialogService extends StatefulWidget {
  final ServiceModel serviceModel;

  DialogService({this.serviceModel});

  @override
  _DialogServiceState createState() =>
      _DialogServiceState(serviceModel: serviceModel);
}

class _DialogServiceState extends State<DialogService> {
  ProvisionStore serviceStore = ProvisionStore();

  _DialogServiceState({ServiceModel serviceModel})
      : serviceStore = ProvisionStore(serviceModel: serviceModel);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => serviceStore.excluded, (excluded) {
      if (excluded) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BaseScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
  }
}
