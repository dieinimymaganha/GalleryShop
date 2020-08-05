import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_type_employee.dart';
import 'package:galleryshop/models/type_employee_model.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  @override
  _CreateNewEmployeeScreenState createState() =>
      _CreateNewEmployeeScreenState();
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {
  final TypeEmployeeWebClient _webClient = TypeEmployeeWebClient();

  List<dynamic> dataTypeEmployee = List();

  bool switchval = false;

  void getLista() async {
    dataTypeEmployee = await _webClient.findAll();
    teste();
  }

  void teste() {
    for (TypeEmployeeModel typeEmployeeModel in dataTypeEmployee) {
      typeEmployeeModel.select = false;
    }
    print('Lista >>>>> ${dataTypeEmployee[0]}');
  }

  @override
  void initState() {
    super.initState();
    getLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar novo funcionário',
        ),
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
                    mandatory: true,
                    tip: 'Digite o Nome',
                    label: 'Nome',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o Sobrenome',
                    label: 'Sobrenome',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o Apelido',
                    label: 'Apelido',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite a Data de nascimento',
                    label: 'Data nascimento',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o telefone',
                    label: 'Telefone',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o RG',
                    label: 'RG',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite a taxa de comissão',
                    label: 'Comissão',
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: space),
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                    'Selecione as funções:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Column(
                    children: dataTypeEmployee.map((typeEm) {
                      return Column(
                        children: <Widget>[
                          SwitchListTile(
                            value: typeEm.select,
                            key: Key(typeEm.description),
                            onChanged: (_) {
                              setState(() {
                                typeEm.select = !typeEm.select;
                              });
                            },
                            title: Text(typeEm.description.toString()),
                            selected: typeEm.select,
                            secondary: Icon(Icons.account_circle),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.black,
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
                              child:Icon(Icons.send),
                              height: 28,
                              width: 28,
                            ),
                          )
                        ],
                      ),
                      onPressed: (){}
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
}
