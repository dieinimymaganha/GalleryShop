import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/bar_shop/widget/button_create_new_product.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/bar_shop_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';

import 'widget/dialog_product.dart';

class BarShopListScreen extends StatefulWidget {
  @override
  _BarShopListScreenState createState() => _BarShopListScreenState();
}

class _BarShopListScreenState extends State<BarShopListScreen> {
  BarShopStore barShopStore = BarShopStore();

  @override
  void initState() {
    super.initState();
    barShopStore.setListProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de produtos'),
        centerTitle: true,
        backgroundColor: colorAppbar,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BaseScreen()));
            },
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          return barShopStore.errorList
              ? Container(
                  child: barShopStore.listEmpty
                      ? CenteredMessage(
                          'Não á produtos cadastrados',
                          icon: Icons.description,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text(
                                  'Falha ao carregar',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FlatButton(
                                  child: Text('Clique para recarregar!'),
                                  onPressed: barShopStore.reloadList),
                            ],
                          ),
                        ))
              : ListView(
                  children: barShopStore.listProducts.map((productDto) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  DialogProduct(productDto: productDto));
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: colorCard,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 10.0,
                                          bottom: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            productDto.description,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'R\$: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0),
                                              ),
                                              Text(
                                                convertMonetary(
                                                    productDto.value),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
        },
      ),
      floatingActionButton: ButtonCreateNewProduct(),
    );
  }
}
