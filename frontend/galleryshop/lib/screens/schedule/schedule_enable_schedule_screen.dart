import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/schedule_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class ScheduleEnableScheduleScreen extends StatefulWidget {
  @override
  _ScheduleEnableScheduleScreenState createState() =>
      _ScheduleEnableScheduleScreenState();
}

class _ScheduleEnableScheduleScreenState
    extends State<ScheduleEnableScheduleScreen> {
  ScheduleStore scheduleStore = ScheduleStore();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    scheduleStore.loadingInitOptionsSchedule();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => scheduleStore.enableScheduleOk, (created) async {
      if (created) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Agenda cadastrada com sucesso!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blueAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });

    disposer = reaction((_) => scheduleStore.enableScheduleDuplicate,
        (duplicate) async {
      if (duplicate) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Intervalo de agenda já cadastrado',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
        _scaffoldKey.currentState.removeCurrentSnackBar();
      }
    });

    disposer =
        reaction((_) => scheduleStore.enableScheduleError, (error) async {
      if (error) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Erro ao cadastrar',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(Duration(seconds: 2));
        _scaffoldKey.currentState.removeCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
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
                        enabled: !scheduleStore.enableScheduleSending,
                        controller: scheduleStore.controllerDayInit,
                        tip: 'Data início',
                        label: 'Data início',
                        obscure: false,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterDayIni();
                        },
                        onChanged: scheduleStore.setDayIni,
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !scheduleStore.enableScheduleSending,
                        controller: scheduleStore.controllerAttendanceTime,
                        tip: 'HH:MM',
                        label: 'Tempo atendimento',
                        obscure: false,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterHours(
                              scheduleStore.controllerAttendanceTime,
                              scheduleStore.setAttendanceTime);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        enabled: !scheduleStore.enableScheduleSending,
                        controller: scheduleStore.controllerQuantityDays,
                        tip: 'Quantidade de dias',
                        label: 'Quantidade de dias',
                        obscure: false,
                        textInputType: TextInputType.number,
                        onChanged: scheduleStore.setQuantityDays,
                      ),
                      SizedBox(height: space),
                      Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Color(0XFF212121),
                              Color(0XFF616161),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: SizedBox.expand(
                            child: FlatButton(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Cadastrar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      child: SizedBox(
                                        child:
                                            scheduleStore.enableScheduleSending
                                                ? CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                            Colors.blue),
                                                  )
                                                : Icon(Icons.send),
                                        height: 28,
                                        width: 28,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed:
                                    scheduleStore.buttonEnableSchedulePressed)),
                      ),
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
        maxDateTime: DateTime(2020, 1, 59, 2),
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
