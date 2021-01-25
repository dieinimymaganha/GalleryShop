import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/bar_shop_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

class CreateNewProductScreen extends StatefulWidget {
  @override
  _CreateNewProductScreenState createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends State<CreateNewProductScreen> {
  BarShopStore barShopStore = BarShopStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => barShopStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Produto cadastrado com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BaseScreen()));
    });

    disposer = reaction((_) => barShopStore.duplicate, (created) async {
      if (created) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Produto já cadastrado!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 2),
        ));
      }
      await Future.delayed(Duration(seconds: 2));
    });

    disposer = reaction((_) => barShopStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Erro ao cadastrar! Tente novamente',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Cadastrar produto'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: ListView(
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        controller: barShopStore.controllerFieldDescription,
                        mandatory: true,
                        enabled: !barShopStore.sending,
                        obscure: false,
                        tip: 'Descrição',
                        label: 'Descrição',
                        onChanged: barShopStore.setDescription,
                      ),
                      SizedBox(
                        height: space,
                      ),
                      CustomFormCoin(
                        enabled: !barShopStore.sending,
                        controller: barShopStore.controllerFieldValue,
                        mandatory: true,
                        label: 'Valor',
                        tip: 'Valor',
                        icon: Icon(Icons.monetization_on),
                        onChanged: barShopStore.setValue,
                        textInputType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                      SizedBox(height: space),
                      Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Color(0XFF212121),
                              Color(0XFF616161),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: SizedBox.expand(
                            child: FlatButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Cadastrar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child: barShopStore.sending
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        Colors.blue),
                                              )
                                            : Icon(Icons.send),
                                        height: 28,
                                        width: 28,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: barShopStore.buttonSavePressed)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
