import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/login_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:galleryshop/widgets/custom_icon_button.dart';
import 'package:mobx/mobx.dart';

import 'reset_password_screen.dart';

const _labelFieldPhoneNumber = 'Telefone';
const _tipFieldPhoneNumber = '(000) 00000-0000';
const _labelFieldPassword = 'Senha';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginStore loginStore = LoginStore();

  final _formKey = GlobalKey<FormState>();

  final MaskedTextController _controllerMaskFieldPhoneNumber =
      new MaskedTextController(mask: '(000) 00000-0000');

  final TextEditingController _controllerPassword = TextEditingController();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) async {
      if (loggedIn) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Login realizado com sucesso'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BaseScreen()));
      }
    });

    disposer = reaction((_) => loginStore.notFound, (notFound) {
      if (notFound) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Usuário ou senha incorreta'),
          backgroundColor: Colors.deepOrangeAccent,
          duration: Duration(seconds: 2),
        ));
      }
    });
    disposer = reaction((_) => loginStore.errorLogin, (errorLogin) {
      if (errorLogin) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Falha na conexão, verifique sua internet'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
      }
    });
    disposer = reaction((_) => loginStore.forbidden, (forbidden) {
      if (forbidden) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Usuário cliente não autorizado'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 80,
          left: 20,
          right: 20,
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
                  Observer(builder: (_) {
                    return CustomForm(
                      maxlengthField: 16,
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
                              builder: (context) => ResetPasswordScreen(),
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                            onPressed: loginStore.loginPressed);
                      },
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
