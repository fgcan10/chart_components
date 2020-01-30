import 'package:flutter/material.dart';

class DataRepository {
  static List<int> getData() {
    List<int> ret = [
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

    return ret;
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

  static Icon getIcon(int value) {
    if (value < 50) {
      return Icon(
        Icons.thumb_down,
        size: 16,
        color: getColor(value),
      );
    } else if (value < 100) {
      return Icon(
        Icons.bluetooth_audio,
        size: 16,
        color: getColor(value),
      );
    } else
      return Icon(
        Icons.thumb_up,
        size: 16,
        color: getColor(value),
      );
  }
}
