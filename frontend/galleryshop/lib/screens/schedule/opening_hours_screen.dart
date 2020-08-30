import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/widgets/custom_form.dart';

class OpeningHoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horario de atendimento'),
        centerTitle: true,
        backgroundColor: colorAppbar,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BaseScreen()));
            },
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onLongPress: (){},
              child: Card(
                shape: (RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                color: colorCard,
                child: ExpansionTile(
                  title: Text('Segunda', style: TextStyle(fontSize: 20),),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        TextFormField()
                      ],
                    )
                  ],

                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
