import 'package:chart_components/bar_char_component.dart';
import 'package:flutter/material.dart';
import 'data_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> emptyData = [];
  List<int> data;
  List<String> labels = [];
  bool startDrawing = true;

  _HomePageState() {
    data = emptyData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test barchart'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Data',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 300,
              child: BarChart(
                data: data,
                labels: labels,
                dislplayValue: true,
                reverse: true,
                getColor: DataRepository.getColor,
                getIcon: DataRepository.getIcon,
                barWidth: 20,
                barSeparation: 6,
                animationDuration: 1800,
                animationCurve: Curves.easeInOutSine,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Load data'),
                    onPressed: () {
                      setState(() {
                        data = DataRepository.getData();
                        labels = DataRepository.getLabels();
                      });
                    }),
                RaisedButton(
                  child: Text('Clear data'),
                  onPressed: () {
                    setState(() {
                      data = [];
                      labels = [];
                    });
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
