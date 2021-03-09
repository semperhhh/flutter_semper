import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_semper/Lists/ListsViewController.dart';
import 'package:flutter_semper/Post/PostViewController.dart';
import 'package:flutter_semper/Tools/ColorUtil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: ColorUtil.black,
            ),
            home: HomeViewController(),
            routes: {
              "post": (context) => PostViewController(),
            },
          );
        });
  }
}

class HomeViewController extends StatefulWidget {
  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("semperhhh的主页"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListsViewController()));
          },
          child: Text("点击进入"),
        ),
      ),
    );
  }
}
