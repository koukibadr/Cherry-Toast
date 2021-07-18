import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/colors.dart';
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
                          color: WARINING_COLOR,
                          icon: Image(
                            image:
                                AssetImage(WARNING_ICON, package: PACKAGE_NAME),
                            width: 20,
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title here",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "this is just  a description, this is just  a descriptionthis is just  a description"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Go to settings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: WARINING_COLOR))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Image(
                    image: AssetImage(CLOSE_ICON, package: PACKAGE_NAME),
                    width: 10,
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
