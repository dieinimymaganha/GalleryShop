import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String titleAppBar = "Cadastrar Cliente";


class FormCreateNewClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppBar),
      ),
    );
  }
}
