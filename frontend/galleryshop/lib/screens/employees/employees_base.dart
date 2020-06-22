import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/employees/empleyees_list.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

class EmployeeBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funcioários'),
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
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmployeesList()
                  ) );
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
                onTap: (){},
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
                onTap: (){},
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
