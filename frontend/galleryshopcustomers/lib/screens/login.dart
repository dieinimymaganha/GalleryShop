import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshopcustomers/http/webclients/webclient_login.dart';
import 'package:galleryshopcustomers/models/login.dart';
import 'package:galleryshopcustomers/models/token.dart';
import 'package:galleryshopcustomers/screens/reset_password.dart';
import 'package:galleryshopcustomers/screens/screen_main.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginWebClient _webClient = LoginWebClient();

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
            TextFormField(
              controller: _controllerMaskFieldPhoneNumber,
//              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefone",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerPassword,
//              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  )),
              style: TextStyle(fontSize: 20),
            ),
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
                        'Login',
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
                    final String phoneNumber =
                        _controllerMaskFieldPhoneNumber.text;
                    final String password = _controllerPassword.text;

                    final loginCreatead = LoginModel(phoneNumber, password);

                    _save(loginCreatead, context);
                  },
                ),
              ),
            )
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
            builder: (context) => ScreenMain(),
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
