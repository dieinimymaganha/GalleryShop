import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/employee_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_form_date.dart';
import 'package:intl/intl.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  @override
  _CreateNewEmployeeScreenState createState() =>
      _CreateNewEmployeeScreenState();
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {
  EmployeeStore employeeStore = EmployeeStore();

  TextEditingController _controllerDate = TextEditingController();

  List<dynamic> dataTypeEmployee = List();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    employeeStore.getServices();
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
                    onChanged: employeeStore.setName,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o Sobrenome',
                    label: 'Sobrenome',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setLastName,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o Apelido',
                    label: 'Apelido',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setNickName,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    controller: _controllerDate,
                    mandatory: true,
                    tip: 'Digite a Data de nascimento',
                    label: 'Data nascimento',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setBirthDate,
                    ontap: () {
                      select();
                    },
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o telefone',
                    label: 'Telefone',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setPhoneNumber,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o RG',
                    label: 'RG',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setRg,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite o CPF',
                    label: 'CPF',
                    textInputType: TextInputType.text,
                    obscure: false,
                    onChanged: employeeStore.setCpf,
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    tip: 'Digite a taxa de comissão',
                    label: 'Comissão',
                    textInputType: TextInputType.number,
                    obscure: false,
                    onChanged: employeeStore.setComissionRate,
                  ),
                  SizedBox(height: space),
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                    'Selecione as funções:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Observer(
                    builder: (_) {
                      return employeeStore.loadingTypeEmployee
                          ? Column(
                              children:
                                  employeeStore.dataTypeEmployee.map((typeEm) {
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
                                      title:
                                          Text(typeEm.description.toString()),
                                      selected: typeEm.select,
                                      secondary: Icon(Icons.account_circle),
                                    )
                                  ],
                                );
                              }).toList(),
                            )
                          : CircularProgressIndicator();
                    },
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
                                    child: Icon(Icons.send),
                                    height: 28,
                                    width: 28,
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {
                              print(employeeStore.dataTypeEmployee);
                            })),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void select() {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        dateFormat: 'dd/MM/yyyy', onConfirm: (dateTime, selectedIndex) {
      setState(() {
        _controllerDate.text = DateFormat('dd/MM/yyyy').format(dateTime);
      });
    },
        pickerTheme: DateTimePickerTheme(
          backgroundColor: colorAppbar,
          itemTextStyle: TextStyle(color: Colors.white),
          showTitle: true,
          cancel: Text(
            'Cancelar',
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
          ),
          confirm: Text(
            'Confirmar',
            style: TextStyle(color: Colors.blueAccent, fontSize: 18),
          ),
        ));
  }
}
