import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/models/product.dart';
import 'package:galleryshop/screens/bar_shop/bar_shop_list_screen.dart';
import 'package:galleryshop/stores/bar_shop_store.dart';
import 'package:galleryshop/widgets/alert_dialog_sending.dart';
import 'package:galleryshop/widgets/dialogs.dart';
import 'package:mobx/mobx.dart';

class DialogProduct extends StatefulWidget {
  final ProductDto productDto;

  DialogProduct({this.productDto});

  @override
  _DialogProductState createState() =>
      _DialogProductState(productDto: productDto);
}

class _DialogProductState extends State<DialogProduct> {
  BarShopStore barShopStore = BarShopStore();

  _DialogProductState({ProductDto productDto})
      : barShopStore = BarShopStore(productDto: productDto);

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => barShopStore.excluded, (exluded) async {
      if (exluded) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogOK());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BarShopListScreen()));
      }
    });

    disposer = reaction((_) => barShopStore.excludedFail, (excludedFail) async {
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
        return barShopStore.sending
            ? AlertDialogSending()
            : AlertDialog(
                title: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                ),
                content:
                    Text('Produto ${barShopStore.productDto.description} ?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: barShopStore.excludedPressed,
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
      },
    );
  }
}
