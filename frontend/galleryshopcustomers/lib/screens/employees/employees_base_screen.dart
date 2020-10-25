import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/screens/employees/type_employees_list_screen.dart';
import 'package:galleryshopcustomers/widgets/drawer/custom_drawer.dart';

import 'create_new_employee_screen.dart';
import 'empleyees_list_screen.dart';


class EmployeeBaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funcionários'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 2, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  title: Text('Listar Funcionários'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EmployeesListScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Listar Tipo de funcionários'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TypeEmployeeListScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Cadastrar novo funcionários'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateNewEmployeeScreen()));
                },
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
  }
}
