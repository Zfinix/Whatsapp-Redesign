import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileDetail extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

// SingleTickerProviderStateMixin is used for animation
class ProfileState extends State<ProfileDetail> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: new AppBar(
          title: new Text("Profile"),
          // screen title
        ),
        body: new Center(
          child: new Container(
            child: new Text("Your Profile"),
          ),
        ));
  }
}
