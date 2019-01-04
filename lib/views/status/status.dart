import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/models/status/statusModel.dart';

class Status extends StatefulWidget {
  @override
  StatusState createState() => new StatusState();
}

// SingleTickerProviderStateMixin is used for animation
class StatusState extends State<Status> with SingleTickerProviderStateMixin {
    TextEditingController status = new TextEditingController();
  List<StatusModel> statussList = List();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // 1
        appBar: new AppBar(
          title: new Text("Home"),
          // screen title
        ),
        body: new Center(
          child: new Container(
            child: new Text("Status"),
          ),
        ),
         floatingActionButton: FloatingActionButton(
           heroTag: null,
        onPressed: () {
          _showDialog() async {
            await showDialog<String>(
              context: context,
              child: new _SystemPadding(
                child: new AlertDialog(
                  contentPadding: const EdgeInsets.all(16.0),
                  content: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextField(
                          autofocus: true,
                          decoration: new InputDecoration(
                              labelText: status.text, hintText: 'Group Name'),
                        ),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    new FlatButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    new FlatButton(
                        child: const Text('Create'),
                        onPressed: () {
                          setState(() {
                            statussList.add(new StatusModel(message: status.text, time:"10:15 AM"));
                          });
                        })
                  ],
                ),
              ),
            );
          }
        },
        child: Icon(Icons.message),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
