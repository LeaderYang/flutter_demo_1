import 'package:flutter/material.dart';
import 'package:flutterapp1/test_function.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
      home: new RandomWords(),
    );
  }
}
