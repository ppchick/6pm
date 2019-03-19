import 'package:flutter/material.dart';

class CreateSessionPage extends StatefulWidget {
  @override
  CreateSessionState createState() => CreateSessionState();
}

class CreateSessionState extends State<CreateSessionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(50.0, 50.0, 0.0, 0.0),
            child: Text('Create A Session!',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
