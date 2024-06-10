import 'dart:async';

import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:cherry_toast/resources/extensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CherryToast extends StatefulWidget {
  //Overlay that does not block the screen
  OverlayEntry? overlayEntry;

  CherryToast({
    Key? key,
    this.title,
    required this.icon,
    required this.themeColor,
    this.iconColor = Colors.black,
    this.action,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.actionHandler,
    this.description,
    this.iconWidget,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.textDirection = TextDirection.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconSize = 20,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.inheritThemeColors = false,
    this.onToastClosed,
  }) : super(key: key) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
  }

  CherryToast.success({
    Key? key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.textDirection = TextDirection.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.iconWidget,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.inheritThemeColors = false,
    this.onToastClosed,
  }) : super(key: key) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.check_circle;
    _initializeAttributes(successColor);
  }

  CherryToast.error({
    Key? key,
    this.title,
    this.action,
    this.actionHandler,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.description,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.iconWidget,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.textDirection = TextDirection.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.inheritThemeColors = false,
    this.onToastClosed,
  }) : super(key: key) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.error_rounded;
    _initializeAttributes(errorColor);
  }

  CherryToast.warning({
    Key? key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.textDirection = TextDirection.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.iconWidget,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.inheritThemeColors = false,
    this.onToastClosed,
  }) : super(key: key) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.warning_rounded;
    _initializeAttributes(warningColor);
  }

  CherryToast.info({
    Key? key,
    this.title,
    this.action,
    this.actionHandler,
    this.description,
    this.backgroundColor = defaultBackgroundColor,
    this.shadowColor = defaultShadowColor,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    this.textDirection = TextDirection.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconWidget,
    this.height,
    this.width,
    this.constraints,
    this.disableToastAnimation = false,
    this.inheritThemeColors = false,
    this.onToastClosed,
  }) : super(key: key) {
    assert(
      title != null || description != null,
      'Cherry toast must be initialized with minimum title or description',
    );
    icon = Icons.info_rounded;
    _initializeAttributes(infoColor);
  }

  void _initializeAttributes(Color color) {
    themeColor = color;
    iconColor = color;
    iconSize = 20;
  }

  ///Text widget displayed as a title in the toast
  ///required parameter for all toast types
  final Text? title;

  ///Text widget displayed as a description in the toast
  final Text? description;

  ///THe action button displayed below description
  ///by default there's no action added
  final Text? action;

  ///the toast icon, it's required when using the default constructor
  ///
  late IconData icon;

  ///the Icon color
  ///this parameter is only available on the default constructor
  ///for the built-in themes the color  will be set automatically
  late Color iconColor;
  //background color of container
  final Color backgroundColor;
  //box shadow color of container
  final Color shadowColor;
  //Custom widget displayed at the place of the predefined icons
  final Widget? iconWidget;

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
  final Position toastPosition;

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
  final AnimationType animationType;

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
  ///

  ///```
  final TextDirection textDirection;

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

  /// The attribute  is declaring a final variable named "width" of type double with a nullable value.
  /// width attribute define the toast width
  final double? width;

  /// The attribute is declaring a final variable named "height" of type double with a nullable type
  /// modifier.
  /// height attribute define the toast height
  final double? height;

  ///Enable taost constraints customization (by default it's null)
  final BoxConstraints? constraints;

  ///indicate whether the toast animation is enabled or not
  ///by default the toast animation is enabled
  final bool disableToastAnimation;

  /// Indicate toast should inherit theme colors sheme, to apply in background
  /// and shadow color.
  final bool inheritThemeColors;

  ///Callback invoked when toast get dismissed (closed by button or dismissed automtically)
  final Function()? onToastClosed;

  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    final overlay = Overlay.maybeOf(context);

    if (overlay != null) {
      overlay.insert(overlayEntry!);
    } else {
      Navigator.of(context).overlay?.insert(overlayEntry!);
    }
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  ///Display the created cherry toast
  ///[context] the context of the application
  ///
  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return SafeArea(
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            alignment: toastPosition.alignment,
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(30),
            content: this,
          ),
        );
      },
    );
  }

  @override
  _CherryToastState createState() => _CherryToastState();
}

class _CherryToastState extends State<CherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late Animation<Offset> disabledAnimationOffset;
  late AnimationController slideController;
  late BoxDecoration toastDecoration;
  Timer? autoDismissTimer;

  @override
  void initState() {
    super.initState();
    initAnimation();

    toastDecoration = BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      boxShadow: [
        _createToastBoxShadow(color: widget.shadowColor),
      ],
    );
    if (widget.autoDismiss) {
      autoDismissTimer = Timer(widget.toastDuration, () {
        if (!widget.disableToastAnimation) {
          slideController.reverse();
        }
        Timer(widget.animationDuration, () {
          widget.closeOverlay();
        });
      });
    }
  }

  @override
  void dispose() {
    widget.onToastClosed?.call();
    autoDismissTimer?.cancel();
    if (!widget.disableToastAnimation) {
      slideController.dispose();
    }
    super.dispose();
  }

  ///Initialize animation parameters [slideController] and [offsetAnimation]
  void initAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.disableToastAnimation) {
      disabledAnimationOffset = Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: slideController,
          curve: widget.animationCurve,
        ),
      );
    } else {
      switch (widget.animationType) {
        case AnimationType.fromLeft:
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
        case AnimationType.fromRight:
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
        case AnimationType.fromTop:
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
        case AnimationType.fromBottom:
          offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 2),
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
    }

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) {
      if (!widget.disableToastAnimation) {
        slideController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.disableToastAnimation
          ? disabledAnimationOffset
          : offsetAnimation,
      child: Directionality(
        textDirection: widget.textDirection,
        child: renderCherryToastContent(context),
      ),
    );
  }

  ///render a left layout toast if [this.widget.layout] set to LTR
  ///
  Widget renderCherryToastContent(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: widget.inheritThemeColors
              ? toastDecoration.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    _createToastBoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                    ),
                  ],
                )
              : toastDecoration,
          constraints: widget.constraints,
          width: widget.width,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
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
                      //TODO refactor `iconWidget` and `titleWidget` to avoid duplication
                      if (widget.iconWidget != null)
                        widget.iconWidget!
                      else if (widget.displayIcon)
                        CherryToastIcon(
                          color: widget.themeColor,
                          icon: widget.icon,
                          iconSize: widget.iconSize,
                          iconColor: widget.iconColor,
                          enableAnimation: widget.enableIconAnimation,
                        )
                      else
                        Container(),
                      renderToastContent(),
                    ],
                  ),
                ),
                if (widget.displayCloseButton)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: renderCloseButton(context),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// render the close button icon with a clickable  widget that
  /// will hide the toast
  ///
  InkWell renderCloseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.disableToastAnimation) {
          slideController.reverse();
        }
        autoDismissTimer?.cancel();
        Timer(
          widget.animationDuration,
          () {
            widget.closeOverlay();
          },
        );
      },
      child: Icon(
        Icons.close,
        color: Colors.grey[500],
        size: 15,
      ),
    );
  }

  ///render the toast content (Title, Description and Action)
  ///
  Expanded renderToastContent() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Directionality(
          textDirection: widget.textDirection,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.title != null) widget.title!,
              if (widget.description != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    widget.description!,
                  ],
                ),
              if (widget.action != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        widget.actionHandler?.call();
                      },
                      child: widget.action,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  BoxShadow _createToastBoxShadow({
    required Color color,
  }) =>
      BoxShadow(
        color: color,
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(0, 1), // changes position of shadow
      );
}
