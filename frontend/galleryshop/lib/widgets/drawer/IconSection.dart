import 'package:flutter/material.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: 'Clientes',
          iconData: Icons.people,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: 'Funcionários',
          iconData: Icons.people_outline,
          onTap: () {},
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
          iconData: Icons.store ,
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
