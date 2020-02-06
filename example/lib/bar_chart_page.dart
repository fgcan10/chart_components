import 'package:flutter/material.dart';
import 'data_repository.dart';
import 'package:chart_components/bar_chart_component.dart';

class BarChartPage extends StatefulWidget {
  static const String ID = 'barchartpage';

  @override
  _BarChartPageState createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  List<int> emptyData = [];
  List<int> data;
  List<String> labels = [];
  bool startDrawing = true;

  @override
  void initState() {
    super.initState();
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
            Expanded(
              flex: 5,
              child: BarChart(
                data: data,
                labels: labels,
                dislplayValue: true,
                reverse: true,
                getColor: DataRepository.getColor,
                getIcon: DataRepository.getIcon,
                barWidth: 42,
                barSeparation: 12,
                animationDuration: Duration(milliseconds: 1800),
                animationCurve: Curves.easeInOutSine,
                itemRadius: 30,
                iconHeight: 16,
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
