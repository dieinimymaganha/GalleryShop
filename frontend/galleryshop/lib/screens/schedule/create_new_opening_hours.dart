import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/stores/opening_hours_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';

class CreateNewOpeningHours extends StatefulWidget {
  @override
  _CreateNewOpeningHoursState createState() => _CreateNewOpeningHoursState();
}

class _CreateNewOpeningHoursState extends State<CreateNewOpeningHours> {
  OpeningHoursStore openingHoursStore = OpeningHoursStore();

  TextEditingController controlerMorningStart = TextEditingController();
  TextEditingController controlerMorningEnd = TextEditingController();
  TextEditingController controlerAfternoonStart = TextEditingController();
  TextEditingController controlerAfternoonEnd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cadastrar novo horario'),
            backgroundColor: colorAppbar,
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: ListView(
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: colorCard),
                        child: DropdownButton(
                            hint: Text(
                              'Selecione o dia da semana',
                              style: TextStyle(),
                            ),
                            value: openingHoursStore.valueSelect,
                            items: openingHoursStore.listDayOfWeek.map((item) {
                              return DropdownMenuItem(
                                value: item.day.toString(),
                                child: Text(item.day.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              openingHoursStore.selectDayOfTheWeek(value);
                            }),
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        mandatory: true,
                        obscure: false,
                        label: 'Horario início manhã',
                        controller: controlerMorningStart,
                        ontap: () {
                          changeAlterHours(controlerMorningStart);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        mandatory: true,
                        obscure: false,
                        label: 'Horario fim manhã',
                        controller: controlerMorningEnd,
                        ontap: () {
                          changeAlterHours(controlerMorningEnd);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        mandatory: true,
                        obscure: false,
                        label: 'Horario início tarde',
                        controller: controlerAfternoonStart,
                        ontap: () {
                          changeAlterHours(controlerAfternoonStart);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        mandatory: true,
                        obscure: false,
                        label: 'Horario fim tarde',
                        controller: controlerAfternoonEnd,
                        ontap: () {
                          changeAlterHours(controlerAfternoonEnd);
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void changeAlterHours(TextEditingController controller) {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        dateFormat: 'HH:mm',
        pickerMode: DateTimePickerMode.time,
        onConfirm: (dateTime, selectedIndex) {
      String hour = DateFormat('HH:mm').format(dateTime);
      controller.text = hour;
    },
        pickerTheme: DateTimePickerTheme(
          cancelTextStyle: TextStyle(color: Colors.redAccent),
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
}
