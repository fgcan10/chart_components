import 'package:chart_components/calendar_grid_component.dart';
import 'package:flutter/material.dart';

class CalendarGridPage extends StatefulWidget {
  static const String ID = 'calendargridpage';

  @override
  _CalendarGridPageState createState() => _CalendarGridPageState();
}

class _CalendarGridPageState extends State<CalendarGridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid calendar'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Mes',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Container(
            child: CalendarGrid(
              year: 2020,
              month: 1,
            ),
          ),
          Divider(),
          RaisedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
