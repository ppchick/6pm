import 'package:flutter/material.dart';
import 'sessionInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globalUserID.dart' as globalUID;

class SessionList extends StatefulWidget {
  @override
  SessionListState createState() => new SessionListState();
}

class SessionListState extends State<SessionList> {
  CollectionReference col = Firestore.instance.collection('UnmatchedSession');
  String _gender = '';

  Future getCurrentGender() async {
    DocumentReference document = Firestore.instance //Get current user gender
        .collection('Profile')
        .document(globalUID.uid);
    document.get().then((profile) {
      setState(() {
        _gender = profile['gender'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentGender();
  }

  Widget build(BuildContext context) {
    //Create nested queries
    Query notMatched = col.where('isMatched', isEqualTo: false);

    Query notSameGender = notMatched.where('sameGender', isEqualTo: false);
    Query sameGender = notMatched.where('sameGender', isEqualTo: true);
    Query sameGender2 = sameGender.where('userGender', isEqualTo: _gender);

    Query uidGreater1 =
        notSameGender.where('userID', isGreaterThan: globalUID.uid);
    Query uidLess1 = notSameGender.where('userID', isLessThan: globalUID.uid);

    Query uidGreater2 =
        sameGender2.where('userID', isGreaterThan: globalUID.uid);
    Query uidLess2 = sameGender2.where('userID', isLessThan: globalUID.uid);

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _streamBulder(
            uidGreater1), //get sessions where sameGender = false, uid > current uid
        _streamBulder(
            uidLess1), //get sessions where sameGender = false, uid < current uid
        _streamBulder(
            uidGreater2), //get sessions where sameGender = true, uid > current uid, userGender = currentGender
        _streamBulder(
            uidLess2), //get sessions where sameGender = true, uid < current uid, userGender = currentGender
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
                                  builder: (context) => SessionInfo(
                                      unmatchedDocument:
                                          document))); //Sends current session document to sessionInfo page
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
        appBar: AppBar(
          title: Text('Join Session'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(60.0, 10.0, 0.0, 0.0),
              child: Text('Join A Session!',
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10.0),
            new Expanded(
              child: SessionList(), //Load sessions from DB
            )
          ],
        ));
  }
}
