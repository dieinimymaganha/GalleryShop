import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/client/DetailAccountClient.dart';
import 'package:galleryshop/screens/accounts/client/widget/dialog_exclude_service_record.dart';
import 'package:galleryshop/stores/billed_service_store.dart';

class EditServiceAccountClientScreen extends StatefulWidget {
  final int idClient;

  EditServiceAccountClientScreen({this.idClient});

  @override
  _EditServiceAccountClientScreenState createState() =>
      _EditServiceAccountClientScreenState(idClient: idClient);
}

class _EditServiceAccountClientScreenState
    extends State<EditServiceAccountClientScreen> {
  BilledServiceStore billedServiceStore = BilledServiceStore();

  _EditServiceAccountClientScreenState({int idClient})
      : billedServiceStore = BilledServiceStore(idClient: idClient);

  @override
  void initState() {
    super.initState();
    billedServiceStore.initPageEditServices();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Excluir Serviços'),
            centerTitle: true,
            backgroundColor: colorAppbar,
            leading: IconButton(
              icon: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailAccountClient(
                            idClient: billedServiceStore.idClient,
                          )));
                },
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Column(
                    children:
                        billedServiceStore.listServices.map((serviceRecordDto) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: colorCard,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: ListTile(
                                      title: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Data: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  serviceRecordDto.dateService
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Serviço: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.0),
                                                ),
                                                Text(
                                                  serviceRecordDto
                                                      .billedServiceDto
                                                      .description,
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Valor: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0),
                                                ),
                                                Text(serviceRecordDto
                                                    .billedServiceDto.value
                                                    .toString()),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Desconto: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0),
                                                ),
                                                Text(serviceRecordDto
                                                    .billedServiceDto.discount
                                                    .toString()),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Valor cobrado: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0),
                                                ),
                                                Text(serviceRecordDto
                                                    .billedServiceDto.valueFinal
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  DialogExcludeServiceRecord(
                                                    idService:
                                                        serviceRecordDto.id,
                                                    idClient: billedServiceStore
                                                        .idClient,
                                                  ));
                                        },
                                      ),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList())
              ],
            ),
          ),
        );
      },
    );
  }
}
