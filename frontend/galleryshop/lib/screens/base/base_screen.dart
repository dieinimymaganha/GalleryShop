import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/blocs/drawer_bloc.dart';
import 'package:galleryshop/screens/client/customers_list.dart';
import 'package:galleryshop/screens/home/screen_main.dart';
import 'package:provider/provider.dart';


class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController _pageController = PageController();

  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if(drawerBloc != _drawerBloc){
      _drawerBloc = drawerBloc;

      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page){
        try {
          _pageController.jumpToPage(page);
        } catch (e) {}
      });
    }
  }

  @override
  void dispose() {
    _drawerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          Customerslist(),
          Container(color: Colors.blue),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
