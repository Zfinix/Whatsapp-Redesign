import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() => new ContactsState();
}

// SingleTickerProviderStateMixin is used for animation
class ContactsState extends State<Contacts> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: null,
        body: new Center(
          child: new Container(
            child: new Text("Contacts"),
          ),
        ));
  }
}
