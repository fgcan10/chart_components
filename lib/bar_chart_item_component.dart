import 'package:flutter/material.dart';

typedef BarCharGetColor = Color Function(int value);
typedef BarCharGetIcon = Icon Function(int value);

class BarItem extends ImplicitlyAnimatedWidget {
  final BarCharGetColor getColor;
  final BarCharGetIcon getIcon;
  final double heightFactor;
  final double width;
  final int value;
  final String label;
  final bool hideValue;
  final bool dislplayValue;

  const BarItem({
    Key key,
    @required this.heightFactor,
    @required this.width,
    @required this.value,
    this.label,
    this.dislplayValue = true,
    this.hideValue = false,
    @required this.getColor,
    this.getIcon,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  @override
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends AnimatedWidgetBaseState<BarItem> {
  Tween<double> _transform;

  @override
  void forEachTween(visitor) {
    _transform = visitor(_transform, widget.heightFactor,
        (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: widget.width,
          child: widget.getIcon == null || widget.hideValue
              ? null
              : widget.getIcon(widget.value),
        ),
        SizedBox(
          width: widget.width,
          child: Text(
            widget.hideValue || !widget.dislplayValue
                ? ''
                : widget.value.toString(),
            textAlign: TextAlign.center,
            softWrap: false,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        Flexible(
          flex: 10,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: _transform.evaluate(animation),
            child: Container(
              width: widget.width,
              decoration: BoxDecoration(
                  color: widget.getColor == null
                      ? Theme.of(context).primaryColor
                      : widget.getColor(widget.value),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
          ),
        ),
        SizedBox(
          width: widget.width,
          height: Theme.of(context).textTheme.subhead.height,
          child: Text(
            widget.label == null ? '' : widget.label,
            softWrap: false,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
      ],
    );
  }
}
