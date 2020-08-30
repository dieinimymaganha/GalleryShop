import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/opening_hours_store.dart';

class OpeningHoursScreen extends StatefulWidget {
  @override
  _OpeningHoursScreenState createState() => _OpeningHoursScreenState();
}

class _OpeningHoursScreenState extends State<OpeningHoursScreen> {
  OpeningHoursStore openingHoursStore = OpeningHoursStore();

  @override
  void initState() {
    super.initState();
    openingHoursStore.setIdEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horario de atendimento'),
          centerTitle: true,
          backgroundColor: colorAppbar,
          leading: IconButton(
            icon: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BaseScreen()));
              },
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Observer(
            builder: ((_) {
              return ListView(
                children: <Widget>[
                  Text(openingHoursStore.idEmployee.toString()),
                ],
              );
            }),
          ),
        ));
  }
}
