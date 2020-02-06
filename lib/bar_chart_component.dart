import 'package:flutter/material.dart';
import 'bar_chart_item_component.dart';

enum _Slot {
  chart,
  baseline,
  divider14,
  divider24,
  divider34,
}

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
  final double footerHeight;
  final double iconHeight;
  final double headerValueHeight;
  final Color lineGridColor;

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
      this.footerHeight = 32,
      this.iconHeight = 0,
      this.headerValueHeight = 16,
      this.lineGridColor,
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
    return CustomMultiChildLayout(
      delegate: FollowTheGridLines(
        header: this.headerValueHeight + this.iconHeight,
        footer: this.footerHeight,
      ),
      children: <Widget>[
        LayoutId(
          id: _Slot.baseline,
          child: Divider(
            color: lineGridColor,
            thickness: 0.5,
          ),
        ),
        LayoutId(
          id: _Slot.divider14,
          child: Divider(
            color: lineGridColor,
            thickness: 0.5,
          ),
        ),
        LayoutId(
          id: _Slot.divider24,
          child: Divider(
            color: lineGridColor,
            thickness: 0.5,
          ),
        ),
        LayoutId(
          id: _Slot.divider34,
          child: Divider(
            color: lineGridColor,
            thickness: 0.5,
          ),
        ),
        LayoutId(
          id: _Slot.chart,
          child: ListView.separated(
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
          ),
        ),
      ],
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
      footerHeight: footerHeight,
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

class FollowTheGridLines extends MultiChildLayoutDelegate {
  final double header;
  final double footer;

  FollowTheGridLines({this.header, this.footer}) : super();

  @override
  void performLayout(Size size) {
    Size leaderSize = Size.zero;
    print('size ' + size.height.toString());

    if (hasChild(_Slot.chart)) {
      leaderSize = layoutChild(_Slot.chart, BoxConstraints.loose(size));
      positionChild(_Slot.chart, Offset.zero);
    }
    print('leader size ' + leaderSize.height.toString());

    Size dividerSize = Size(leaderSize.width, 1.0);
    double gridBottom = leaderSize.height - footer;
    double gridTop = header;

    if (hasChild(_Slot.baseline)) {
      layoutChild(_Slot.baseline, BoxConstraints.tight(dividerSize));
      positionChild(_Slot.baseline, Offset(0, gridBottom));
    }

    if (hasChild(_Slot.divider14)) {
      layoutChild(_Slot.divider14, BoxConstraints.tight(dividerSize));
      positionChild(_Slot.divider14,
          Offset(0, gridBottom - ((gridBottom - gridTop) / 4)));
    }

    if (hasChild(_Slot.divider24)) {
      layoutChild(_Slot.divider24, BoxConstraints.tight(dividerSize));
      positionChild(_Slot.divider24,
          Offset(0, gridBottom - ((gridBottom - gridTop) / 2)));
    }

    if (hasChild(_Slot.divider34)) {
      layoutChild(_Slot.divider34, BoxConstraints.tight(dividerSize));
      positionChild(_Slot.divider34,
          Offset(0, gridBottom - ((gridBottom - gridTop) * 3 / 4)));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
