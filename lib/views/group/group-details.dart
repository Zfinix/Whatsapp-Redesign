import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/models/groups/groupsModel.dart';

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
    setState(() {
      msgList = groups.groupMsg;
      print(msgList);
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
                      child: Text(msgList[index].sender + ": " +msgList[index].content),
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
                      child: Text(msgList[index].sender + ": " +msgList[index].content),
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

//Layout for group chats
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: Stack(
        children: <Widget>[
           Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/icons/chat_bg.png"),
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
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.amber,
      ),
   );
  }
}
