import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Bem Vindo Dieinimy!',style: TextStyle(color: Colors.white, fontSize: 15),),
            ],
          )
        ],
      ),
    );
  }
}
