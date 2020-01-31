import 'package:chart_components/calendar_grid_component.dart';
import 'package:example/data_repository.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'January',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              width: 200,
              color: Colors.blueGrey.shade100,
              child: CalendarGrid(
                year: 2020,
                month: 1,
                getColorOfDay: DataRepository.getDayColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
