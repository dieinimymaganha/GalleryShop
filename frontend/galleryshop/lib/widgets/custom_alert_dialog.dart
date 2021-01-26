import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {

  final Icon icon;
  final String message;
  final Color color;


  CustomAlertDialog({this.icon, this.message, this.color});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: AlertDialog(
        content: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                Text(
                  message,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
      ),
    );
  }
}
