import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionInfo extends StatelessWidget {
  SessionInfo(
      {this.document}); //constructor receives session document from joinSession
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Details'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
            child: Row(
              children: <Widget>[
                new Icon(Icons.person, color: Colors.black, size: 100),
                new Icon(Icons.link, color: Colors.black, size: 80),
                new Icon(Icons.help, color: Colors.black, size: 100),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: Text('Waiting for someone to join...',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.white,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Date: ' +
                        document['date'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Time: ' +
                        document['startTime'] +
                        ' - ' +
                        document['endTime'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Location: ' + document['location'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Focus: ' + document['focus'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Level of experience: ' + document['level'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gender: ' + document['userGender'],
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
        height: 40.0,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blueAccent,
          color: Colors.blue,
          elevation: 7.0,
          child: InkWell(
            onTap: () {
              //TODO IMPLEMENT JOIN SESSION
              print('[Join Session] Pressed');
              Navigator.popUntil(context, ModalRoute.withName('/homepage'));
            },
            child: Center(
              child: Text(
                'Join Session',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ),
      ),
          SizedBox(height: 10),
          Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: InkWell(
                onTap: () {
                  print('[Go Back] Pressed');
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
