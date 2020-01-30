library chart_components;

import 'package:flutter/material.dart';

typedef CalendarGridGetColorItem = Color Function(int dayOfMonth);

class CalendarGrid extends StatelessWidget {
  final int year;
  final int month;
  final double dailyItemSize;
  final CalendarGridGetColorItem getColorOfDay;

  CalendarGrid({
    this.year,
    this.month,
    this.dailyItemSize = 16.0,
    this.getColorOfDay,
  })  : assert(year != null),
        assert(month != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ..._generateRows(context),
      ],
    );
  }

  List<Row> _generateRows(BuildContext context) {
    List<Row> rows = [];
    int dayOfMonth = 1;
    do {
      List<Widget> children = [];
      List<Widget> temp;
      temp = _generateEmptyDayBoxes(dayOfMonth);
      children.addAll(temp);
      temp = _generateWeekContainers(dayOfMonth, context);
      children.addAll(temp);
      dayOfMonth += temp.length;
      Row first = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
      rows.add(first);
    } while (dayOfMonth < 31);
    return rows;
  }

  List<Widget> _generateEmptyDayBoxes(int dayOfMonth) {
    int dayofweek = DateTime(year, month, dayOfMonth).weekday;
    List<Widget> ret = [];
    for (int i = 1; i < dayofweek; i++) {
      ret.add(Container(
        height: dailyItemSize,
        width: dailyItemSize,
        margin: EdgeInsets.all(4),
      ));
    }
    return ret;
  }

  List<Widget> _generateWeekContainers(int dayOfMonth, BuildContext context) {
    List<Widget> ret = [];
    DateTime newDay = DateTime(year, month, dayOfMonth);
    DateTime thismoment = DateTime.now();
    int dayofweek = newDay.weekday;
    for (int i = dayofweek; i < 8 && dayOfMonth < 32; i++) {
      ret.add(Container(
        child: _getContainerOfDay(newDay, context),
        color: (i > 5 && newDay.isBefore(thismoment))
            ? Colors.grey.shade400
            : null,
      ));
      newDay = newDay.add(const Duration(days: 1));
    }
    return ret;
  }

  Widget _getContainerOfDay(DateTime newDay, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: dailyItemSize,
      width: dailyItemSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: getColorOfDay == null
            ? Theme.of(context).primaryColor
            : getColorOfDay(newDay.day),
      ),
    );
  }
}
