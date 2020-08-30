import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';

class CreateNewOpeningHours extends StatefulWidget {
  @override
  _CreateNewOpeningHoursState createState() => _CreateNewOpeningHoursState();
}

class _CreateNewOpeningHoursState extends State<CreateNewOpeningHours> {
  TextEditingController controlerIni = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  CustomForm(
                    mandatory: true,
                    obscure: false,
                    label: 'Horario início manhã',
                    controller: controlerIni,
                    ontap: () {
                      changeAlterBirthDate();
                    },
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    obscure: false,
                    label: 'Horario fim manhã',
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    obscure: false,
                    label: 'Horario início tarde',
                  ),
                  SizedBox(height: space),
                  CustomForm(
                    mandatory: true,
                    obscure: false,
                    label: 'Horario fim tarde',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeAlterBirthDate() {
    DatePicker.showDatePicker(context,
        locale: DateTimePickerLocale.pt_br,
        dateFormat: 'HH:mm',
        pickerMode: DateTimePickerMode.time,
        onConfirm: (dateTime, selectedIndex) {
      String hour = DateFormat('HH:mm').format(dateTime);
      controlerIni.text = hour;
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
