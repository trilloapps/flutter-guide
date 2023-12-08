
import 'package:flutter/material.dart';
import '../diammensions.dart';


extension IntExtension on int {
  // Extension use for sized box
  // To create space vertically of horizontally

  Widget get height => SizedBox(height: widgetHeight(toDouble()));

  Widget get width => SizedBox(width: widgetWidth(toDouble()));

  // Extension use for height and width of the widget

  double get ht => widgetHeight(toDouble());

  double get wt => widgetWidth(toDouble());
}
