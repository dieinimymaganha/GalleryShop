import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_client.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/widgets/custom_form.dart';

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
const _passwordDefault = 'galleryshop';

class CreateNewUserClientScreen extends StatefulWidget {
  @override
  _CreateNewUserClientScreenState createState() => _CreateNewUserClientScreenState();
}

class _CreateNewUserClientScreenState extends State<CreateNewUserClientScreen> {
  final ClientWebClient _webClient = ClientWebClient();

  final _formKey = GlobalKey<FormState>();

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

  final double _space = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomForm(
                    mandatory: false,
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
                          if (_formKey.currentState.validate()) {
                            final String name = _controllerFieldName.text;
                            final String lastName =
                                _controllerFieldLastName.text;
                            final String nickname =
                                _controllerFieldNickname.text;
                            final String cpf = _controllerMaskFieldCpf.text;
                            final String phoneNumber =
                                _controllerMaskFieldPhoneNumber.text;
                            final String birthdate =
                                _controllerMaskFieldBirthDate.text;
                            final newB = birthdate.split('/');
                            final String new_birthDate =
                                newB[2] + '-' + newB[1] + '-' + newB[0];

                            final String email = _controllerFieldEmail.text;
                            final String password = _passwordDefault;

                            final listProfiles = new List<ListProfiles>();
                            final String role = 'ROLE_CLIENT';
                            listProfiles.add(new ListProfiles(role: role));

                            final clientCreated = ClientModelForm(
                                name,
                                lastName,
                                nickname,
                                cpf,
                                new_birthDate,
                                phoneNumber,
                                email,
                                password,
                                listProfiles);

                            _save(clientCreated, context);
                          }
                          return null;
                        },
                      ),
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
  }

  void _save(ClientModelForm clientCreated, BuildContext context) async {
    ClientModelDto clientModelDto = await _send(clientCreated, context);
    print('Novo cliente :' + clientModelDto.toString());
    if (clientModelDto != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BaseScreen(),
          ));
    }
  }

  Future<ClientModelDto> _send(
      ClientModelForm clientCreated, BuildContext context) async {
    final ClientModelDto clientModelDto =
        await _webClient.save(clientCreated).catchError((e) {
      debugPrint(e);
    });
    return clientModelDto;
  }
}