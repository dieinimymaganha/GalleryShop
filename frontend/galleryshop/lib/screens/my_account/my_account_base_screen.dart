import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/employee/detail_account_employee.dart';
import 'package:galleryshop/screens/employees/create_new_employee_screen.dart';

import 'package:galleryshop/stores/my_account_store.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

class MyAccountBaseScreen extends StatefulWidget {
  @override
  _MyAccountBaseScreenState createState() => _MyAccountBaseScreenState();
}

class _MyAccountBaseScreenState extends State<MyAccountBaseScreen> {
  MyAccountStore myAccountStore = MyAccountStore();

  @override
  void initState() {
    super.initState();
    myAccountStore.getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Minha conta'),
            backgroundColor: colorAppbar,
            centerTitle: true,
          ),
          body: myAccountStore.loadingPage
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 2, left: 8, right: 8),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          child: ListTile(
                            title: Text('Consultar saldo conta'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailAccountEmployee(
                                      idEmployee: myAccountStore.employeeDto.id,
                                      consultMyAccount: true,
                                    )));
                          },
                        ),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                        GestureDetector(
                          child: ListTile(
                            title: Text('Alterar meus dados'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateNewEmployeeScreen(
                                      employeeModel: myAccountStore.employeeDto,
                                  editMyAccount: true,
                                    )));
                          },
                        ),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                        GestureDetector(
                          child: ListTile(
                            title: Text('Alterar senha'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          onTap: () {},
                        ),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
          drawer: CustomDrawer(),
        );
      },
    );
  }
}
