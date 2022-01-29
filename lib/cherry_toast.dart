import 'dart:async';
import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:cherry_toast/resources/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CherryToast extends StatefulWidget {
  CherryToast({
    Key? key,
    required this.title,
    required this.icon,
    required this.themeColor,
    this.iconColor = Colors.black,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = POSITION.top,
    this.animationDuration = defaultAnimationDuration,
    this.animationCurve = defaultAnimationCurve,
    this.animationType = ANIMATION_TYPE.fromLeft,
    this.autoDismiss = false,
    this.toastDuration = defaultToastDuration,
    this.layout = TOAST_LAYOUT.ltr,
    this.displayCloseButton = true,
    this.borderRadius = defaultRadius,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconSize = defaultIconSize,
  }) : super(key: key);

  CherryToast.success({
    Key? key,
    required this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = POSITION.top,
    this.animationDuration = defaultAnimationDuration,
    this.animationCurve = defaultAnimationCurve,
    this.animationType = ANIMATION_TYPE.fromLeft,
    this.autoDismiss = false,
    this.toastDuration = defaultToastDuration,
    this.layout = TOAST_LAYOUT.ltr,
    this.displayCloseButton = true,
    this.borderRadius = defaultRadius,
    this.displayIcon = true,
    this.enableIconAnimation = true,
  }) : super(key: key) {
    icon = Icons.check_circle;
    _initializeAttributes(successColor);
  }

  CherryToast.error({
    Key? key,
    required this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = POSITION.top,
    this.animationDuration = defaultAnimationDuration,
    this.animationCurve = defaultAnimationCurve,
    this.animationType = ANIMATION_TYPE.fromLeft,
    this.autoDismiss = false,
    this.toastDuration = defaultToastDuration,
    this.layout = TOAST_LAYOUT.ltr,
    this.displayCloseButton = true,
    this.borderRadius = defaultRadius,
    this.displayIcon = true,
    this.enableIconAnimation = true,
  }) : super(key: key) {
    icon = Icons.error_rounded;
    _initializeAttributes(errorColor);
  }

  CherryToast.warning({
    Key? key,
    required this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = POSITION.top,
    this.animationDuration = defaultAnimationDuration,
    this.animationCurve = defaultAnimationCurve,
    this.animationType = ANIMATION_TYPE.fromLeft,
    this.autoDismiss = false,
    this.toastDuration = defaultToastDuration,
    this.layout = TOAST_LAYOUT.ltr,
    this.displayCloseButton = true,
    this.borderRadius = defaultRadius,
    this.displayIcon = true,
    this.enableIconAnimation = true,
  }) : super(key: key) {
    icon = Icons.warning_rounded;
    _initializeAttributes(warningColor);
  }

  CherryToast.info({
    Key? key,
    required this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = POSITION.top,
    this.animationDuration = defaultAnimationDuration,
    this.animationCurve = defaultAnimationCurve,
    this.animationType = ANIMATION_TYPE.fromLeft,
    this.autoDismiss = false,
    this.toastDuration = defaultToastDuration,
    this.layout = TOAST_LAYOUT.ltr,
    this.displayCloseButton = true,
    this.borderRadius = defaultRadius,
    this.displayIcon = true,
    this.enableIconAnimation = true,
  }) : super(key: key) {
    icon = Icons.info_rounded;
    _initializeAttributes(infoColor);
  }

  void _initializeAttributes(Color color) {
    themeColor = color;
    iconColor = color;
    iconSize = defaultIconSize;
  }

  //TODO update code documentation
  final Text title;

  //TODO update code documentation
  final Text? description;

  ///The toast action button text
  ///
  final Text? action;


  ///indicates whether display or not the title
  ///
  final bool displayTitle;

  ///the toast icon, it's required when using the default constructor
  ///
  late IconData icon;

  ///the Icon color
  ///this parameter is only available on the default constructor
  ///for the built-in themes the color  will be set automatically
  late Color iconColor;

  ///the icon size
  ///by default is 20
  ///this parameter is available in default constructor
  late double iconSize;

  ///the toast display postion, possible values
  ///```dart
  ///{
  ///top,
  ///bottom
  ///}
  ///```
  final POSITION toastPosition;

  ///The color that will be applied on the circle behind the icon
  ///for better rendering the action button must have the same color
  ///
  late Color themeColor;

  ///the function invoked when clicking on the action button
  ///
  final Function? actionHandler;

  ///The duration of the animation by default it's 1.5 seconds
  ///
  final Duration animationDuration;

  ///the animation curve by default it's set to `Curves.ease`
  ///
  final Cubic animationCurve;

  ///The animation type applied on the toast
  ///```dart
  ///{
  ///fromTop,
  ///fromLeft,
  ///fromRight
  ///}
  ///```
  final ANIMATION_TYPE animationType;

  ///indicates whether the toast will be hidden automatically or not
  ///
  final bool autoDismiss;

  ///the duration of the toast if [autoDismiss] is true
  ///by default it's 3 seconds
  ///
  final Duration toastDuration;

  ///the layout of the toast
  ///```dart
  ///{
  ///ltr,
  ///rtl
  ///}
  ///```
  final TOAST_LAYOUT layout;

  ///Display / Hide the close button icon
  ///by default it's true
  final bool displayCloseButton;

  ///define the border radius applied on the toast
  ///by default it's 20
  ///
  final double borderRadius;

  ///Define whether the icon will be  rendered or not
  ///
  final bool displayIcon;

  ///Define wether the animation on the icon will be rendered or not
  ///
  final bool enableIconAnimation;

  ///Display the created cherry toast
  ///[context] the context of the application
  ///
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        barrierDismissible: autoDismiss,
        barrierColor: Colors.black.withOpacity(0.3),
        pageBuilder: (context, _, __) => SafeArea(
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Column(
              mainAxisAlignment: toastPosition == POSITION.bottom
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: this,
                ),
              ],
            ),
          ),
        ),
        opaque: false,
      ),
    );
  }

  @override
  _CherryToastState createState() => _CherryToastState();
}

