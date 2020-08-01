import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:galleryshop/widgets/custom_button.dart';
import 'package:galleryshop/widgets/custom_form.dart';

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

  @override
  void initState() {
    super.initState();
    serviceStore.getServices();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerFieldDescription =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  CustomForm(
                    mandatory: true,
                    controller: serviceStore.controllerFieldValue,
                    tip: _tipFieldValue,
                    label: _labelFieldValue,
                    textInputType: TextInputType.number,
                    obscure: false,
                    onChanged: (value){
                      serviceStore.setValuePrice(value);
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
                                value: item.toString(),
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
                  CustomButton(
                    icon: Icons.send,
                    name_button: 'Cadastrar',
                    onConfirm: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
