import 'dart:math';

import 'package:chart_components/calendar_grid_component.dart';
import 'package:example/data_repository.dart';
import 'package:flutter/material.dart';

class CalendarGridPage extends StatefulWidget {
  static const String ID = 'calendargridpage';

  @override
  _CalendarGridPageState createState() => _CalendarGridPageState();
}

class _CalendarGridPageState extends State<CalendarGridPage> {
  List<double> data = [];
  List<String> labels = [];
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    DataRepository.clearData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid calendar example'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'January',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: CalendarGrid(
                  year: 2020,
                  month: 1,
                  getColorOfDay: DataRepository.getDayColor,
                  animationDuration: Duration(milliseconds: 1500),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Refresh data',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: _loadData,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loadData() {
    setState(() {
      if (!loaded) {
        data = DataRepository.getData();
        loaded = true;
      } else {
        data[data.length - 1] = (Random().nextDouble() * 700).round() / 100;
      }
      labels = DataRepository.getLabels();
    });
  }
}
