import 'package:cherry_toast/resources/constants.dart';
import 'package:flutter/material.dart';

class CherryToatIcon extends StatefulWidget {
  ///the color that will be applied on the circle behind the icon
  ///
  final Color color;

  ///The toast icon widget
  ///
  final Widget icon;

  CherryToatIcon({required this.color, required this.icon});

  @override
  _CherryToatIconState createState() => _CherryToatIconState();
}

class _CherryToatIconState extends State<CherryToatIcon>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _heartAnimation =
        Tween(begin: DEFAULT_ICON_SIZE * 0.5, end: DEFAULT_ICON_SIZE * 0.85)
            .animate(CurvedAnimation(
                curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
    _heartAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DEFAULT_ICON_LAYOUT_SIZE,
      height: DEFAULT_ICON_LAYOUT_SIZE,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: this.widget.color.withAlpha(20)),
      child: Center(
          child: AnimatedBuilder(
        builder: (context, child) {
          return this.widget.icon;
        },
        animation: this._heartAnimation,
      )),
    );
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }
}
