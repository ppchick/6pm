import 'package:flutter/material.dart';

class JoinSessionPage extends StatefulWidget {
  @override
  JoinSessionState createState() => JoinSessionState();
}

class JoinSessionState extends State<JoinSessionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(60.0, 50.0, 0.0, 0.0),
            child: Text('Join A Session',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
