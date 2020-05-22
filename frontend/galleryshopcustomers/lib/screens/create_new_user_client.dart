import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshopcustomers/components/custom_button.dart';
import 'package:galleryshopcustomers/components/custom_form.dart';

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
const _labelFieldPassword = 'Senha';


final TextEditingController _controllerFieldName = TextEditingController();
final TextEditingController _controllerFieldLastName = TextEditingController();
final TextEditingController _controllerFieldNickname = TextEditingController();
final MaskedTextController _controllerMaskFieldCpf =
    new MaskedTextController(mask: '000.000.000-00');

final MaskedTextController _controllerMaskFieldPhoneNumber =
    new MaskedTextController(mask: '(000) 00000-0000');
final MaskedTextController _controllerMaskFieldBirthDate =
    new MaskedTextController(mask: '00/00/0000');
final TextEditingController _controllerFieldEmail = TextEditingController();

final TextEditingController _controllerPassword = TextEditingController();

final double _space = 10.0;

class CreateNewUserClient extends StatelessWidget {
  final TextEditingController _controllerFieldName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titleAppBar,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black38),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  CustomForm(
                    controller: _controllerFieldName,
                    tip: _tipFieldName,
                    label: _labelFieldName,
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerFieldLastName,
                    tip: _tipFieldLastName,
                    label: _labelFieldLastName,
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerFieldNickname,
                    tip: _tipFieldNickname,
                    label: _labelFieldNickname,
                    textInputType: TextInputType.text,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerMaskFieldCpf,
                    tip: _tipFieldCpf,
                    label: _labelFieldCpf,
                    textInputType: TextInputType.number,
                    obscure: false,
                  ),
                  SizedBox(height: 10),
                  CustomForm(
                    controller: _controllerMaskFieldBirthDate,
                    tip: _tipFieldBirhdate,
                    label: _labelFieldBirhDate,
                    textInputType: TextInputType.number,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerMaskFieldPhoneNumber,
                    tip: _tipFieldPhoneNumber,
                    label: _labelFieldPhoneNumber,
                    textInputType: TextInputType.number,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerFieldEmail,
                    tip: _tipFieldEmail,
                    label: _labelFieldEmail,
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    controller: _controllerPassword,
                    label: _labelFieldPassword,
                    obscure: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    name_button: 'Cadastrar',
                    icon: Icons.send,
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
  }
}
