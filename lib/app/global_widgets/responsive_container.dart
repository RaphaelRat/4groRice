import 'package:flutter/material.dart';

Center responsiveContainer({required Widget child, double maxWidth = 720, double minHeight = 0, Color? color}) {
  return Center(
    child: Container(
      color: color,
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
      child: child,
    ),
  );
}
