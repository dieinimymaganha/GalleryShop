import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/components/editor.dart';

const _titleAppBar = 'Cadastrar Cliente';
const _labelFieldName = 'Nome';
const _tipFieldName = 'Digite o nome';
const _labelFieldLastName = 'Sobrenome';
const _tipFieldLastName = 'Digite o Sobrenome';
const _labelFieldNickname = 'Apelido';
const _tipFieldNickname = 'Digite o apelido';
const _labelFieldCpf = 'CPF';
const _tipFieldCpf = '   .   .   -  ';


class FormCreateNewClient extends StatefulWidget {
  @override
  _FormCreateNewClientState createState() => _FormCreateNewClientState();
}

class _FormCreateNewClientState extends State<FormCreateNewClient> {
  final TextEditingController _controllerFieldName = TextEditingController();
  final TextEditingController _controllerFieldLastName = TextEditingController();
  final TextEditingController _controllerFieldNickname = TextEditingController();
  final TextEditingController _controllerFieldCpf = TextEditingController();

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
              controller: _controllerFieldCpf,
              tip: _tipFieldCpf,
              label: _labelFieldCpf,
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
