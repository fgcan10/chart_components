import 'package:flutter/material.dart';

typedef BarCharGetColor = Color Function(int value);
typedef BarCharGetIcon = Icon Function(int value);

class BarChart extends StatelessWidget {
  final List<int> data;
  final List<String> labels;
  final bool dislplayValue;
  final BarCharGetColor getColor;
  final BarCharGetIcon getIcon;
  final double barWidth;
  final double barSeparation;
  final int animationDuration;
  final Curve animationCurve;
  final bool reverse;

  BarChart(
      {this.labels = const [],
      @required this.data,
      this.reverse = false,
      this.dislplayValue = true,
      this.getColor,
      this.getIcon,
      this.barWidth = 32,
      this.barSeparation = 10,
      this.animationDuration = 1500,
      this.animationCurve = Curves.easeInOutSine})
      : assert(data != null);

  @override
  Widget build(BuildContext context) {
    bool wasEmpty = false;
    if (data.length == 0) {
      _initEmptyData(context);
      wasEmpty = true;
    }
    return ListView.separated(
      itemCount: data.length,
      reverse: reverse,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return getBarItem(context,
            reverse ? (index - data.length + 1) * -1 : index, wasEmpty);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: barSeparation,
        );
      },
    );
  }

  Widget getBarItem(BuildContext context, int index, bool hideValue) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: barWidth,
                child: this.getIcon == null || hideValue
                    ? null
                    : getIcon(data[index]),
              ),
              SizedBox(
                width: barWidth,
                child: Text(
                  hideValue || !dislplayValue ? '' : data[index].toString(),
                  textAlign: TextAlign.center,
                  softWrap: false,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              AnimatedContainer(
                curve: animationCurve,
                duration: Duration(milliseconds: animationDuration),
                height: data[index].toDouble(),
                child: SizedBox.fromSize(
                  size: Size(barWidth, data[index].toDouble()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: this.getColor == null
                            ? Theme.of(context).primaryColor
                            : getColor(data[index]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                width: barWidth,
                height: labels.length > 0
                    ? Theme.of(context).textTheme.subhead.height
                    : 0,
                child: Text(
                  labels.length > index ? labels[index] : '',
                  softWrap: false,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ],
      ),
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
}
