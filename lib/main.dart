import 'package:flutter/material.dart';
import 'package:whatsapp/views/camera/camera.dart';
import 'package:whatsapp/views/contacts/contacts.dart';
import 'package:whatsapp/views/home.dart';
import 'package:whatsapp/views/profile.dart';
import 'package:whatsapp/views/status/status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      theme: ThemeData(
          accentColor: Colors.amber.shade400,
          primaryColor: Colors.green),
      home: new MyHome(),
      routes: {
        '/home': (BuildContext context) => MyHome(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller

  TabController controller;

  @override
  void initState() {
    super.initState();
    //nemw();

    // Initialize the Tab Controller
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        //Tab items for bottom navigation screeen
        children: <Widget>[
          new Home(),
          Status(),
          Camera(),
          Contacts(),
          ProfileDetail(),
        ],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() {
              controller.index = 2;
            });
          },
          tooltip: 'Camera',
          child: new Icon(Icons.camera_alt, color: Colors.white),
          elevation: 10.0,
          backgroundColor: Colors.lightGreen.shade700),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.favorite)),
            new Tab(text: ""),
            new Tab(icon: new Icon(Icons.person)),
            new Tab(icon: new Icon(Icons.settings))
          ],
          labelColor: Colors.lightGreen.shade700,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.lightGreen.shade700,
          // setup the controller
          controller: controller,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
