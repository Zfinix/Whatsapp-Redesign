import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StatusDetail extends StatefulWidget {
  @override
  StatusState createState() => new StatusState();
}

// SingleTickerProviderStateMixin is used for animation
class StatusState extends State<StatusDetail> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: new AppBar(
          title: new Text("Home"),
          // screen title
        ),
        body: new Center(
          child: new Container(
            child: new Text("Your have no Notifications Currently"),
          ),
        ));
  }
}
