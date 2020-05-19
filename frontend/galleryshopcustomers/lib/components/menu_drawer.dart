import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/screens/customers_list.dart';
import 'package:galleryshopcustomers/screens/form_create_new_client.dart';


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Dieinimy'),
            accountEmail: Text('dieinimy@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage:  NetworkImage('https://avatars1.githubusercontent.com/u/38332691?s=460&v=4'),
            ),
          ),
          ListTile(
            title: Text('Cadastrar Cliente'),
            onTap: () {
              _showFormCreateNewClient(context);
            },
          ),
          ListTile(
            title: Text('Listar Clientes'),
            onTap: () {
              _showClientList(context);
            },
          ),
        ],
      ),
    );
  }
}

void _showClientList(BuildContext context) {
  Navigator.of(context).pop();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Customerslist(),
    ),
  );
}

void _showFormCreateNewClient(BuildContext context) {
  Navigator.of(context).pop();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FormCreateNewClient(),
    ),
  );
}
