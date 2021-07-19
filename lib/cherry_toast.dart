import 'dart:async';

import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:cherry_toast/resources/constants.dart';
import 'package:cherry_toast/resources/images.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CherryToast extends StatefulWidget {
  CherryToast(
      {required this.title,
      required this.action,
      required this.icon,
      required this.themeColor,
      this.actionHandler,
      this.description,
      this.descriptionStyle,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.displayAction = true,
      this.toastPosition = POSITION.TOP,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR});

  CherryToast.success(
      {required this.title,
      required this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: SUCCESS_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.displayAction = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = SUCCESS_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR}) {
    this.icon = Image(
      image: AssetImage(SUCCESS_ICON, package: PACKAGE_NAME),
      width: 20,
    );
  }

  CherryToast.error(
      {required this.title,
      required this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: ERROR_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.displayAction = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = SUCCESS_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR}) {
    this.icon = Image(
      image: AssetImage(ERROR_ICON, package: PACKAGE_NAME),
      width: 20,
    );
  }

  CherryToast.warning(
      {required this.title,
      required this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: WARINING_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.displayAction = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = SUCCESS_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR}) {
    this.icon = Image(
      image: AssetImage(WARNING_ICON, package: PACKAGE_NAME),
      width: 20,
    );
  }

  CherryToast.info(
      {required this.title,
      required this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: INFO_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.displayAction = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = SUCCESS_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR}) {
    this.icon = Image(
      image: AssetImage(INFO_ICON, package: PACKAGE_NAME),
      width: 20,
    );
  }

  final String title;
  final String? description;
  final String action;
  final TextStyle titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle actionStyle;
  final bool displayTitle;
  final bool displayAction;
  late Widget icon;
  final POSITION toastPosition;
  final Color themeColor;
  final Function? actionHandler;
  final Duration animationDuration;
  final Cubic animationCurve;
  final ANIMATION_TYPE animationType;
  final bool autoDismiss;
  final Duration toastDuration;
  final TOAST_LAYOUT layout;

  show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(0),
            elevation: 0,
            content: this,
          );
        });
  }

  @override
  _CherryToastState createState() => _CherryToastState();
}

class _CherryToastState extends State<CherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    if (this.widget.autoDismiss) {
      Timer(this.widget.toastDuration, () {
        slideController.reverse();
        Timer(this.widget.animationDuration, () {
          Navigator.pop(context);
        });
      });
    }
  }

  _initAnimation() {
    slideController = AnimationController(
      duration: this.widget.animationDuration,
      vsync: this,
    );
    switch (this.widget.animationType) {
      case ANIMATION_TYPE.FROM_LEFT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      case ANIMATION_TYPE.FROM_RIGHT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      case ANIMATION_TYPE.FROM_TOP:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -2),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      default:
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.layout == TOAST_LAYOUT.LTR) {
      return _renderLeftLayoutToast(context);
    } else {
      return _renderRightLayoutToast(context);
    }
  }

  Column _renderLeftLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: this.widget.toastPosition == POSITION.TOP
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CherryToatIcon(
                            color: this.widget.themeColor,
                            icon: this.widget.icon),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                this.widget.displayTitle
                                    ? Text(this.widget.title,
                                        style: this.widget.titleStyle)
                                    : Container(),
                                SizedBox(
                                  height: 5,
                                ),
                                this.widget.description == null
                                    ? Container()
                                    : Text(this.widget.description ?? ""),
                                SizedBox(
                                  height: 5,
                                ),
                                this.widget.displayAction
                                    ? InkWell(
                                        onTap: () {
                                          this.widget.actionHandler?.call();
                                        },
                                        child: Text(this.widget.action,
                                            style: this.widget.actionStyle))
                                    : Container()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        slideController.reverse();
                        Timer(this.widget.animationDuration, () {
                          Navigator.pop(context);
                        });
                      },
                      child: Image(
                        image: AssetImage(CLOSE_ICON, package: PACKAGE_NAME),
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _renderRightLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: this.widget.toastPosition == POSITION.TOP
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: InkWell(
                      onTap: () {
                        slideController.reverse();
                        Timer(this.widget.animationDuration, () {
                          Navigator.pop(context);
                        });
                      },
                      child: Image(
                        image: AssetImage(CLOSE_ICON, package: PACKAGE_NAME),
                        width: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                this.widget.displayTitle
                                    ? Text(this.widget.title,
                                        style: this.widget.titleStyle)
                                    : Container(),
                                SizedBox(
                                  height: 5,
                                ),
                                this.widget.description == null
                                    ? Container()
                                    : Text(this.widget.description ?? ""),
                                SizedBox(
                                  height: 5,
                                ),
                                this.widget.displayAction
                                    ? InkWell(
                                        onTap: () {
                                          this.widget.actionHandler?.call();
                                        },
                                        child: Text(this.widget.action,
                                            style: this.widget.actionStyle))
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                        CherryToatIcon(
                            color: this.widget.themeColor,
                            icon: this.widget.icon),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
