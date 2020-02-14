import 'package:flutter/material.dart';

typedef CalendarGridGetColorItem = Color Function(int dayOfMonth);

class CalendarGrid extends StatelessWidget {
  /// Year in YYYY notation.
  final int year;

  /// Month of the year.
  final int month;

  /// Size of the box (day item).
  /// Default 16.0
  final double dayItemSize;

  /// Radius of box.
  /// Default 2.0
  final double boderRadiusItem;

  /// Margin between items.
  /// Default 4.0
  final double marginItem;

  /// Get color of the box based on the date.
  final CalendarGridGetColorItem getColorOfDay;

  /// Get background color for the weekend
  final Color backgroundColorWeekend;

  /// Duration of the animation applied when color (data underneath) changes.
  final Duration animationDuration;

  /// Animation curve.
  /// Default Curves.linear
  final Curve animationCurve;

  CalendarGrid({
    @required this.year,
    @required this.month,
    this.dayItemSize = 16.0,
    this.boderRadiusItem = 2.0,
    this.marginItem = 4.0,
    this.backgroundColorWeekend = Colors.grey,
    @required this.animationDuration,
    this.animationCurve = Curves.linear,
    @required this.getColorOfDay,
  })  : assert(year != null),
        assert(month != null),
        assert(getColorOfDay != null),
        assert(animationDuration != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
      ret.add(_getEmtpyGridItem());
    }
    return ret;
  }

  Widget _getEmtpyGridItem() {
    return Container(
      height: dayItemSize,
      width: dayItemSize,
      margin: EdgeInsets.all(marginItem),
    );
  }

  List<Widget> _generateWeekContainers(int dayOfMonth, BuildContext context) {
    List<Widget> ret = [];
    DateTime newDay = DateTime(year, month, dayOfMonth);

    int maxday = _lastDayOfTheMonth();
    for (int i = newDay.weekday; i < 8; i++) {
      if (newDay.day <= maxday && newDay.month == month) {
        ret.add(Container(
          child: _getDayGridItem(newDay, context),
          color: _isWeekend(i) ? backgroundColorWeekend : null,
        ));
      } else {
        ret.add(_getEmtpyGridItem());
      }
      newDay = newDay.add(const Duration(days: 1));
    }
    return ret;
  }

  bool _isWeekend(int dayOfWeek) {
    DateTime moonlanding = DateTime(1969, 7, 20);
    if (moonlanding.weekday == 7) {
      return (dayOfWeek > 5);
    } else {
      return (dayOfWeek == 1 || dayOfWeek == 7);
    }
  }

  int _lastDayOfTheMonth() {
    DateTime dt =
        DateTime(month == 12 ? year + 1 : year, month == 12 ? 1 : month + 1, 0);
    return dt.day;
  }

  Widget _getDayGridItem(DateTime newDay, BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: animationCurve,
      margin: EdgeInsets.all(marginItem),
      height: dayItemSize,
      width: dayItemSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boderRadiusItem),
        color: getColorOfDay == null
            ? Theme.of(context).primaryColor
            : getColorOfDay(newDay.day),
      ),
    );
  }
}
