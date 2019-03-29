import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../session/matchedSession.dart';
import '../globalUserID.dart' as globalUID;

class SessionList extends StatefulWidget {
  @override
  SessionListState createState() => new SessionListState();
}

class SessionListState extends State<SessionList> {
  CollectionReference col = Firestore.instance.collection('MatchedSession');

  Future<DocumentSnapshot> getProfileDocument() async {
    DocumentSnapshot document =
        await Firestore.instance //Get current user profile
            .collection('Profile')
            .document(globalUID.uid)
            .get();
    return document;
  }

  Widget build(BuildContext context) {
    Query notComplete =
        col.where('completed', isEqualTo: false); //Get all uncompleted session

    Query uid1NotComplete = notComplete.where('userID1',
        isEqualTo: globalUID.uid); //UID1 = current user UID
    Query uid2NotComplete = notComplete.where('userID2',
        isEqualTo: globalUID.uid); //UID2 = current user UID

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(100.0, 20.0, 0.0, 10.0),
          child: new FutureBuilder(
              future: getProfileDocument(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return new Row(children: [
                      Icon(Icons.cloud, color: Colors.black),
                      Text(
                          '   Hello ' +
                              snapshot.data['firstName'] +
                              ' ' +
                              snapshot.data['lastName'],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))
                    ]);
                  }
                } else {
                  return new CircularProgressIndicator();
                }
              }),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/sessionHistory');
                },
                child: Row(children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment(0.0, -0.9),
                          child: Text('You have exercised with us for',
                              style: TextStyle(fontSize: 20.0))),
                      Container(
                          alignment: Alignment(0.0, -0.8),
                          child: new FutureBuilder(
                              future: getProfileDocument(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null) {
                                    return Text(
                                        snapshot.data['hourSum'].toString() +
                                            ' HOURS',
                                        style: TextStyle(
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold));
                                  }
                                } else {
                                  return new CircularProgressIndicator();
                                }
                              })),
                    ],
                  ))
                ]))),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Your upcoming sessions:',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        new Expanded(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _streamBulder(
                uid1NotComplete), //get sessions where UID1 = current user UID, completed = false
            _streamBulder(
                uid2NotComplete), //get sessions where UID1 = current user UID, completed = false
          ],
        )),
      ],
    );
  }

  Widget _streamBulder(Query query) {
    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}'); //error checking
        switch (snapshot.connectionState) {
          //if takes too long to load, display "loading"
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            final int sessionCount = snapshot
                .data.documents.length; //get number of documents in collection
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: sessionCount,
              itemBuilder: (_, int index) {
                final DocumentSnapshot document =
                    snapshot.data.documents[index];

                return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.0),
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
                                                    overflow: TextOverflow.clip,
                                                    textAlign: TextAlign.center,
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
                                  builder: (context) => MatchedSession(
                                      document:
                                          document))); //Sends current session document to matchedSession page
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

class SessionMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SessionList(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(35.0, 10.0, 30.0, 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 50,
              width: 170,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/createSession');
                  },
                  child: Center(
                    child: Text(
                      'Create Session',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              height: 50,
              width: 170,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/joinSession');
                  },
                  child: Center(
                      child: Text(
                    'Join Session',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
