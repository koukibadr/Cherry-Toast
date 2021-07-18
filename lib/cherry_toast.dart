import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:cherry_toast/resources/constants.dart';
import 'package:cherry_toast/resources/images.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CherryToast extends StatelessWidget {
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
      this.toastPosition = POSITION.TOP});

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
      this.themeColor = SUCCESS_COLOR}) {
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
      this.themeColor = SUCCESS_COLOR}) {
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
      this.themeColor = SUCCESS_COLOR}) {
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
      this.themeColor = SUCCESS_COLOR}) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: this.toastPosition == POSITION.TOP
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
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
                      CherryToatIcon(color: this.themeColor, icon: this.icon),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              this.displayTitle
                                  ? Text(this.title, style: this.titleStyle)
                                  : Container(),
                              SizedBox(
                                height: 5,
                              ),
                              this.description == null
                                  ? Container()
                                  : Text(this.description ?? ""),
                              SizedBox(
                                height: 5,
                              ),
                              this.displayAction
                                  ? InkWell(
                                      onTap: () {
                                        this.actionHandler?.call();
                                      },
                                      child: Text(this.action,
                                          style: this.actionStyle))
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
                      Navigator.pop(context);
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
      ],
    );
  }

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
}
