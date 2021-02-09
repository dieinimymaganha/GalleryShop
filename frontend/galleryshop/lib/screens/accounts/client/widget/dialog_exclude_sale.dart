import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/sale.dart';
import 'package:galleryshop/screens/accounts/client/consult_sales_account_client.dart';
import 'package:galleryshop/stores/sale_product_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

class DialogExcludeSale extends StatefulWidget {
  final SaleDto saleDto;
  final int idClient;
  final int idEmployee;

  DialogExcludeSale({this.saleDto, this.idClient, this.idEmployee});

  @override
  _DialogExcludeSaleState createState() => _DialogExcludeSaleState(
      saleDto: saleDto, idClient: idClient, idEmployee: idEmployee);
}

class _DialogExcludeSaleState extends State<DialogExcludeSale> {
  SaleProductStore saleProductStore = SaleProductStore();

  _DialogExcludeSaleState({SaleDto saleDto, int idClient, int idEmployee})
      : saleProductStore = SaleProductStore(
            saleDto: saleDto, idClient: idClient, idEmployee: idEmployee);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => saleProductStore.excluded, (exluded) async {
      print('Verificando idEmployee ${saleProductStore.idEmployee}');
      print('Verificando idClient ${saleProductStore.idClient}');
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        saleProductStore.accountClientProcess
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ConsultSalesAccountClient(
                      idClient: saleProductStore.idClient,
                    )))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ConsultSalesAccountClient(
                      idEmployee: saleProductStore.idEmployee,
                    )));
      }
    });

    disposer =
        reaction((_) => saleProductStore.excludedFail, (excludedFail) async {
      if (excludedFail) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogError());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });

    disposer = reaction((_) => saleProductStore.excludedUnauthorized,
        (excludedUnauthorized) async {
      if (excludedUnauthorized) {
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
        return saleProductStore.sending
            ? AlertDialogSending()
            : AlertDialog(
                title: Text('Excluir venda'),
                content:
                    Text(saleProductStore.saleDto.productSoldDto.description),
                actions: <Widget>[
                  FlatButton(
                      onPressed: saleProductStore.buttonExcludePressed,
                      child: Text(
                        'Sim',
                        style: TextStyle(color: Colors.redAccent),
                      )),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              );
      },
    );
  }
}
