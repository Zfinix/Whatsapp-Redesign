import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/liveData/liveData.dart';
import 'package:whatsapp/models/groups/groupsModel.dart';

class Groups extends StatefulWidget {
  @override
  GroupState createState() => new GroupState();
}

// SingleTickerProviderStateMixin is used for animation
class GroupState extends State<Groups> with SingleTickerProviderStateMixin {
  final response = LiveData.getGroupJSON;
  List<Group> groupsList = List();
  List<GroupMsg> groupsMsgList = List();
  var content = "";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    Map dataMap = jsonDecode(response);
    var d = GroupModel.fromJson(dataMap);

    setState(() {
      groupsList = d.group;
    });
  }

  @override
  Widget _buildList() {
    return ListView.builder(
        itemCount: groupsList.length,
        itemBuilder: (BuildContext context, int index) {
          var image;
          

          if (groupsList[index].img != null) {
            image = new Container(
                width: 56.0,
                height: 56.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(groupsList[index].img))));
          }

          if (groupsList[index].groupMsg != null) {
            groupsMsgList = groupsList[index].groupMsg;
            content = groupsMsgList[index].sender +
                ": " +
                groupsMsgList[index].content;
          }
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: image,
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width:160,
                                    child: Text(
                                      groupsList[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Text(
                                    "10:30 PM",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 12.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  content,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 13.0),
                                ),
                              )
                            ],
                          ),
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: null,
        body: new Center(
          child: Column(
            children: <Widget>[Flexible(child: _buildList())],
          ),
        ));
  }
}
