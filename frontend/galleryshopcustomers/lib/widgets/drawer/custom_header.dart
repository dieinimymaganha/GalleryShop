import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/screens/login/login_screen.dart';
import 'package:galleryshopcustomers/stores/my_account_store.dart';
import 'package:galleryshopcustomers/widgets/alert_dialog_sending.dart';
import 'package:mobx/mobx.dart';

import '../custom_alert_dialog.dart';

class CustomHeard extends StatefulWidget {
  @override
  _CustomHeardState createState() => _CustomHeardState();
}

class _CustomHeardState extends State<CustomHeard> {
  MyAccountStore myAccountStore = MyAccountStore();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => myAccountStore.logout, (logout) async {
      if (logout) {
        showDialog(
            context: context, builder: (context) => AlertDialogSending());

        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });

    disposer = reaction((_) => myAccountStore.logoutOK, (logoutOK) async {
      if (logoutOK) {
        showDialog(
            context: context, builder: (context) => buildAlertDialogLogout());
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    myAccountStore.setPhoneNumberLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    myAccountStore.logout
                        ? 'Saindo...'
                        : "Seja bem vindo ${myAccountStore.nickNameLogin}",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  myAccountStore.logout
                      ? Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ))
                      : IconButton(
                          onPressed: myAccountStore.buttonLogoutPressed,
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                        )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }
}

CustomAlertDialog buildAlertDialogLogout() {
  return CustomAlertDialog(
    icon: Icon(
      Icons.message,
      color: Colors.white,
    ),
    message: 'Logout realizado com sucesso',
    color: Colors.blue,
  );
}
