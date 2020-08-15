import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_coin.dart';
import 'package:mobx/mobx.dart';

const _labelFieldDescription = 'Descrição';
const _tipFieldDescription = 'Digite o nome do serviço';

const _labelFieldValue = 'Valor';
const _tipFieldValue = 'Digite o valor';

final double _space = 10.0;

class CreateNewServiceScreen extends StatefulWidget {
  final ServiceDto serviceModel;

  CreateNewServiceScreen({this.serviceModel});

  @override
  _CreateNewServiceScreenState createState() =>
      _CreateNewServiceScreenState(serviceModel: serviceModel);
}

class _CreateNewServiceScreenState extends State<CreateNewServiceScreen> {
  _CreateNewServiceScreenState({ServiceDto serviceModel})
      : serviceStore = ProvisionStore(serviceModel: serviceModel);

  ProvisionStore serviceStore = ProvisionStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    serviceStore.getServices();
    serviceStore.setDataInitial();
    serviceStore.setChange();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => serviceStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            serviceStore.change ? 'Error ao atualizar' : 'Error ao cadastrar!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });

    disposer = reaction((_) => serviceStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          serviceStore.change ? 'Alterado com sucesso!' : 'Serviço cadastrado!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: serviceStore.change ? Colors.green : Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => BaseScreen()));
    });

    disposer = reaction((_) => serviceStore.duplicate, (duplicate) async {
      if (duplicate) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Serviço já cadastrado!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: serviceStore.change
                ? Text('Editar serviço')
                : Text(
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
                        enabled: !serviceStore.sending,
                        mandatory: true,
                        controller: serviceStore.controllerDescription,
                        tip: _tipFieldDescription,
                        label: _labelFieldDescription,
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: (value) {
                          serviceStore.setDescription(value);
                        },
                      ),
                      SizedBox(height: _space),
                      CustomFormCoin(
                        mandatory: true,
                        enabled: serviceStore.sending ? !serviceStore.sending : serviceStore.priceFixed,
                        controller: serviceStore.controllerFieldValue,
                        tip: _tipFieldValue,
                        label: _labelFieldValue,
                        textInputType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          serviceStore.setValuePrice(value);
                        },
                      ),
                      SizedBox(height: _space),
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            DropdownButton(
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
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Valor fixo',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Checkbox(
                                  value: serviceStore.priceFixed,
                                  onChanged: (_) {
                                    serviceStore.alterPriceFixed();
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
                        child: SizedBox.expand(
                            child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                serviceStore.change ? 'Alterar' : 'Cadastrar',
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
                          onPressed: serviceStore.change
                              ? serviceStore.buttonChangePressed
                              : serviceStore.buttomSavePressed,
                        )),
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
