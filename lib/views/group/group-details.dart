import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/liveData/liveData.dart';
import 'package:whatsapp/models/contacts/contactsModel.dart';
import 'package:whatsapp/models/contacts/contactsModel.dart';
import 'package:whatsapp/models/groups/groupsModel.dart';
import 'package:whatsapp/views/contacts/contacts.dart';

class GroupDetail extends StatefulWidget {
  @override
  final Group groups;
  // In the constructor, require a Group ofr the groups details
  GroupDetail({Key key, @required this.groups}) : super(key: key);
  GroupState createState() => new GroupState(groups: groups);
}

// SingleTickerProviderStateMixin is used for animation
class GroupState extends State<GroupDetail> {
  final Group groups;

  //ADD CONTACT TO CHATS
  final response = LiveData.getChatJSON;
  List<Contact> contactsList = List();
  //List for messages
  List<GroupMsg> msgList;
  // In the constructor, require a Todo
  GroupState({Key key, @required this.groups});

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    Map dataMap = jsonDecode(response);
    var d = ContactModel.fromJson(dataMap);

    setState(() {
      msgList = groups.groupMsg;
      contactsList = d.contact;
      print(msgList);
    });
  }

  @override
  Widget addContacts() {
    return ListView.builder(
        itemCount: contactsList.length,
        itemBuilder: (BuildContext context, int index) {
          var image;
          if (contactsList[index].profilePic != null) {
            image = new Container(
                width: 56.0,
                height: 56.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            new NetworkImage(contactsList[index].profilePic))));
          }
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: image,
                  onTap: () {
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("Added " +contactsList[index].firstName + " to group chat" ),
                    ));
                  },
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  contactsList[index].firstName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          );
        });
  }

  Widget _buildList() {
    //Building messages List
    double width = MediaQuery.of(context).size.width * 0.64;
    return ListView.builder(
        itemCount: msgList.length,
        itemBuilder: (BuildContext context, int index) {
          var card;

          //Arranging ent and recieved mesages based on sender value
          if (msgList[index].sender.contains("You")) {
            card = Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                card = new Card(
                  elevation: 3,
                  child: SizedBox(
                    width: width,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(msgList[index].sender +
                          ": " +
                          msgList[index].content),
                    ),
                  ),
                ),
              ],
            );
          } else {
            card = Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                card = new Card(
                  elevation: 3,
                  child: SizedBox(
                    width: width,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(msgList[index].sender +
                          ": " +
                          msgList[index].content),
                    ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                //Card for messages
                child: ListTile(title: card),
              ),
            ],
          );
        });
  }

//Layout for group contacts
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/icons/contact_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(title: new Text(groups.name)),
                  Flexible(child: _buildList())
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab",
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.amber,
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
        context: context,
        child: new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[new Expanded(child: _buildList())],
          ),
        ));
  }
}
