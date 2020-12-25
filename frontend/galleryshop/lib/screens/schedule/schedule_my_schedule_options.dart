import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/schedule_store.dart';

import 'schedule_my_schedule.dart';

class ScheduleMyOptions extends StatefulWidget {
  @override
  _ScheduleMyOptionsState createState() => _ScheduleMyOptionsState();
}

class _ScheduleMyOptionsState extends State<ScheduleMyOptions> {
  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.setOptionsMySchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Agendas'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 2, left: 8, right: 8),
              child: Column(
                children: scheduleStore.employeeDto.typeEmployees
                    .map<Widget>((typeEmployee) {
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        child: ListTile(
                          title: Text(typeEmployee.description),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScheduleMySchedule(
                                    idEmployee: scheduleStore.employeeDto.id,
                                    idTypeEmployee: typeEmployee.id,
                                  )));
                        },
                      ),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 0.5,
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
