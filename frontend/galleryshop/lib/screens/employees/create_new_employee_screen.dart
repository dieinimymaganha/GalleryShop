import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/validators.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/employee.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/employees/empleyees_list_screen.dart';
import 'package:galleryshop/screens/my_account/my_account_base_screen.dart';
import 'package:galleryshop/stores/employee_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class CreateNewEmployeeScreen extends StatefulWidget {
  final EmployeeDto employeeModel;
  final bool editMyAccount;

  CreateNewEmployeeScreen({this.employeeModel, this.editMyAccount});

  @override
  _CreateNewEmployeeScreenState createState() => _CreateNewEmployeeScreenState(
      employeeModel: employeeModel, editMyAccount: editMyAccount);
}

class _CreateNewEmployeeScreenState extends State<CreateNewEmployeeScreen> {
  _CreateNewEmployeeScreenState({EmployeeDto employeeModel, bool editMyAccount})
      : employeeStore = EmployeeStore(
            employeeModel: employeeModel, editMyAccount: editMyAccount);

  EmployeeStore employeeStore = EmployeeStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    employeeStore.getServices();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => employeeStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            employeeStore.change
                ? 'Error ao atualizar'
                : 'Error ao cadastrar! Verifique os campos',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });

    disposer = reaction((_) => employeeStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          employeeStore.change
              ? 'Funcionário alterado com sucesso!'
              : 'Funcionário cadastrado  com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      employeeStore.editMyAccount ? Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BaseScreen())) :
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => EmployeesListScreen()));
    });
    disposer = reaction((_) => employeeStore.duplicate, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Funcionário já cadastrado!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: employeeStore.change
                ? Text(
                    'Alterar funcionário',
                  )
                : Text(
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
                  autovalidate: employeeStore.fieldIsValid,
                  key: employeeStore.formState,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        enabled: !employeeStore.sending,
                        controller: employeeStore.controllerFieldName,
                        mandatory: true,
                        tip: 'Digite o Nome',
                        label: 'Nome',
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: employeeStore.setName,
                        validator: (value) {
                          return validatorName(value);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !employeeStore.sending,
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
                        enabled: !employeeStore.sending,
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
                        enabled: !employeeStore.sending,
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
                        validator: (value) {
                          return validatorBirthDate(value);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !employeeStore.sending,
                        maxlengthField: 16,
                        controller: employeeStore.controllerFieldPhoneNumber,
                        icon: Icon(Icons.phone),
                        mandatory: true,
                        tip: '(000) 00000-0000',
                        label: 'Celular',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setPhoneNumber,
                        validator: (value) {
                          return validatorPhoneNumber(value);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !employeeStore.sending,
                        controller: employeeStore.controllerFieldRg,
                        mandatory: true,
                        tip: 'Incluir ponto e dígito "00.000.000-0"',
                        label: 'RG',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setRg,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !employeeStore.sending,
                        maxlengthField: 14,
                        controller: employeeStore.controllerFieldCpf,
                        mandatory: true,
                        tip: '000.000.000-00',
                        label: 'CPF',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setCpf,
                        validator: (value) {
                          return validatorCpf(value);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !employeeStore.sending,
                        icon: Icon(Icons.attach_money),
                        controller: employeeStore.controllerFieldComissionRate,
                        mandatory: true,
                        tip: 'Digite a taxa de comissão',
                        label: 'Porcentagem de Comissão',
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: employeeStore.setComissionRate,
                        validator: (value) {
                          return validatorComissionRate(value);
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
                        color: colorCard,
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
                                      employeeStore.change
                                          ? 'Alterar'
                                          : 'Cadastrar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child: employeeStore.sending
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
                                onPressed: employeeStore.change
                                    ? employeeStore.buttonChangePressed
                                    : employeeStore.buttonSavePressed)),
                      ),
                      SizedBox(height: 20),
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
          pickerHeight: 110.0,
          itemTextStyle: TextStyle(color: Colors.black87),
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
