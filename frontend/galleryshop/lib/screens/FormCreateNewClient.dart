import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/components/editor.dart';

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
const _labelFieldPhoneNumber = 'Telefone';
const _tipFieldPhoneNumber = '(000) 00000-0000';
const _labelFieldEmail = 'Email';
const _tipFieldEmail = 'Digite o e-mail';

class FormCreateNewClient extends StatefulWidget {
  @override
  _FormCreateNewClientState createState() => _FormCreateNewClientState();
}

class _FormCreateNewClientState extends State<FormCreateNewClient> {
  final TextEditingController _controllerFieldName = TextEditingController();
  final TextEditingController _controllerFieldLastName =
      TextEditingController();
  final TextEditingController _controllerFieldNickname =
      TextEditingController();
  final MaskedTextController _controllerMaskFieldCpf =
      new MaskedTextController(mask: '000.000.000-00');

  final MaskedTextController _controllerMaskFieldPhoneNumber =
      new MaskedTextController(mask: '(000) 00000-0000');
  final MaskedTextController _controllerMaskFieldBirthDate =
      new MaskedTextController(mask: '00/00/0000');
  final TextEditingController _controllerFieldEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldName,
              tip: _tipFieldName,
              label: _labelFieldName,
              textInputType: TextInputType.text,
            ),
            Editor(
              controller: _controllerFieldLastName,
              tip: _tipFieldLastName,
              label: _labelFieldLastName,
              textInputType: TextInputType.text,
            ),
            Editor(
              controller: _controllerFieldNickname,
              tip: _tipFieldNickname,
              label: _labelFieldNickname,
              textInputType: TextInputType.text,
            ),
            Editor(
              controller: _controllerMaskFieldCpf,
              tip: _tipFieldCpf,
              label: _labelFieldCpf,
              textInputType: TextInputType.number,
            ),
            Editor(
              controller: _controllerMaskFieldBirthDate,
              tip: _tipFieldBirhdate,
              label: _labelFieldBirhDate,
              textInputType: TextInputType.number,
            ),
            Editor(
              controller: _controllerMaskFieldPhoneNumber,
              tip: _tipFieldPhoneNumber,
              label: _labelFieldPhoneNumber,
              textInputType: TextInputType.number,
            ),
            Editor(
              controller: _controllerFieldName,
              tip: _tipFieldEmail,
              label: _labelFieldEmail,
              textInputType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {  },
                  child: Text('Cadastrar'),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
