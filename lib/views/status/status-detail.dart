import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StatusDetail extends StatefulWidget {
  final String stat;
  // In the constructor, require a String to update status text
  StatusDetail(this.stat);
  @override
  StatusState createState() => StatusState(stat);
}

class StatusState extends State<StatusDetail> {
  
  final String stat;
  StatusState(this.stat);

//Status layout
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
            child: Text(stat,
          style: TextStyle(color: Colors.white,fontSize: 33),
        )),
      ),
    );
  }
}
