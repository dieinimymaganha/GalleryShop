import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/data/validators.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/base/base_screen.dart';
import 'package:galleryshopcustomers/stores/client_store.dart';
import 'package:galleryshopcustomers/widgets/custom_form.dart';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

const _titleAppBar = 'Cadastrar Cliente';
const _labelFieldName = 'Nome';
const _tipFieldName = 'Digite o nome';
const _labelFieldLastName = 'Sobrenome';
const _tipFieldLastName = 'Digite o Sobrenome';
const _labelFieldNickname = 'Apelido';
const _tipFieldNickname = 'Digite o apelido';
const _labelFieldCpf = 'CPF';
const _tipFieldCpf = '000.000.000-00';
const _labelFieldBirhDate = 'Data Nascimento';
const _tipFieldBirhdate = '00/00/0000';
const _labelFieldPhoneNumber = 'Celular';
const _tipFieldPhoneNumber = '(000) 00000-0000';
const _labelFieldEmail = 'Email';
const _tipFieldEmail = 'Digite o e-mail';

class CreateNewUserClientScreen extends StatefulWidget {
  @override
  _CreateNewUserClientScreenState createState() =>
      _CreateNewUserClientScreenState();
}

class _CreateNewUserClientScreenState extends State<CreateNewUserClientScreen> {
  ClientStore clientStore = ClientStore();

  final double _space = 10.0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => clientStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Error ao cadastrar! Verifique os campos',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
      }
    });

    disposer = reaction((_) => clientStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Cliente cadastrado  com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BaseScreen()));
    });
    disposer = reaction((_) => clientStore.duplicate, (created) async {
      if (created) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Cliente já cadastrado!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 2),
        ));
      }
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
            title: Text(
              _titleAppBar,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            elevation: 10,
            backgroundColor: colorAppbar,
            leading: IconButton(
              icon: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
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
                  autovalidate: clientStore.fieldIsValid,
                  key: clientStore.formState,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        enabled: !clientStore.sending,
                        mandatory: false,
                        controller: clientStore.controllerFieldName,
                        tip: _tipFieldName,
                        label: _labelFieldName,
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: clientStore.setName,
                      ),
                      SizedBox(height: _space),
                      CustomForm(
                        enabled: !clientStore.sending,
                        controller: clientStore.controllerFieldLastName,
                        tip: _tipFieldLastName,
                        label: _labelFieldLastName,
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: clientStore.setLastName,
                      ),
                      SizedBox(height: _space),
                      CustomForm(
                        enabled: !clientStore.sending,
                        controller: clientStore.controllerFieldNickName,
                        tip: _tipFieldNickname,
                        label: _labelFieldNickname,
                        textInputType: TextInputType.text,
                        obscure: false,
                        onChanged: clientStore.setNickName,
                      ),
                      SizedBox(height: _space),
                      CustomForm(
                        enabled: !clientStore.sending,
                        maxlengthField: 14,
                        controller: clientStore.controllerFieldCpf,
                        tip: _tipFieldCpf,
                        label: _labelFieldCpf,
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: clientStore.setCpf,
                        validator: (value) {
                          return validatorCpf(value);
                        },
                      ),
                      SizedBox(height: 10),
                      CustomForm(
                        enabled: !clientStore.sending,
                        controller: clientStore.controllerFieldBirthDate,
                        tip: _tipFieldBirhdate,
                        label: _labelFieldBirhDate,
                        textInputType: TextInputType.number,
                        obscure: false,
                        ontap: () {
                          changeAlterBirthDate();
                        },
                        onChanged: clientStore.setBirthDate,
                        validator: (value) {
                          return validatorBirthDate(value);
                        },
                      ),
                      SizedBox(height: _space),
                      CustomForm(
                        enabled: !clientStore.sending,
                        maxlengthField: 16,
                        controller: clientStore.controllerFieldPhoneNumber,
                        tip: _tipFieldPhoneNumber,
                        label: _labelFieldPhoneNumber,
                        textInputType: TextInputType.number,
                        obscure: false,
                        onChanged: clientStore.setPhoneNumber,
                        validator: (value) {
                          return validatorPhoneNumber(value);
                        },
                      ),
                      SizedBox(height: _space),
                      CustomForm(
                        enabled: !clientStore.sending,
                        controller: clientStore.controllerFieldEmail,
                        tip: _tipFieldEmail,
                        label: _labelFieldEmail,
                        textInputType: TextInputType.emailAddress,
                        obscure: false,
                        onChanged: clientStore.setEmail,
                        validator: (value) {
                          return validatorEmail(value);
                        },
                      ),
                      SizedBox(height: _space),
                      SizedBox(
                        height: 20,
                      ),
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
                                      child: clientStore.sending
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
                              onPressed: clientStore.buttomSavePressed),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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

  void changeAlterBirthDate() {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        maxDateTime: DateTime.now(),
        dateFormat: 'dd/MM/yyyy', onConfirm: (dateTime, selectedIndex) {
      String birthDate = DateFormat('dd/MM/yyyy').format(dateTime);
      clientStore.setBirthDateController(birthDate);
      clientStore.setBirthDate(birthDate);
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
