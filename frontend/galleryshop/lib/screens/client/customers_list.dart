import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_client.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/screens/client/widget/buttom_create_client.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';
import 'package:galleryshop/widgets/progress.dart';

const _titleAppbar = 'Lista de clientes';

class Customerslist extends StatelessWidget {
  final ClientWebClient _webClient = ClientWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppbar),
        centerTitle: true,
        backgroundColor: colorAppbar,
      ),
      body: FutureBuilder<List<ClientModel>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<ClientModel> customers = snapshot.data;
              debugPrint('Customer ${customers}');

              if (snapshot.hasData) {
                final List<ClientModel> customers = snapshot.data;

                if (customers.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ClientModel clientModel = customers[index];
                      return InkWell(
                        onTap: () {
                          print('Clicou');
                        },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.person),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 2,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            clientModel.nickname,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'Nome: ${clientModel.name}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            'Sobrenome: ${clientModel.lastName}',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            'Data Nascimento: ${convertData(clientModel.birthdate.toString())}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: customers.length,
                  );
                }
              }

              return CenteredMessage(
                'Nenhum cliente encontrados',
                icon: Icons.warning,
              );
              break;
          }
          return CenteredMessage('Erro desconhecido');
        },
      ),
      drawer: CustomDrawer(),
      floatingActionButton: ButtomCreateClient(),
    );
  }

  String convertData(String data) {
    String nwdata = data.substring(0, 10);
    return nwdata;
  }
}
