import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';

class ScheduleEnableScheduleScreen extends StatefulWidget {
  @override
  _ScheduleEnableScheduleScreenState createState() =>
      _ScheduleEnableScheduleScreenState();
}

class _ScheduleEnableScheduleScreenState
    extends State<ScheduleEnableScheduleScreen> {
  ScheduleStore scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    scheduleStore.loadingInitOptionsSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Habilitar agenda'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: scheduleStore.loadingPageScheduleTime
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: colorCard),
                        child: DropdownButton(
                          hint: Text(
                            'Selecione o tipo de funcionário',
                          ),
                          value: scheduleStore.valueSelectTypeEmployee,
                          items: scheduleStore.employeeDto.typeEmployees
                              .map((item) {
                            return DropdownMenuItem(
                              child: Text(item.description),
                              value: item.description,
                            );
                          }).toList(),
                          onChanged: (value) {
                            scheduleStore.selectTypeService(value);
                            scheduleStore.setIdTypeEmployee(value);
                          },
                        ),
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: true,
                        controller: scheduleStore.controllerDayInit,
                        tip: 'Data início',
                        label: 'Data início',
                        obscure: false,
                        ontap: () {
                          changeAlterDayIni();
                        },
                        onChanged: scheduleStore.setDayIni,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: true,
                        controller: scheduleStore.controllerAttendanceTime,
                        tip: 'HH:MM',
                        label: 'Tempo atendimento',
                        obscure: false,
                        ontap: () {
                          changeAlterHours(
                              scheduleStore.controllerAttendanceTime,
                              scheduleStore.setAttendanceTime);
                        },
                        onChanged: scheduleStore.setDayIni,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  void changeAlterDayIni() {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        minDateTime: DateTime.now(),
        dateFormat: 'dd/MM/yyyy', onConfirm: (dateTime, selectedIndex) {
      String birthDate = DateFormat('dd/MM/yyyy').format(dateTime);
      scheduleStore.setDayIniController(birthDate);
      scheduleStore.setDayIni(birthDate);
    },
        pickerTheme: DateTimePickerTheme(
          pickerHeight: 110.0,
          itemTextStyle: TextStyle(color: Colors.black87),
          showTitle: true,
          cancel: Text(
            'Cancelar',
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
          ),
          confirm: Text(
            'Confirmar',
            style: TextStyle(color: Colors.blueAccent, fontSize: 18),
          ),
        ));
  }

  void changeAlterHours(TextEditingController controller, Function function) {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        dateFormat: 'HH:mm',
        pickerMode: DateTimePickerMode.time, onCancel: () {
      controller.clear();
      function(controller);
    }, onConfirm: (dateTime, selectedIndex) {
      String hour = DateFormat('HH:mm').format(dateTime);
      controller.text = hour;
      function(controller);
    },
        pickerTheme: DateTimePickerTheme(
          cancelTextStyle: TextStyle(color: Colors.redAccent),
          pickerHeight: 110.0,
          itemTextStyle: TextStyle(color: Colors.black87),
          showTitle: true,
          cancel: Text(
            'Limpar',
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
          ),
          confirm: Text(
            'Confirmar',
            style: TextStyle(color: Colors.blueAccent, fontSize: 18),
          ),
        ));
  }
}
