import 'package:example/bar_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:example/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.ID,
      routes: {
        HomePage.ID: (context) => HomePage(),
        BarChartPage.ID: (context) => BarChartPage(),
      },
    );
  }
}
