import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
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
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  List<dynamic> _dataProvince = List();

  void getProvince() async {
    final respose = await _webClient.findAll();
    setState(() {
      _dataProvince = respose;
    });
  }

  @override
  void initState() {
    super.initState();
    getProvince();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerFieldDescription =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();
  final TextEditingController _controllerFieldFixedPrice =
      TextEditingController();

  String _valProvince;

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
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    mandatory: true,
                    controller: _controllerFieldValue,
                    tip: _tipFieldValue,
                    label: _labelFieldValue,
                    textInputType: TextInputType.number,
                    obscure: false,
                  ),
                  SizedBox(height: 50),
                  DropdownButton(
                    hint: Text('Selecione o tipo de funcionário'),
                    value: _valProvince,
                    items: _dataProvince.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.description.toString()),
                        value: item.toString(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valProvince = value;
                      });
                    },
                  ),
                  SizedBox(height: 50),
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
