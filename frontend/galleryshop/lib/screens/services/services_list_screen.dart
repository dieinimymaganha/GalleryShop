import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';
import 'package:galleryshop/widgets/progress.dart';

class ServicesList extends StatelessWidget {
  final ServicesWebClient _webClient = ServicesWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Serviços'),
        centerTitle: true,
        backgroundColor: colorAppbar,
      ),
      body: FutureBuilder<List<ServiceModel>>(
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
              final List<ServiceModel> customers = snapshot.data;
              debugPrint('Customer ${customers}');

              if (snapshot.hasData) {
                final List<ServiceModel> customers = snapshot.data;

                if (customers.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ServiceModel clientModel = customers[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.beenhere),
                          title: Text(
                            clientModel.description.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Funcionário: ${clientModel.typeEmployee.toString()}',
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
    );
  }
}
