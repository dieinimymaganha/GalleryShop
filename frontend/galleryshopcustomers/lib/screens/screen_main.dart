import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/components/menu_drawer.dart';

import 'customers_list.dart';
import 'form_create_new_client.dart';

const _titleAppBar = 'Inicio';

class ScreenMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _FeatureItem(
                  'Cadastrar Cliente',
                  Icons.assignment_ind,
                  onClick: () {
//                    _showFormCreateNewClient(context);
                  },
                ),
                _FeatureItem(
                  'Listar Clientes',
                  Icons.assignment,
                  onClick: () {
                    _showClientList(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Menu(),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showClientList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Customerslist(),
    ),
  );
}

//void _showFormCreateNewClient(BuildContext context) {
//  Navigator.of(context).push(
//    MaterialPageRoute(
//      builder: (context) => FormCreateNewClient(),
//    ),
//  );
//}
