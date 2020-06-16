import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/components/menu_drawer.dart';
import 'package:galleryshop/components/option_card.dart';
import 'package:galleryshop/data/values.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      'https://avatars1.githubusercontent.com/u/38332691?s=460&v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        backgroundColor: colorAppbar,
      ),
      backgroundColor: Colors.white10,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      children: <Widget>[
                        buildOptions(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: Menu(),
    );
  }

  Widget buildOptions() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OptionCard('Agenda', Icons.calendar_today, () {
                Navigator.of(context).pushNamed('/tracks');
              }),
              OptionCard('Conta', Icons.account_balance_wallet, () {
                Navigator.of(context).pushNamed('/members');
              }),
              OptionCard('Perfil', Icons.account_box, () {}),
            ],
          ),
        ],
      ),
    );
  }
}
