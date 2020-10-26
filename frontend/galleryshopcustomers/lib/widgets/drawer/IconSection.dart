import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/blocs/drawer_bloc.dart';
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
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Agenda',
                iconData: Icons.event,
                onTap: () {
                  _setPage(1);
                },
                highlighted: snapshot.data == 1,
              ),
              Divider(
                height: 0,
              ),
              Divider(
                height: 0,
              ),
              IconTile(
                label: 'Minha conta',
                iconData: Icons.person,
                onTap: () {
                  _setPage(2);
                },
                highlighted: snapshot.data == 2,
              ),
              Divider(
                height: 0,
              ),
              Divider(
                height: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
