import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/stores/type_employee_store.dart';

class EditTypeEmployeeDialog extends StatefulWidget {
  final TypeEmployeeModel typeEmployeeModel;

  EditTypeEmployeeDialog({this.typeEmployeeModel});

  @override
  _EditTypeEmployeeDialogState createState() =>
      _EditTypeEmployeeDialogState(typeEmployeeModel: typeEmployeeModel);
}

class _EditTypeEmployeeDialogState extends State<EditTypeEmployeeDialog> {
  TypeEmployeeStore typeEmployeeStore;

  final TextEditingController _controller;


  _EditTypeEmployeeDialogState({TypeEmployeeModel typeEmployeeModel})
      : typeEmployeeStore =
            TypeEmployeeStore(typeEmployeeModel: typeEmployeeModel),
        _controller = TextEditingController(
            text: typeEmployeeModel != null
                ? typeEmployeeModel.description.toString()
                : '');
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Observer(builder: (_) {
            return TextField(
              controller:
                  typeEmployeeStore.setControllerDescription(_controller),
              onChanged: typeEmployeeStore.setDescription,
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Observer(builder: (_){
                return FlatButton(
                  child: Text('Excluir'),
                  textColor: Colors.red,
                  onPressed: typeEmployeeStore.excludePressed,
                );
              },),
              Observer(builder: (_){
                return FlatButton(
                  child: Text('Salvar'),
                  textColor: Colors.blue,
                  onPressed: typeEmployeeStore.savePressed,
                );
              },)
            ],
          ),
        ],
      ),
    ));
  }
}
