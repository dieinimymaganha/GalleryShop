import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/stores/employee_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/custom_alert_dialog.dart';
import 'package:mobx/mobx.dart';

import '../empleyees_list_screen.dart';

class DialogEmployee extends StatefulWidget {
  final EmployeeDto employeeModel;

  DialogEmployee({this.employeeModel});

  @override
  _DialogEmployeeState createState() =>
      _DialogEmployeeState(employeeModel: employeeModel);
}

class _DialogEmployeeState extends State<DialogEmployee> {
  EmployeeStore employeeStore = EmployeeStore();

  _DialogEmployeeState({EmployeeDto employeeModel})
      : employeeStore = EmployeeStore(employeeModel: employeeModel);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => employeeStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => EmployeesListScreen()));
      }
    });

    disposer =
        reaction((_) => employeeStore.excludedFail, (excludedFail) async {
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
        return employeeStore.sending
            ? AlertDialogSending()
            : buildAlertDialog(context);
      },
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

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Excluir',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        'Funcionário: ${widget.employeeModel.name}',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: employeeStore.buttomExcludePressed,
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
