import 'package:flutter/material.dart';
import 'sessionInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('UnmatchedSession').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            final int sessionCount = snapshot.data.documents.length;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: sessionCount,
              itemBuilder: (_, int index) {
                final DocumentSnapshot document =
                    snapshot.data.documents[index];

                return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 75,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
                      child: ListTile(
                        leading: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.people, color: Colors.black, size: 60.0),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 290,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      document['date'] +
                                          ', ' +
                                          document['startTime'] +
                                          ' - ' +
                                          document['endTime'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          height: 40.0,
                                          width: 125.0,
                                          color: Colors.transparent,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      style: BorderStyle.solid,
                                                      width: 1.0),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Center(
                                                child: Text(
                                                    document['location'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ))),
                                      Container(
                                          height: 40.0,
                                          width: 125.0,
                                          color: Colors.transparent,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      style: BorderStyle.solid,
                                                      width: 1.0),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Center(
                                                child: Text(document['focus'],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ))),
                                    ],
                                  ))
                                ],
                              ),
                            )
                          ],
                        )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SessionInfo()));
                        },
                      ),
                    ));
              },
            );
        }
      },
    );
  }
}

class JoinSessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(60.0, 50.0, 0.0, 0.0),
              child: Text('Join A Session!',
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 40.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: InkWell(
                  onTap: () {
                    print('[Join Filter] Pressed');
                    Navigator.of(context).pushNamed('/joinFilter1');
                  },
                  child: Center(
                    child: Text(
                      'Filter Results',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Text('Session list:',
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
            new Expanded(
              child: SessionList(),
            )
          ],
        ));
  }
}
