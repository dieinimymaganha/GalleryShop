import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:galleryshop/widgets/custom_button.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

const _labelFieldDescription = 'Descrição';
const _tipFieldDescription = 'Digite o nome do serviço';

const _labelFieldValue = 'Valor';
const _tipFieldValue = 'Digite o valor';

final double _space = 10.0;

class CreateNewServiceScreen extends StatefulWidget {
  @override
  _CreateNewServiceScreenState createState() => _CreateNewServiceScreenState();
}

class _CreateNewServiceScreenState extends State<CreateNewServiceScreen> {
  ProvisionStore serviceStore = ProvisionStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    serviceStore.getServices();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => serviceStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(

          content: Text('Error ao cadastrar!', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });

    disposer = reaction((_) => serviceStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Serviço cadastrado!', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => BaseScreen()));
    });

    disposer = reaction((_) => serviceStore.duplicate,(duplicate) async{
      if(duplicate){
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Serviço já cadastrado!', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.yellow,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerFieldDescription =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Cadastrar Serviço',
        ),
        centerTitle: true,
        backgroundColor: colorAppbar,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 8,
          right: 8,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomForm(
                    mandatory: true,
                    controller: _controllerFieldDescription,
                    tip: _tipFieldDescription,
                    label: _labelFieldDescription,
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: (value) {
                      serviceStore.setDescription(value);
                    },
                  ),
                  SizedBox(height: _space),
                  Observer(
                    builder: (_) {
                      return CustomFormCoin(
                        mandatory: true,
                        enabled: serviceStore.priceFixed,
                        controller: serviceStore.controllerFieldValue,
                        tip: _tipFieldValue,
                        label: _labelFieldValue,
                        textInputType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          serviceStore.setValuePrice(value);
                        },
                      );
                    },
                  ),
                  SizedBox(height: _space),
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Observer(builder: (_) {
                          return DropdownButton(
                            hint: Text('Tipo de funcionário'),
                            value: serviceStore.valueSelect,
                            items: serviceStore.dataServices.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.description.toString()),
                                value: item.description.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              serviceStore.selectTypeService(value);
                            },
                          );
                        }),
                        Row(
                          children: <Widget>[
                            Text(
                              'Valor fixo',
                              style: TextStyle(fontSize: 16),
                            ),
                            Observer(
                              builder: (_) {
                                return Checkbox(
                                  value: serviceStore.priceFixed,
                                  onChanged: (_) {
                                    serviceStore.alterPriceFixed();
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _space),
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
                    child: SizedBox.expand(child: Observer(
                      builder: (_) {
                        return FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: serviceStore.sending
                                      ? CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.blue),
                                        )
                                      : Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: serviceStore.buttomPressed,
                        );
                      },
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
