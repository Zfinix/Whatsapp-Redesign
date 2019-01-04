import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GroupDetail extends StatefulWidget {
  @override
  GroupState createState() => new GroupState();
}

// SingleTickerProviderStateMixin is used for animation
class GroupState extends State<GroupDetail> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: null,
        body: new Center(
          child: new Container(
            child: new Text("Groups Detail"),
          ),
        ));
  }
}
