import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name_button;
  final IconData icon;
  final Function onConfirm;

  CustomButton({this.name_button, this.icon, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            Color(0XFF212121),
            Color(0XFF616161),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name_button,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),

              Container(
                child: SizedBox(
                  child: Icon(icon),
                  height: 28,
                  width: 28,
                ),
              )
            ],
          ),
          onPressed: () {
            onConfirm();
          },
        ),
      ),
    );
  }
}
