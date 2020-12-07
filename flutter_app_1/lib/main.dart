import 'package:flutter/material.dart';

import 'first/my_home_page.dart';
import 'first/new_route.dart';
import 'second/home_page.dart';

void main() => runApp(new MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyApp1 build");
    return new MaterialApp(
      title: "demo",
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      // routes: {
      //   "new_page": (context) => NewRoute(),
      //   "/": (context) => MyHomePage(title: " home page"),
      // },
     home: new HomePage(),
    );
  }
}
