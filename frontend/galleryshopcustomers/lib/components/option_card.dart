import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback _onTap;

  OptionCard(this.title, this.icon, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 90,
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        margin: EdgeInsets.all(0),
        child: InkWell(
          onTap: _onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  color: colorGradientBottom,
                ),
                Spacer(),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
