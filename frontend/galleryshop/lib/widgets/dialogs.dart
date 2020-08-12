import 'package:flutter/material.dart';

import 'custom_alert_dialog.dart';

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

CustomAlertDialog buildAlertDialogBlock(){
  return CustomAlertDialog(
    icon: Icon(Icons.message, color: Colors.white,),
    message: 'Não é possivel excluir',
    color: Colors.deepOrange,
  );
}