class _CherryToastState extends State<CherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;
  late BoxDecoration toastDecoration;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    toastDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    );
    if (widget.autoDismiss) {
      Timer(widget.toastDuration, () {
        slideController.reverse();
        Timer(widget.animationDuration, () {
          Navigator.pop(context);
        });
      });
    }
  }

  ///Initialize animation parameters [slideController] and [offsetAnimation]
  void _initAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    switch (widget.animationType) {
      case ANIMATION_TYPE.fromLeft:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      case ANIMATION_TYPE.fromRight:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      case ANIMATION_TYPE.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -2),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      default:
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.layout == TOAST_LAYOUT.ltr) {
      return _renderLeftLayoutToast(context);
    } else {
      return _renderRightLayoutToast(context);
    }
  }

  ///render a left layout toast if [this.widget.layout] set to LTR
  ///
  Widget _renderLeftLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.toastPosition == POSITION.top
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: toastDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment:
                          widget.description == null && widget.action == null
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                      children: [
                        widget.displayIcon
                            ? CherryToatIcon(
                                color: widget.themeColor,
                                icon: widget.icon,
                                iconSize: widget.iconSize,
                                iconColor: widget.iconColor,
                                enableAnimation: widget.enableIconAnimation,
                              )
                            : Container(),
                        _renderToastContent(),
                      ],
                    ),
                  ),
                  widget.displayCloseButton
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            right: 10,
                          ),
                          child: _renderCloseButton(context),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///render a right layout toast if [this.widget.layout] set to RTL
  ///
  Column _renderRightLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.toastPosition == POSITION.top
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: toastDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.displayCloseButton
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          child: _renderCloseButton(context),
                        )
                      : Container(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment:
                          widget.description == null && widget.action == null
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                      children: [
                        _renderToastContent(),
                        CherryToatIcon(
                          color: widget.themeColor,
                          icon: widget.icon,
                          iconSize: widget.iconSize,
                          iconColor: widget.iconColor,
                          enableAnimation: widget.enableIconAnimation,
                        ),
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

  /// render the close button icon with a clickable  widget that
  /// will hide the toast
  ///
  InkWell _renderCloseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        slideController.reverse();
        Timer(
          widget.animationDuration,
          () {
            Navigator.pop(context);
          },
        );
      },
      child: Icon(
        Icons.close,
        color: Colors.grey[500],
        size: closeButtonSize,
      ),
    );
  }

  ///render the toast content (Title, Description and Action)
  ///
  Expanded _renderToastContent() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: widget.layout == TOAST_LAYOUT.ltr
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            widget.displayTitle
                ? widget.title
                : Container(),
            widget.description == null
                ? Container()
                : Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      widget.description!
                    ],
                  ),
            widget.action != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          widget.actionHandler?.call();
                        },
                        child: widget.action,
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
