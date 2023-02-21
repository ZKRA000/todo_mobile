import 'package:flutter/material.dart';

Offset? getWidgetOffset(GlobalKey key) {
  RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
  return renderBox?.localToGlobal(Offset.zero);
}
