import 'package:flutter/material.dart';
import 'SessionCard.dart';
import 'sessionInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('UnmatchedSession').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        final int sessionCount = snapshot.data.documents.length;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: sessionCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];

            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 75,
                  decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  BorderRadius.circular(20.0)),
                                          child: Center(
                                            child: Text(document['location'],
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
                                                  BorderRadius.circular(20.0)),
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

//NOTE TESTING DATA REMOVE AFTER LINKING DB
List getSessionCards() {
  return [
    SessionCard(
        name: "Name 1",
        date: "20/03/2019",
        startTime: "09:00",
        endTime: "10:00",
        focus: "HIIT",
        location: "NTU Gym"),
    SessionCard(
        name: "Name 2",
        date: "21/03/2019",
        startTime: "10:00",
        endTime: "11:00",
        focus: "Yoga",
        location: "Gymboxx"),
    SessionCard(
        name: "Name 3",
        date: "22/03/2019",
        startTime: "11:00",
        endTime: "12:00",
        focus: "Boxing",
        location: "Gym A"),
    SessionCard(
        name: "Name 4",
        date: "23/03/2019",
        startTime: "12:00",
        endTime: "13:00",
        focus: "Aerobics",
        location: "Gym B"),
    SessionCard(
        name: "Name 5",
        date: "24/03/2019",
        startTime: "13:00",
        endTime: "14:00",
        focus: "Burpees",
        location: "Gym C"),
    SessionCard(
        name: "Name 6",
        date: "25/03/2019",
        startTime: "14:00",
        endTime: "15:00",
        focus: "Strength Training",
        location: "Gym D"),
    SessionCard(
        name: "Name 7",
        date: "26/03/2019",
        startTime: "15:00",
        endTime: "16:00",
        focus: "HIIT",
        location: "Gym E"),
  ];
}
