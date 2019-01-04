import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/views/calls/call.dart';
import 'package:whatsapp/views/chats/chats.dart';
import 'package:whatsapp/views/group/group.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();
//CREATING TAB CONTROLLER FOR BOTOM NAV
    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              fabIcon = Icons.message;
              break;
            case 1:
              fabIcon = Icons.camera_enhance;
              break;
            case 2:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

//Building layout for bottom nav and its clases
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: new AppBar(
          title: new Text(
            "WhatsApp",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("CHATS"),
              ),
              Tab(
                  child: Text(
                "GROUPS",
              )),
              Tab(
                  child: Text(
                "CALLS",
              )),
            ],
            indicatorColor: Colors.white,
            controller: tabController,
          ),
        ),
        body: new TabBarView(
        // Add tabs as widgets
        //Tab items for bottom navigation screeen
        children: <Widget>[
          Chat(),
          Groups(),
          Calls(),
        ],
        // set the controller
        controller: tabController,
      ));
  }
}

class Chats {
}
