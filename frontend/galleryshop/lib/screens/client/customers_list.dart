import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/http/webclients/webclient_client.dart';
import 'package:galleryshop/models/client.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/progress.dart';

const _titleAppbar = 'Lista de clientes';

class Customerslist extends StatelessWidget {
  final ClientWebClient _webClient = ClientWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppbar),
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
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text(
                            clientModel.name.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            clientModel.lastName.toString(),
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
    );
  }
}
