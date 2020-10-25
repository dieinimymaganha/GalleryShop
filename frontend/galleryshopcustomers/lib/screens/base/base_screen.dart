import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/blocs/drawer_bloc.dart';
import 'package:galleryshopcustomers/screens/accounts/accounts_screen.dart';
import 'package:galleryshopcustomers/screens/bar/bar.dart';
import 'package:galleryshopcustomers/screens/bills_to_pay/bills_to_pay_screen.dart';
import 'package:galleryshopcustomers/screens/client/client_list_screen.dart';
import 'package:galleryshopcustomers/screens/employees/employees_base_screen.dart';
import 'package:galleryshopcustomers/screens/home/home_screen.dart';
import 'package:galleryshopcustomers/screens/my_account/my_account_screen.dart';
import 'package:galleryshopcustomers/screens/reports/reports_screen.dart';
import 'package:galleryshopcustomers/screens/schedule/schedule_base_screen.dart';
import 'package:galleryshopcustomers/screens/services/services_list_screen.dart';
import 'package:galleryshopcustomers/screens/stock/stock_screen.dart';
import 'package:galleryshopcustomers/screens/store/store_screen.dart';
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
    if (drawerBloc != _drawerBloc) {
      _drawerBloc = drawerBloc;

      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page) {
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
          ClientListScreen(),
          EmployeeBaseScreen(),
          ScheduleBaseScreen(),
          AccountsScreen(),
          MyAccountScreen(),
          BillsToPayScreen(),
          Bar(),
          StoreScreen(),
          ServicesListScreen(),
          StockScreen(),
          ReportsScreen(),
        ],
      ),
    );
  }
}
