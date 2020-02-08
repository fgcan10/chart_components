import 'package:example/bar_chart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String ID = 'homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts example'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Text(
                'Bar Chart + Calendar Grid',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1,
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
                      'Bar chart',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, BarChartPage.ID);
                    },
                  ),
                )),
            Divider(),
          ],
        ),
      ),
    );
  }
}
