import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './completedSession.dart';
import '../globalUserID.dart' as globalUID;

class SessionHistoryList extends StatefulWidget {
  @override
  SessionHistoryListState createState() => new SessionHistoryListState();
}

class SessionHistoryListState extends State<SessionHistoryList> {
  CollectionReference col = Firestore.instance.collection('MatchedSession');

  Widget build(BuildContext context) {
    //Create nested queries
    Query completed = col.where('completed', isEqualTo: true);

    Query uid1 = completed.where('userID1', isEqualTo: globalUID.uid);
    Query uid2 = completed.where('userID2', isEqualTo: globalUID.uid);

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _streamBulder(
            uid1), //get sessions where completed = true, uid1 = current uid
        _streamBulder(
            uid2), //get sessions where completed = true, uid2 = current uid
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
                                  builder: (context) => CompletedSession(
                                      document))); //Sends current session document to completedSession page
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

class SessionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            new Expanded(
              child: SessionHistoryList(), //Load sessions from DB
            )
          ],
        ));
  }
}
