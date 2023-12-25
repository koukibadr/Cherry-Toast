import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cherry Toast Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ExampleApp(),
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '🍒 🍒',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Cherry Toasts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Info Cherry Toast'),
              onPressed: () {
                CherryToast.info(
                  disableToastAnimation: true,
                  toastPosition: Position.top,
                  title: Text(
                    'Cherry toast title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  action: Text('Toast content description'),
                  actionHandler: () {},
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Error Cherry Toast'),
              onPressed: () {
                CherryToast.error(
                  title: Text(''),
                  enableIconAnimation: false,
                  displayTitle: false,
                  description: Text('Invalid account information'),
                  animationType: AnimationType.fromRight,
                  animationDuration: Duration(milliseconds: 1000),
                  autoDismiss: true,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Bottom Cherry Toast'),
              onPressed: () {
                CherryToast(
                  icon: Icons.alarm_add,
                  themeColor: Colors.pink,
                  title: Text(''),
                  displayTitle: false,
                  description: Text('A bottom cherry toast example'),
                  toastPosition: Position.bottom,
                  animationDuration: Duration(milliseconds: 1000),
                  autoDismiss: true,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Center Cherry Toast'),
              onPressed: () {
                CherryToast(
                  icon: Icons.android,
                  themeColor: Colors.green,
                  title: Text(''),
                  displayTitle: false,
                  description: Text('A center cherry toast example'),
                  toastPosition: Position.center,
                  animationDuration: Duration(milliseconds: 1000),
                  autoDismiss: true,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Warning Cherry Toast'),
              onPressed: () {
                CherryToast.warning(
                  title: Text(''),
                  displayTitle: false,
                  description:
                      Text('All information may be deleted after this action'),
                  animationType: AnimationType.fromTop,
                  action: Text('Backup data'),
                  actionHandler: () {},
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Success Cherry Toast'),
              onPressed: () {
                CherryToast.success(
                  title: Text('The simplest cherry toast'),
                  borderRadius: 0,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🍒 Right Layout Cherry Toast'),
              onPressed: () {
                CherryToast(
                  icon: Icons.car_repair,
                  themeColor: Colors.green,
                  title: Text(''),
                  displayTitle: false,
                  description: Text('هذا مثال تصميم من اليمين'),
                  toastPosition: Position.bottom,
                  layout: ToastLayout.rtl,
                  animationType: AnimationType.fromRight,
                  action: Text(
                    'انقر هنا',
                    style: TextStyle(color: Colors.green),
                  ),
                  animationDuration: Duration(milliseconds: 1000),
                  autoDismiss: true,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🇹🇳 Arabic Cherry Toast'),
              onPressed: () {
                CherryToast.info(
                  toastPosition: Position.top,
                  title: Text(
                    'هذا مثال للإنذار',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  action: Text('هذا النص كتب بالعربية'),
                  actionHandler: () {},
                  layout: ToastLayout.rtl,
                ).show(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              child: Text('🇰🇷 Korean Cherry Toast'),
              onPressed: () {
                CherryToast.info(
                  toastPosition: Position.top,
                  title: Text(
                    '이건 제목이야',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  action: Text('내용 설명입니다'),
                  actionHandler: () {},
                ).show(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
