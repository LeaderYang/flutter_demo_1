import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/tip_route.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: RaisedButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TipRoute(
              text: " hint sss 1111",
            );
          }));
          print(result);
        },
        child: Text("打开提示页"),
      ),
    );
  }
}
