import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/screens/employees/type_employees_list_screen.dart';
import 'package:galleryshop/stores/type_employee_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/custom_alert_dialog.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

class EditTypeEmployeeDialog extends StatefulWidget {
  final TypeEmployeeDto typeEmployeeModel;

  EditTypeEmployeeDialog({this.typeEmployeeModel});

  @override
  _EditTypeEmployeeDialogState createState() =>
      _EditTypeEmployeeDialogState(typeEmployeeModel: typeEmployeeModel);
}

class _EditTypeEmployeeDialogState extends State<EditTypeEmployeeDialog> {
  TypeEmployeeStore typeEmployeeStore;

  _EditTypeEmployeeDialogState({TypeEmployeeDto typeEmployeeModel})
      : typeEmployeeStore =
            TypeEmployeeStore(typeEmployeeModel: typeEmployeeModel);

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    typeEmployeeStore.setDescriptionInit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => typeEmployeeStore.created, (created) async {
      if (created) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogCreated());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TypeEmployeeListScreen()));
      }
    });
    disposer = reaction((_) => typeEmployeeStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TypeEmployeeListScreen()));
      }
    });

    disposer =
        reaction((_) => typeEmployeeStore.errorSending, (errorSending) async {
          if (errorSending) {
            showDialog(
                context: context, builder: (context) => buildAlertDialogErrorSending());
            await Future.delayed(Duration(seconds: 2));
            Navigator.of(context).pop();
          }
        });

    disposer =
        reaction((_) => typeEmployeeStore.excludedFail, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogError());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });
    disposer =
        reaction((_) => typeEmployeeStore.excluedBlock, (excludeBlock) async {
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
        return typeEmployeeStore.sending
            ? AlertDialogSending()
            : Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomForm(
                          controller:
                              typeEmployeeStore.controllerFieldDescription,
                          obscure: false,
                          onChanged: typeEmployeeStore.setDescription,
                          tip: 'Digite a descrição',
                          label: 'Tipo Funcinário',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              child: Text('Excluir'),
                              textColor: Colors.red,
                              onPressed: typeEmployeeStore.buttonExcludePressed,
                            ),
                            FlatButton(
                              child: Text(typeEmployeeStore.change
                                  ? 'Alterar'
                                  : 'Salvar'),
                              textColor: Colors.blue,
                              onPressed: typeEmployeeStore.change
                                  ? typeEmployeeStore.buttomChangePressed
                                  : typeEmployeeStore.buttomSavePressed,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
      },
    );
  }
  CustomAlertDialog buildAlertDialogCreated() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.done,
        color: Colors.white,
      ),
      message: typeEmployeeStore.change
          ? 'Alterado com sucesso'
          : 'Salvo com sucesso!',
      color: Colors.blueAccent,
    );
  }

  CustomAlertDialog buildAlertDialogErrorSending() {
    return CustomAlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      message: typeEmployeeStore.change
          ? 'Erro ao alterar!'
          : 'Erro ao salvar!',
      color: Colors.redAccent,
    );
  }

}
