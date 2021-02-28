import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/base/base_screen.dart';
import 'package:galleryshopcustomers/stores/my_account_store.dart';
import 'package:galleryshopcustomers/widgets/custom_form.dart';
import 'package:galleryshopcustomers/widgets/custom_icon_button.dart';
import 'package:mobx/mobx.dart';

class AlterPasswordScreen extends StatefulWidget {
  @override
  _AlterPasswordScreenState createState() => _AlterPasswordScreenState();
}

class _AlterPasswordScreenState extends State<AlterPasswordScreen> {
  MyAccountStore myAccountStore = MyAccountStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    myAccountStore.getClient();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => myAccountStore.alterOK, (loggedIn) async {
      if (loggedIn) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Senha alterada com sucesso'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => BaseScreen()));
      }
    });

    disposer = reaction((_) => myAccountStore.error, (error) {
      if (error) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Falha ao alterar, tente novamente!'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Alterar senha'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: ListView(
              children: <Widget>[
                Form(
                  autovalidate: myAccountStore.isPasswordFirstValid ||
                      myAccountStore.isPasswordSecondValid,
                  key: myAccountStore.formState,
                  child: Column(
                    children: <Widget>[
                      CustomForm(
                        enabled: !myAccountStore.sending,
                        controller: myAccountStore.controllerFirstPass,
                        mandatory: true,
                        tip: 'Digite a nova senha',
                        label: 'Digite a nova senha',
                        textInputType: TextInputType.text,
                        obscure: !myAccountStore.obscureFirst,
                        icon: Icon(Icons.vpn_key),
                        onChanged: myAccountStore.setFirst,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: myAccountStore.obscureFirst
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: myAccountStore.setObscureFirst,
                        ),
                        validator: (value) {
                          return validatorFirstPass(value);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !myAccountStore.sending,
                        controller: myAccountStore.controllerSecondPass,
                        mandatory: true,
                        icon: Icon(Icons.vpn_key),
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: myAccountStore.obscureSecond
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: myAccountStore.setObscureSecond,
                        ),
                        tip: 'Digite novamente a nova senha',
                        label: 'Digite novamente a nova senha',
                        textInputType: TextInputType.text,
                        obscure: !myAccountStore.obscureSecond,
                        onChanged: myAccountStore.setSecondPass,
                        validator: (value) {
                          return validatorSecondPass(value);
                        },
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
                                      'Alterar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child: myAccountStore.sending
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
                                onPressed: myAccountStore.buttonSavePressed)),
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

  String validatorFirstPass(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (myAccountStore.isPasswordSecondValid) {
      if (value != myAccountStore.secondPass) {
        return 'Senhas não confererem';
      }
    }
  }

  String validatorSecondPass(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (myAccountStore.isPasswordFirstValid) {
      if (value != myAccountStore.firstPass) {
        return 'Senhas não confererem';
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }
}
