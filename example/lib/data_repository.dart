import 'package:flutter/material.dart';

class DataRepository {
  static List<int> data = [
    20,
    0,
    100,
    50,
    70,
    20,
    40,
    60,
    10,
    200,
    30,
    50,
    200,
    10,
    120,
    90,
    20,
    12,
    56,
    78,
    23,
    15,
    78,
    2,
    12,
    66,
  ];

  static List<int> getData() {
    return data;
  }

  static List<String> getLabels() {
    List<String> labels = ['1', 'holaque'];

    return labels;
  }

  static Color getColor(int value) {
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

  static Icon getIcon(int value) {
    if (value < 50) {
      return Icon(
        Icons.sentiment_dissatisfied,
        size: 16,
        color: getColor(value),
      );
    } else if (value < 100) {
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
