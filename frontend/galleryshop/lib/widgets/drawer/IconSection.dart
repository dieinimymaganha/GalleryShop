import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/blocs/drawer_bloc.dart';
import 'package:provider/provider.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBloc _drawerBloc = Provider.of<DrawerBloc>(context);

    void _setPage(int page) {
      Navigator.of(context).pop();
      _drawerBloc.setPage(page);
    }

    return StreamBuilder<int>(
      stream: _drawerBloc.outPage,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(bottom: 60),
          decoration: BoxDecoration(color: Colors.blueGrey[100]),
          child: Column(
            children: <Widget>[
              IconTile(
                label: 'Pagina Inicial',
                iconData: Icons.people,
                onTap: () {
                  _setPage(0);
                },
                highlighted: snapshot.data == 0,
              ),
              IconTile(
                label: 'Clientes',
                iconData: Icons.people,
                onTap: () {
                  _setPage(1);
                },
                highlighted: snapshot.data == 1,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Funcionários',
                iconData: Icons.people_outline,
                onTap: () {
                  _setPage(2);
                },
                highlighted: snapshot.data == 2,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Agenda',
                iconData: Icons.event,
                onTap: () {
                  _setPage(3);
                },
                highlighted: snapshot.data == 3,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Contas',
                iconData: Icons.poll,
                onTap: () {
                  _setPage(4);
                },
                highlighted: snapshot.data == 4,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Minha conta',
                iconData: Icons.person,
                onTap: () {
                  _setPage(5);
                },
                highlighted: snapshot.data == 5,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Contas a pagar',
                iconData: Icons.money_off,
                onTap: () {
                  _setPage(6);
                },
                highlighted: snapshot.data == 6,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Financeiro',
                iconData: Icons.monetization_on,
                onTap: () {
                  _setPage(7);
                },
                highlighted: snapshot.data == 7,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Loja',
                iconData: Icons.store,
                onTap: () {
                  _setPage(8);
                },
                highlighted: snapshot.data == 8,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Serviços',
                iconData: Icons.beenhere,
                onTap: () {
                  _setPage(9);
                },
                highlighted: snapshot.data == 9,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Estoque',
                iconData: Icons.markunread_mailbox,
                onTap: () {
                  _setPage(10);
                },
                highlighted: snapshot.data == 10,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Relatórios',
                iconData: Icons.pie_chart,
                onTap: () {
                  _setPage(11);
                },
                highlighted: snapshot.data == 11,
              ),
            ],
          ),
        );
      },
    );
  }
}
