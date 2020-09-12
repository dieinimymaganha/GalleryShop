import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';

class ScheduleTimesScreen extends StatefulWidget {
  @override
  _ScheduleTimesScreenState createState() => _ScheduleTimesScreenState();
}

class _ScheduleTimesScreenState extends State<ScheduleTimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Agenda'),
        backgroundColor: colorAppbar,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: colorCard,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      topRow(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            7,
                            (index) => dateWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                cardWidget(),
                cardWidget(),
                cardWidget(),
                cardWidget(),
                cardWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                '13:00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              lineGen(
                lines: [20.0, 30.0, 40.0, 10.0],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
                color: colorAppbar,
                borderRadius: (BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)))),
            child: Container(
              margin: EdgeInsets.only(left: 4.0),
              color: colorCard,
              padding: EdgeInsets.only(
                left: 16.0,
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 21.0,
                    child: Row(
                      children: <Widget>[
                        Text('13:00 - 14:00 | '),
                        Text('Zé'),
                      ],
                    ),
                  ),
                  Text(
                    "Corte de Cabelo",
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class lineGen extends StatelessWidget {
  final lines;

  const lineGen({
    Key key,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            4,
            (index) => Container(
                  height: 2.0,
                  width: lines[index],
                  color: Color(0xffd0d2d8),
                  margin: EdgeInsets.symmetric(vertical: 14.0),
                )));
  }
}

class topRow extends StatelessWidget {
  const topRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Horários',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'agendados',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Jan',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class dateWidget extends StatefulWidget {
  @override
  _dateWidgetState createState() => _dateWidgetState();
}

class _dateWidgetState extends State<dateWidget> {
  bool _selectDate = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectDate = !_selectDate;
        });
      },
      child: Container(
        decoration: _selectDate
            ? null
            : BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Mo',
              style: TextStyle(
                  fontWeight: _selectDate ? FontWeight.normal : FontWeight.bold,
                  color: _selectDate ? Colors.black54 : Colors.white),
            ),
            Text('10',
                style: TextStyle(
                    fontWeight:
                        _selectDate ? FontWeight.normal : FontWeight.bold,
                    color: _selectDate ? Colors.black54 : Colors.white)),
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectDate ? Colors.black54 : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
