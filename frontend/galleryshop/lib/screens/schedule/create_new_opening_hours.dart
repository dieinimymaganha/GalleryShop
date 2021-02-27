import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/models/opening_hours.dart';
import 'package:galleryshop/screens/schedule/opening_hours_screen.dart';
import 'package:galleryshop/stores/opening_hours_store.dart';
import 'package:galleryshop/widgets/custom_form.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class CreateNewOpeningHours extends StatefulWidget {
  final OpeninigHoursDto openinigHoursDto;

  CreateNewOpeningHours({this.openinigHoursDto});

  @override
  _CreateNewOpeningHoursState createState() =>
      _CreateNewOpeningHoursState(openinigHoursDto: openinigHoursDto);
}

class _CreateNewOpeningHoursState extends State<CreateNewOpeningHours> {
  _CreateNewOpeningHoursState({OpeninigHoursDto openinigHoursDto})
      : openingHoursStore =
            OpeningHoursStore(openinigHoursDto: openinigHoursDto);

  OpeningHoursStore openingHoursStore = OpeningHoursStore();

  final _formState = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    openingHoursStore.setDataInitial();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer =
        reaction((_) => openingHoursStore.errorSending, (errorSending) async {
      if (errorSending) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            openingHoursStore.change
                ? 'Error ao atualizar'
                : 'Error ao cadastrar! Verifique os campos',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
      }

      await Future.delayed(Duration(seconds: 2));
      _scaffoldKey.currentState.removeCurrentSnackBar();
    });

    disposer = reaction((_) => openingHoursStore.created, (created) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          openingHoursStore.change
              ? 'Horário alterado com sucesso!'
              : 'Horário cadastrado com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OpeningHoursScreen()));
    });

    disposer = reaction((_) => openingHoursStore.duplicate, (duplicate) async {
      if (duplicate) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Dia da semana já cadastrado!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent,
          duration: Duration(seconds: 2),
        ));
      }
      await Future.delayed(Duration(seconds: 2));

      _scaffoldKey.currentState.removeCurrentSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(openingHoursStore.change
                ? 'Alterar horário'
                : 'Cadastrar novo horario'),
            backgroundColor: colorAppbar,
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formState,
                  autovalidate: true,
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
                                value: item.description.toString(),
                                child: Text(item.day.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              openingHoursStore.selectDayOfTheWeek(value);
                            }),
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        textInputType: TextInputType.datetime,
                        mandatory: false,
                        obscure: false,
                        label: 'Horario início manhã',
                        controller: openingHoursStore.controlerMorningStart,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterHours(
                              openingHoursStore.controlerMorningStart,
                              openingHoursStore.setMoringStart);
                        },
                        validator: (_) {
                          return validatorHoursMorningStart(
                              openingHoursStore.morningStart,
                              openingHoursStore.morningEnd,
                              openingHoursStore.afternoonStart,
                              openingHoursStore.afternoonEnd);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        textInputType: TextInputType.datetime,
                        mandatory: false,
                        obscure: false,
                        label: 'Horario fim manhã',
                        controller: openingHoursStore.controlerMorningEnd,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterHours(
                              openingHoursStore.controlerMorningEnd,
                              openingHoursStore.setMoringEnd);
                        },
                        validator: (_) {
                          return validatorHoursMorningEnd(
                              openingHoursStore.morningStart,
                              openingHoursStore.morningEnd,
                              openingHoursStore.afternoonStart,
                              openingHoursStore.afternoonEnd);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        textInputType: TextInputType.datetime,
                        mandatory: false,
                        obscure: false,
                        label: 'Horario início tarde',
                        controller: openingHoursStore.controlerAfternoonStart,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterHours(
                              openingHoursStore.controlerAfternoonStart,
                              openingHoursStore.setAfternoonStart);
                        },
                        validator: (_) {
                          return validatorHoursAfternoonStart(
                              openingHoursStore.morningStart,
                              openingHoursStore.morningEnd,
                              openingHoursStore.afternoonStart,
                              openingHoursStore.afternoonEnd);
                        },
                      ),
                      SizedBox(height: space),
                      CustomForm(
                        textInputType: TextInputType.datetime,
                        mandatory: false,
                        obscure: false,
                        label: 'Horario fim tarde',
                        controller: openingHoursStore.controlerAfternoonEnd,
                        ontap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          changeAlterHours(
                              openingHoursStore.controlerAfternoonEnd,
                              openingHoursStore.setAfternoonEnd);
                        },
                        validator: (_) {
                          return validatorHoursAfternoonEnd(
                              openingHoursStore.morningStart,
                              openingHoursStore.morningEnd,
                              openingHoursStore.afternoonStart,
                              openingHoursStore.afternoonEnd);
                        },
                      ),
                      SizedBox(height: 20),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                openingHoursStore.change
                                    ? 'Alterar'
                                    : 'Cadastrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: SizedBox(
                                  child: openingHoursStore.sending
                                      ? CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.blue),
                                        )
                                      : Icon(Icons.send),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: openingHoursStore.change
                              ? openingHoursStore.buttonChangePressed
                              : openingHoursStore.butttonSavePressed,
                        )),
                      ),
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

  String validatorHoursMorningStart(
      DateTime hours1, DateTime hours2, DateTime hours3, DateTime hours4) {
    if (hours1 == null && hours2 != null) {
      return 'Preenchimento obrigatório';
    } else if (hours1 != null &&
        hours2 != null &&
        hours3 != null &&
        hours4 != null) {
      if (hours1.isAtSameMomentAs(hours2)) {
        return 'Início da manhã é igual ao fim da manhã';
      } else if (hours1.isAtSameMomentAs(hours3)) {
        return 'Início da manhã é igual ao início da tarde';
      } else if (hours1.isAtSameMomentAs(hours4)) {
        return 'Início da manhã é igual ao fim da tarde';
      } else if (hours1.isAfter(hours2)) {
        return 'Inicio manhã é maior que o fim da manhã';
      } else if (hours1.isAfter(hours3)) {
        return 'Início manhã é maior que início da tarde';
      } else if (hours1.isAfter(hours4)) {
        return 'Início manhã é maior que o fim da tarde';
      }
    } else if (hours1 != null && hours2 != null && hours3 != null) {
      if (hours1.isAtSameMomentAs(hours2)) {
        return 'Início da manhã é igual ao fim da manhã';
      } else if (hours1.isAtSameMomentAs(hours3)) {
        return 'Início da manhã é igual ao início da tarde';
      } else if (hours1.isAfter(hours2)) {
        return 'Inicio manhã é maior que o fim da manhã';
      } else if (hours1.isAfter(hours3)) {
        return 'Início manhã é maior que início da tarde';
      }
    } else if (hours1 != null && hours2 != null) {
      if (hours1.isAtSameMomentAs(hours2)) {
        return 'Início da manhã é igual ao fim da manhã';
      } else if (hours1.isAfter(hours2)) {
        return 'Início da manhã é maior que fim da manhã';
      }
    }
    return null;
  }

  String validatorHoursMorningEnd(
      DateTime hours1, DateTime hours2, DateTime hours3, DateTime hours4) {
    if (hours1 != null && hours2 == null) {
      return 'Preenchimento obrigatório';
    } else if (hours1 != null &&
        hours2 != null &&
        hours3 != null &&
        hours4 != null) {
      if (hours2.isAtSameMomentAs(hours1)) {
        return 'Fim da manhã é igual ao inicio da manhã';
      } else if (hours2.isAtSameMomentAs(hours3)) {
        return 'Horário de inicio  manhã é igual ao do inicio da tarde';
      } else if (hours2.isAtSameMomentAs(hours4)) {
        return 'Fim da manhã é igual ao do fim da tarde';
      } else if (hours2.isBefore(hours1)) {
        return 'Fim da manhã é menor que início da manhã';
      } else if (hours2.isAfter(hours3)) {
        return 'Fim da manhã é maior que início da tarde';
      } else if (hours2.isAfter(hours4)) {
        return 'Fim da manhã é maior que fim da tarde';
      }
    } else if (hours1 != null && hours2 != null && hours3 != null) {
      if (hours2.isAtSameMomentAs(hours1)) {
        return 'Fim da manhã é igual ao inicio da manhã';
      } else if (hours2.isAtSameMomentAs(hours3)) {
        return 'Horário de inicio  manhã é igual ao do inicio da tarde';
      } else if (hours2.isBefore(hours1)) {
        return 'Fim da manhã é menor que início da manhã';
      } else if (hours2.isAfter(hours3)) {
        return 'Fim da manhã é maior que início da tarde';
      }
    } else if (hours1 != null && hours2 != null) {
      if (hours2.isAtSameMomentAs(hours1)) {
        return 'Fim da manhã é igual ao inicio da manhã';
      } else if (hours2.isBefore(hours1)) {
        return 'Fim da manhã é menor que início da manhã';
      }
    }
    return null;
  }

  String validatorHoursAfternoonStart(
      DateTime hours1, DateTime hours2, DateTime hours3, DateTime hours4) {
    if (hours3 == null && hours4 != null) {
      return 'Preenchimento obrigatório';
    } else if (hours4 != null &&
        hours3 != null &&
        hours2 != null &&
        hours1 != null) {
      if (hours3.isAtSameMomentAs(hours1)) {
        return 'Início da tarde é igual ao inicio da manhã';
      } else if (hours3.isAtSameMomentAs(hours2)) {
        return 'Início da tarde  é igual ao fim da manhã';
      } else if (hours3.isAtSameMomentAs(hours4)) {
        return 'Inicio da tarde é igual ao do fim da tarde';
      } else if (hours3.isBefore(hours1)) {
        return 'Início da tarde é menor que inicio da manhã';
      } else if (hours3.isBefore(hours2)) {
        return 'Início da tarde é menor que fim da manhã';
      } else if (hours3.isAfter(hours4)) {
        return 'Inicio da tarde é maior que fim da tarde';
      }
    } else if (hours3 != null && hours4 != null && hours2 != null) {
      if (hours3.isAtSameMomentAs(hours2)) {
        return 'Início da tarde  é igual ao fim da manhã';
      } else if (hours3.isAtSameMomentAs(hours4)) {
        return 'Inicio da tarde é igual ao do fim da tarde';
      } else if (hours3.isBefore(hours2)) {
        return 'Início da tarde é menor que fim da manhã';
      } else if (hours3.isAfter(hours4)) {
        return 'Fim da manhã é maior que fim da tarde';
      }
    } else if (hours3 != null && hours4 != null) {
      if (hours3.isAtSameMomentAs(hours4)) {
        return 'Inicio da tarde é igual ao do fim da tarde';
      } else if (hours3.isAfter(hours4)) {
        return 'Início da tarde é maior que fim da tarde';
      }
    }
    return null;
  }

  String validatorHoursAfternoonEnd(
      DateTime hours1, DateTime hours2, DateTime hours3, DateTime hours4) {
    if (hours3 != null && hours4 == null) {
      return 'Preenchimento obrigatório';
    } else if (hours4 != null &&
        hours3 != null &&
        hours2 != null &&
        hours1 != null) {
      if (hours4.isAtSameMomentAs(hours1)) {
        return 'Fim da tarde é igual ao inicio da manhã';
      } else if (hours4.isAtSameMomentAs(hours2)) {
        return 'Fim da tarde  é igual ao fim da manhã';
      } else if (hours4.isAtSameMomentAs(hours3)) {
        return 'Fim da tarde  é igual ao início da tarde';
      } else if (hours4.isBefore(hours3)) {
        return 'Fim da tarde é menor que inicio da tarde';
      } else if (hours4.isBefore(hours2)) {
        return 'Início da tarde é menor que fim da manhã';
      } else if (hours4.isBefore(hours1)) {
        return 'Início da tarde é menor que inicio da manhã';
      }
    } else if (hours3 != null && hours4 != null && hours2 != null) {
      if (hours4.isAtSameMomentAs(hours2)) {
        return 'Fim da tarde  é igual ao fim da manhã';
      } else if (hours4.isAtSameMomentAs(hours3)) {
        return 'Fim da tarde  é igual ao início da tarde';
      } else if (hours4.isBefore(hours2)) {
        return 'Início da tarde é menor que fim da manhã';
      }
    } else if (hours3 != null && hours4 != null) {
      if (hours4.isAtSameMomentAs(hours3)) {
        return 'Fim da tarde  é igual ao início da tarde';
      } else if (hours4.isBefore(hours3)) {
        return 'Fim da tarde é menor que inicio da tarde';
      }
    }
    return null;
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
