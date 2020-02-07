import 'package:flutter/material.dart';

class DataRepository {
  static List<double> data = [
    2,
    0,
    1,
    4,
    3,
    2,
    4,
    2,
    1,
    2,
    3,
    1,
    2,
    1,
    1,
    0,
    2,
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4,
    1,
  ];

  static List<double> getData() {
    return data;
  }

  static List<String> getLabels() {
    List<String> labels = ['a'];

    return labels;
  }

  static Color getColor(double value) {
    if (value < 50) {
      return Colors.red;
    } else if (value < 100) {
      return Colors.yellow;
    } else
      return Colors.green;
  }

  static Color getDayColor(int day) {
    if (day < data.length) {
      return getColor(data[day]);
    } else
      return Colors.indigo.shade100;
  }

  static Icon getIcon(double value) {
    if (value < 1) {
      return Icon(
        Icons.sentiment_dissatisfied,
        size: 16,
        color: getColor(value),
      );
    } else if (value < 2) {
      return Icon(
        Icons.sentiment_satisfied,
        size: 16,
        color: getColor(value),
      );
    } else
      return Icon(
        Icons.sentiment_very_satisfied,
        size: 16,
        color: getColor(value),
      );
  }
}
