import 'package:cherry_toast/resources/constants.dart';
import 'package:cherry_toast/resources/images.dart';
import 'package:flutter/material.dart';

class CherryToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 250,
          height: 50,
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
          child: Row(
            children: [
              Image(
                image: AssetImage(WARNING_ICON, package: PACKAGE_NAME),
                width: 20,
              ),
            ],
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
