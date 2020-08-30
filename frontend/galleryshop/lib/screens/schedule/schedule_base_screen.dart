import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';

class ScheduleBaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 2, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  title: Text('Horário de atendimento'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: (){},
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Minha agenda'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: (){},
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),              GestureDetector(
                child: ListTile(
                  title: Text('Agendas'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: (){},
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
