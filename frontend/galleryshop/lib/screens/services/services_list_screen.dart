import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/services/create_new_service_screen.dart';
import 'package:galleryshop/screens/services/widgets/buttom_create_service.dart';
import 'package:galleryshop/screens/services/widgets/dialog_services.dart';
import 'package:galleryshop/stores/provision_store.dart';
import 'package:galleryshop/widgets/centered_message.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

class ServicesListScreen extends StatefulWidget {
  @override
  _ServicesListScreenState createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  ProvisionStore serviceStore = ProvisionStore();

  @override
  void initState() {
    super.initState();
    serviceStore.setList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Lista Serviços'),
            centerTitle: true,
            backgroundColor: colorAppbar,
          ),
          body: serviceStore.errorList
              ? Container(
                  child: serviceStore.listEmpty
                      ? CenteredMessage(
                          'Não á dados Cadastrados',
                          icon: Icons.description,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text(
                                  'Falha ao carregar',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              FlatButton(
                                  child: Text('Clique para recarregar!'),
                                  onPressed: serviceStore.recarregarList)
                            ],
                          ),
                        ))
              : Container(
                  child: serviceStore.loading
                      ? Center(child: CircularProgressIndicator())
                      : ListView(
                          children:
                              serviceStore.listServices.map((serviceModel) {
                          return GestureDetector(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => DialogService(
                                        serviceModel: serviceModel,
                                      ));
                            },
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateNewServiceScreen(
                                        serviceModel: serviceModel,
                                      )));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: colorCard,
                                elevation: 10,
                                shadowColor: Colors.grey,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.beenhere,
                                    color: Colors.blue,
                                  ),
                                  trailing: serviceModel.value == null
                                      ? Text(
                                          'Preço variável',
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        )
                                      : Text(
                                          'R\$: ${serviceModel.value.toString()}',
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                  title: Text(
                                    serviceModel.description.toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    serviceModel.typeEmployee.toString(),
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                ),
          drawer: CustomDrawer(),
          floatingActionButton: ButtomCreateService(),
        );
      },
    );
  }
}
