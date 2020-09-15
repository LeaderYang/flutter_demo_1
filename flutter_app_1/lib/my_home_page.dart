import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHOmePageState createState() {
    return new _MyHOmePageState();
  }
}

class _MyHOmePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("MyHomePage build");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You have pushed this icon times"),
            new Text(
              "$_counter",
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new Route"),
              textColor: Colors.deepOrange,
              onPressed: () {
                Navigator.pushNamed(context, "new_page", arguments: "参数传递222");
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}
