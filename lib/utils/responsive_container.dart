import 'package:flutter/material.dart';

Center responsiveContainer({required Widget child, double maxWidth = 720, double minHeight = 0}) {
  return Center(
    child: Container(
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
      child: child,
    ),
  );
}
