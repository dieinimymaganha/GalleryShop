import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_client.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class CreateNewServiceScreen extends StatefulWidget {
  @override
  _CreateNewServiceScreenState createState() => _CreateNewServiceScreenState();
}

class _CreateNewServiceScreenState extends State<CreateNewServiceScreen> {
  final ClientWebClient _webClient = ClientWebClient();

  final _formKey = GlobalKey<FormState>();

  final double _space = 10.0;

  String dropdownValue = 'Selecione';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar novo serviço',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10,
        backgroundColor: colorAppbar,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 8,
          right: 8,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomForm(
                    label: 'Descrição',
                    obscure: false,
                    maxlength_field: 50,
                    mandatory: true,
                  ),
                  SizedBox(height: _space),
                  CustomForm(
                    label: 'Valor',
                    obscure: false,
                    mandatory: true,
                    textInputType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),

                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: _space),
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
                              'Cadastrar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              child: SizedBox(
                                child: Icon(Icons.send),
                                height: 28,
                                width: 28,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(ClientModelForm clientCreated, BuildContext context) async {
    ClientModelDto clientModelDto = await _send(clientCreated, context);
    print('Novo cliente :' + clientModelDto.toString());
    if (clientModelDto != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BaseScreen(),
          ));
    }
  }

  Future<ClientModelDto> _send(
      ClientModelForm clientCreated, BuildContext context) async {
    final ClientModelDto clientModelDto =
        await _webClient.save(clientCreated).catchError((e) {
      debugPrint(e);
    });
    return clientModelDto;
  }
}
