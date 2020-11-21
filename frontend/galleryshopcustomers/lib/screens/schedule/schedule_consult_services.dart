import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshopcustomers/stores/schedule_store.dart';

class ScheduleConsultServices extends StatefulWidget {
  @override
  _ScheduleConsultServicesState createState() =>
      _ScheduleConsultServicesState();
}

class _ScheduleConsultServicesState extends State<ScheduleConsultServices> {
  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Consultar'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                DropdownButton(
                  hint: Text('Selecione o Tipo de funcionário'),
                  value: scheduleStore.valueSelect,
                  items: scheduleStore.dataServices.map((item) {
                    return DropdownMenuItem(
                      child: Text(item.description.toString()),
                      value: item.description.toString(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    scheduleStore.selectTypeService(value);
                    scheduleStore.resetEmployee();
                    scheduleStore.setIdTypeEmployee(value);
                  },
                ),
                scheduleStore.loadingListEmployee
                    ? Text('Texxxti')
                    : DropdownButton(
                        hint: Text('Selecione o funcionário'),
                        value: scheduleStore.valueSelectEmployee,
                        items: scheduleStore.listEmployee.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.nickname.toString()),
                            value: item.nickname.toString(),
                          );
                        }).toList(),
                        onChanged: (value) {
                          scheduleStore.selectEmployee(value);
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
