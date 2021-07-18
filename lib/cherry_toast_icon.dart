import 'package:flutter/material.dart';

class CherryToatIcon extends StatelessWidget {
  final Color color;
  final Widget icon;

  CherryToatIcon({required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: this.color.withAlpha(20)),
      child: Center(child: this.icon),
    );
  }
}
