import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/stores/drawer_store.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  DrawerStore drawerStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Observer(builder: (_) {
          return IconTile(
            label: 'Clientes',
            iconData: Icons.people,
            onTap: () {
              print(1);
            },
            highlighted: false,
          );
        }),
        IconTile(
          label: 'Funcionários',
          iconData: Icons.people_outline,
          onTap: () {
            print(2);
          },
          highlighted: false,
        ),
        IconTile(
          label: 'Agenda',
          iconData: Icons.event,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Contas',
          iconData: Icons.poll,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Contas a pagar',
          iconData: Icons.money_off,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Bar',
          iconData: Icons.local_bar,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Loja',
          iconData: Icons.store,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Serviços',
          iconData: Icons.beenhere,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Relatórios',
          iconData: Icons.pie_chart,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Estoque',
          iconData: Icons.markunread_mailbox,
          onTap: () {},
          highlighted: false,
        )
      ],
    );
  }
}
