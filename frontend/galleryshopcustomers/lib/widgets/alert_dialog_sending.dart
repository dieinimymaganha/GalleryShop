import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

class AlertDialogSending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: AlertDialog(
        backgroundColor: colorAppbar,
        content: LinearProgressIndicator(
          backgroundColor: Colors.white10,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
      ),
    );
  }
}
