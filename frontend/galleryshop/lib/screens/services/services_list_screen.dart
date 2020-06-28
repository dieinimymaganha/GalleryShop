import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/http/webclients/webclient_services.dart';
import 'package:galleryshop/models/client_new.dart';
import 'package:galleryshop/models/service.dart';
import 'package:galleryshop/screens/services/widgets/buttom_create_service.dart';
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
                        elevation: 10,
                        shadowColor: Colors.grey,
                        child: ListTile(
                          leading: Icon(
                            Icons.beenhere,
                            color: Colors.blue,
                          ),
                          trailing: clientModel.value == null
                              ? Text(
                                  'Preço variável',
                                  style: TextStyle(color: Colors.indigo),
                                )
                              : Text(
                                  'R\$: ${clientModel.value.toString()}',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w700),
                                ),
                          title: Text(
                            clientModel.description.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            clientModel.typeEmployee.toString(),
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
      floatingActionButton: ButtomCreateService(),
    );
  }
}
