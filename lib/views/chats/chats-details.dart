import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatsDetail extends StatefulWidget {
  @override
  ChatState createState() => new ChatState();
}

// SingleTickerProviderStateMixin is used for animation
class ChatState extends State<ChatsDetail> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: null,
        body: new Center(
          child: new Container(
            child: new Text("Chats Detail"),
          ),
        ));
  }
}
