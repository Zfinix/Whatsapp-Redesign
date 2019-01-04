import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/models/status/statusModel.dart';
import 'package:whatsapp/views/status/status-detail.dart';

class Status extends StatefulWidget {
  @override
  StatusState createState() => new StatusState();
}

// SingleTickerProviderStateMixin is used for animation
class StatusState extends State<Status> with SingleTickerProviderStateMixin {
  TextEditingController status = new TextEditingController();
  List<String> statItems = [];

  // This will be called each time the + button is pressed

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextFormField(
                controller: status,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: "Group Name", hintText: 'Group Name'),
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
              child: const Text('CREATE'),
              onPressed: () {
                setState(() {
                  statItems.add(status.text);
                  Navigator.pop(context);
                });
              })
        ],
      ),
    );
  }

  // Build the whole list of status items
  Widget _buildStatusList() {
    return new ListView.builder(itemBuilder: (context, index) {
      // itemBuilder will be automatically be called as many times as it takes for the
      // list to fill up its available space, which is most likely more than the
      // number of status items we have. So, we need to check the index is OK.

      var image = new Container(
          width: 56.0,
          height: 56.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "http://dummyimage.com/300x500.png/cc0000/ffffff"))));
      if (index < statItems.length) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: image,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusDetail(statItems[index]),
                    ),
                  );
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
                              SizedBox(
                                width: 200,
                                child: Text(
                                  statItems[index],
                                   overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      
                                      fontSize: 16.0),
                                ),
                              ),
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Status List')),
      body: _buildStatusList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _showDialog,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }
}
