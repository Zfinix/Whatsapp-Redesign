import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StatusDetail extends StatefulWidget {
  @override
  StatusState createState() => new StatusState();
}


class StatusState extends State<StatusDetail> {

//Status layout
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: <Widget>[
        new Container(
          child: SizedBox(height: height),
          decoration: new BoxDecoration(color: Colors.blue),
        ),
        new Container(child: Center(child: Text("")))
      ]),
    );
  }
}
