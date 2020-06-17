import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/http/webclients/webclient_login.dart';
import 'package:galleryshop/models/login.dart';
import 'package:galleryshop/models/token.dart';
import 'package:galleryshop/screens/home/screen_main.dart';
import 'package:galleryshop/stores/login_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_icon_button.dart';

import '../client/create_new_user_client.dart';
import 'reset_password.dart';

const _labelFieldPhoneNumber = 'Telefone';
const _tipFieldPhoneNumber = '(000) 00000-0000';
const _labelFieldPassword = 'Senha';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginWebClient _webClient = LoginWebClient();

  LoginStore loginStore = LoginStore();

  final _formKey = GlobalKey<FormState>();

  final MaskedTextController _controllerMaskFieldPhoneNumber =
      new MaskedTextController(mask: '(000) 00000-0000');

  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: 128,
              height: 128,
              child: Image.asset("images/inicial.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Observer(builder: (_){
                    return CustomForm(
                      enabled: !loginStore.loading,
                      mandatory: true,
                      controller: _controllerMaskFieldPhoneNumber,
                      tip: _tipFieldPhoneNumber,
                      label: _labelFieldPhoneNumber,
                      onChanged: loginStore.setPhone,
                      textInputType: TextInputType.number,
                      obscure: false,
                      icon: Icon(Icons.phone),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(builder: (_) {
                    return CustomForm(
                      enabled: !loginStore.loading,
                      mandatory: true,
                      controller: _controllerPassword,
                      label: _labelFieldPassword,
                      obscure: !loginStore.obscure,
                      onChanged: loginStore.setPassword,
                      icon: Icon(Icons.vpn_key),
                      suffix: CustomIconButton(
                        radius: 32,
                        iconData: loginStore.obscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onTap: loginStore.setObscure,
                      ),
                    );
                  }),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        "Recuperar Senha",
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordPage(),
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 70,
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
                    child: SizedBox.expand(child: Observer(
                      builder: (_) {
                        return FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: loginStore.loading
                                      ? CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.blue),
                                        )
                                      : Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: loginStore.isFormValid
                              ? () {
                                  loginStore.login();
//                                  if (_formKey.currentState.validate()) {
//                                    final String phoneNumber =
//                                        _controllerMaskFieldPhoneNumber.text;
//                                    final String password =
//                                        _controllerPassword.text;
//
//                                    final loginCreatead =
//                                        LoginModel(phoneNumber, password);
//
//                                    _save(loginCreatead, context);
//                                  }
//                                  return null;
                                }
                              : null,
                        );
                      },
                    )),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "Cadastrar novo usuário",
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewUserClient(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _save(LoginModel loginCreatead, BuildContext context) async {
    TokenModel tokenModel = await _send(loginCreatead, context);
    if (tokenModel != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

  Future<TokenModel> _send(LoginModel loginModel, BuildContext context) async {
    final TokenModel tokenModel =
        await _webClient.sendUser(loginModel).catchError((e) {
      debugPrint(e);
    });
    print(tokenModel);
    return tokenModel;
  }
}
