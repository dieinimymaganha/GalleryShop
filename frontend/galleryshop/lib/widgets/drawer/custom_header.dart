import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/stores/my_account_store.dart';

class CustomHeard extends StatefulWidget {
  @override
  _CustomHeardState createState() => _CustomHeardState();
}

class _CustomHeardState extends State<CustomHeard> {
  MyAccountStore myAccountStore = MyAccountStore();

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
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Seja bem vindo ${myAccountStore.employeeDto.nickname}",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
