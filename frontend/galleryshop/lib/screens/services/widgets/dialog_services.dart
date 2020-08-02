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

    disposer = reaction((_) => serviceStore.excluded, (excluded){
      if(excluded){
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BaseScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Excluir o serviço?',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.serviceModel.description,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: serviceStore.excludePressed,
                    child: Text('Excluir'),
                    textColor: Colors.red,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Cancelar'),
                    textColor: Colors.blueGrey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
