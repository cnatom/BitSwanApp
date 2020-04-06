
import 'dart:ui';

import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/explore.dart';
import 'package:flutterapp/home.dart';
import 'package:flutterapp/about.dart';
void main() => runApp(MyMaterialApp());

class MyMaterialApp extends StatefulWidget {
  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Color.fromARGB(100, 16,65,117).withAlpha(255),
        accentColor: Color.fromARGB(100, 16,65,117).withAlpha(255)
      ),
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        );
      }
  }

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; //数组索引，通过改变索引值改变视图
  List<Widget> list = List(); //创建视图数组
  @override
  void initState() {
    //将页面添加进数组中
    list..add(HomePage())..add(AboutPage())..add(ExplorerPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
          items: [
            BottomNavigationBarItem(
                title: Text("主页"),
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                title: Text("关于"),
                icon: Icon(
                  Icons.supervised_user_circle,
                )),
            BottomNavigationBarItem(
                title: Text("发现"),
                icon: Icon(
                  Icons.explore,
                )),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed),
    );
  }
}
