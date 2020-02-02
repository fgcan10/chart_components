import 'package:flutter/material.dart';
import 'bar_chart_item_component.dart';

class BarChart extends StatelessWidget {
  final List<int> data;
  final List<String> labels;
  final bool dislplayValue;
  final BarCharGetColor getColor;
  final BarCharGetIcon getIcon;
  final double barWidth;
  final double barSeparation;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool reverse;
  final double itemRadius;

  BarChart(
      {this.labels = const [],
      @required this.data,
      this.reverse = false,
      this.dislplayValue = true,
      this.getColor,
      this.getIcon,
      this.barWidth = 32,
      this.barSeparation = 10,
      @required this.animationDuration,
      this.itemRadius = 10,
      this.animationCurve = Curves.easeInOutSine})
      : assert(data != null),
        assert(animationDuration != null);

  @override
  Widget build(BuildContext context) {
    bool wasEmpty = false;
    if (data.length == 0) {
      _initEmptyData(context);
      wasEmpty = true;
    }

    bool showLabels = !(labels.length == 0);

    int maxValue = _getMaxData();

    return ListView.separated(
      itemCount: data.length,
      reverse: reverse,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _getBarItem(
            context,
            reverse ? (index - data.length + 1) * -1 : index,
            wasEmpty,
            showLabels,
            maxValue);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: barSeparation,
        );
      },
    );
  }

  Widget _getBarItem(
    BuildContext context,
    int index,
    bool hideValue,
    bool showLabels,
    int maxValue,
  ) {
    return BarItem(
      width: barWidth,
      value: data[index],
      label: labels.length > index ? labels[index] : null,
      showLabels: showLabels,
      heightFactor: data[index] / maxValue,
      duration: animationDuration,
      getColor: getColor,
      getIcon: getIcon,
      radius: itemRadius,
      hideValue: hideValue,
    );
  }

  void _initEmptyData(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemsize = barWidth + barSeparation;
    int totalItems = (width / itemsize).round();

    for (int i = 0; i < totalItems; i++) {
      data.add(0);
    }
  }

  int _getMaxData() {
    int max = 1;
    for (var num in data) {
      if (num > max) max = num;
    }
    return max;
  }
}
