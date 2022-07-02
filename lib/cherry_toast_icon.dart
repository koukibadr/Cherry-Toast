import 'package:flutter/material.dart';

class CherryToastIcon extends StatefulWidget {
  ///the color that will be applied on the circle behind the icon
  ///(required)
  final Color color;

  ///The toast icon widget (required)
  ///
  final IconData icon;

  ///the size of the icon (required)
  ///
  final double iconSize;

  ///the icon color (required)
  final Color iconColor;

  ///define wether the animation will be applied on the icon or not
  ///
  final bool enableAnimation;

  const CherryToastIcon({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.enableAnimation,
  }) : super(key: key);

  @override
  _CherryToastIconState createState() => _CherryToastIconState();
}

class _CherryToastIconState extends State<CherryToastIcon>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      _heartAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1200,
        ),
      );
      _heartAnimation = Tween(
        begin: widget.iconSize * 0.7,
        end: widget.iconSize * 0.95,
      ).animate(
        CurvedAnimation(
          curve: Curves.bounceOut,
          parent: _heartAnimationController,
        ),
      );

      _heartAnimationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _heartAnimationController.repeat();
        }
      });
      _heartAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color.withAlpha(20),
      ),
      child: Center(
        child: widget.enableAnimation
            ? AnimatedBuilder(
                builder: (context, child) {
                  return Icon(
                    widget.icon,
                    size: _heartAnimation.value,
                    color: widget.iconColor,
                  );
                },
                animation: _heartAnimationController,
              )
            : Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.enableAnimation) {
      _heartAnimationController.dispose();
    }
    super.dispose();
  }
}
