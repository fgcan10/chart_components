import 'package:example/bar_chart_page.dart';
import 'package:example/calendar_grid_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String ID = 'homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test charts'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Charts',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Bar chart'),
                  onPressed: () {
                    Navigator.pushNamed(context, BarChartPage.ID);
                  },
                )
              ],
            ),
            Divider(),
            Text(
              'Calendar grid',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Calendar grid'),
                  onPressed: () {
                    Navigator.pushNamed(context, CalendarGridPage.ID);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
