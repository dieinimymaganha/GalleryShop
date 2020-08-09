import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/employee_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    employeeStore.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        controller: employeeStore.controllerFieldName,
                        mandatory: true,
                        tip: 'Digite o Nome',
                        label: 'Nome',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setName,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        controller: employeeStore.controllerFieldLastName,
                        mandatory: true,
                        tip: 'Digite o Sobrenome',
                        label: 'Sobrenome',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setLastName,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        controller: employeeStore.controllerFieldNickName,
                        mandatory: true,
                        tip: 'Digite o Apelido',
                        label: 'Apelido',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setNickName,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        icon: Icon(Icons.event),
                        controller: employeeStore.controllerFieldBirthDate,
                        mandatory: true,
                        tip: 'Digite a Data de nascimento',
                        label: 'Data nascimento',
                        textInputType: TextInputType.text,
                        obscure: false,
                        ontap: () {
                          changeAlterBirthDate();
                        },
                        onChanged: employeeStore.setBirthDate,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        maxlengthField: 16,
                        controller: employeeStore.controllerFieldPhoneNumber,
                        icon: Icon(Icons.phone),
                        mandatory: true,
                        tip: '(000) 00000-0000',
                        label: 'Telefone',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setPhoneNumber,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        controller: employeeStore.controllerFieldRg,
                        mandatory: true,
                        tip: 'Digite o RG',
                        label: 'Incluir ponto e dígito "00.000.000-0"',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setRg,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        maxlengthField: 14,
                        controller: employeeStore.controllerFieldCpf,
                        mandatory: true,
                        tip: 'Digite o CPF',
                        label: '000.000.000-00',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setCpf,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        controller: employeeStore.controllerFieldComissionRate,
                        mandatory: true,
                        tip: 'Digite a taxa de comissão',
                        label: 'Comissão',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setComissionRate,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          } else if (value.isNotEmpty) {
                            try {
                              int.parse(value);
                            } on Exception catch (_) {
                              return 'Somente números, sem dígitos';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: space),
                      Text(
                        'Selecione as funções:',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: space),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            employeeStore.loadingTypeEmployee
                                ? Column(
                                    children: employeeStore.dataTypeEmployee
                                        .map((typeEm) {
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
                                            title: Text(
                                                typeEm.description.toString()),
                                            selected: typeEm.select,
                                            secondary:
                                                Icon(Icons.account_circle),
                                          )
                                        ],
                                      );
                                    }).toList(),
                                  )
                                : CircularProgressIndicator(),
                          ],
                        ),
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
                                        child: Icon(Icons.send),
                                        height: 28,
                                        width: 28,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: employeeStore.buttonSavePressed)),
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

  void changeAlterBirthDate() {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        maxDateTime: DateTime.now(),
        dateFormat: 'dd/MM/yyyy', onConfirm: (dateTime, selectedIndex) {
      String birthDate = DateFormat('dd/MM/yyyy').format(dateTime);
      employeeStore.setBirthDateController(birthDate);
      employeeStore.setBirthDate(birthDate);
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
