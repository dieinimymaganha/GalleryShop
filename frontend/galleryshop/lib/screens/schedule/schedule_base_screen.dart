import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/schedule/opening_hours_screen.dart';
import 'package:galleryshop/screens/schedule/schedule_enable_schedule_screen.dart';
import 'package:galleryshop/screens/schedule/schedule_my_schedule_options.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

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
                  title: Text('Meu horário de atendimento'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OpeningHoursScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Habilitar agendas'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScheduleEnableScheduleScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Horários agendados'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScheduleMyOptions(
                            appointmentConsult: true,
                          )));
                },
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScheduleMyOptions(
                            appointmentConsult: false,
                          )));
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
