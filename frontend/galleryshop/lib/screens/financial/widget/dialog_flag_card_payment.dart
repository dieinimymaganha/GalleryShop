import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/FlagCardPayment.dart';
import 'package:galleryshop/screens/financial/flag_card_payment_list_screen.dart';
import 'package:galleryshop/stores/financial_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

class DialogFlagCardPayment extends StatefulWidget {
  final FlagCardPaymentDto flagCardPaymentDto;

  DialogFlagCardPayment({this.flagCardPaymentDto});

  @override
  _DialogFlagCardPaymentState createState() =>
      _DialogFlagCardPaymentState(flagCardPaymentDto: flagCardPaymentDto);
}

class _DialogFlagCardPaymentState extends State<DialogFlagCardPayment> {
  FinancialStore financialStore = FinancialStore();

  _DialogFlagCardPaymentState({FlagCardPaymentDto flagCardPaymentDto})
      : financialStore = FinancialStore(flagCardPaymentDto: flagCardPaymentDto);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => financialStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => FlagCardPaymentListScreen()));
      }
    });

    disposer =
        reaction((_) => financialStore.excludedFail, (excludedFail) async {
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
        return financialStore.sending
            ? AlertDialogSending()
            : buildAlertDialog(context);
      },
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Excluir',
        style: TextStyle(color: Colors.red),
      ),
      content:
          Text('Cartão : ${financialStore.flagCardPaymentDto.description}'),
      actions: <Widget>[
        FlatButton(
          onPressed: financialStore.buttonExcludePressed,
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
