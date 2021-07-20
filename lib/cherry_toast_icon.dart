import 'package:cherry_toast/resources/constants.dart';
import 'package:flutter/material.dart';

class CherryToatIcon extends StatelessWidget {
  ///the color that will be applied on the circle behind the icon
  ///
  final Color color;

  ///The toast icon widget
  ///
  final Widget icon;

  CherryToatIcon({required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DEFAULT_ICON_LAYOUT_SIZE,
      height: DEFAULT_ICON_LAYOUT_SIZE,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: this.color.withAlpha(20)),
      child: Center(child: this.icon),
    );
  }
}
