import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/financial/flag_card_payment_list_screen.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

class FinancialBaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financeiro'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  title: Text('Cartões'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FlagCardPaymentListScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
