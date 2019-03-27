import 'package:flutter/material.dart';
import 'SessionCard.dart';

class SessionHistory extends StatefulWidget {
  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  List sessionCards;

  @override
  void initState() {
    sessionCards = getSessionCards(); //TODO GET DB DATA (MATCHED SESSIONS BY THIS USER THAT ARE COMPLETED ALREADY)
    super.initState();
  }

  Widget build(BuildContext context) {
    ListTile makeListTile(SessionCard sessionCard) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              height: 80,
              padding: EdgeInsets.only(left: 30.0, top: 5.0),
              // decoration: new BoxDecoration(
              //   border: new Border.all(color: Colors.black),
              //   borderRadius: BorderRadius.circular(20.0),
              // ),
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.people, color: Colors.black, size: 70.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            sessionCard.date +
                                ', ' +
                                sessionCard.startTime +
                                ' - ' +
                                sessionCard.endTime,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 40.0,
                                width: 110.0,
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
                                      child: Text(sessionCard.location,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ))),
                            Container(
                                height: 40.0,
                                width: 110.0,
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
                                      child: Text(sessionCard.focus,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ))),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ))),
          onTap: () {
            Navigator.of(context).pushNamed('/matchedSession');
          },
        );

    Card makeCard(SessionCard sessionCard) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0)),
            child: makeListTile(sessionCard),
          ),
        );

    return new Scaffold(
        appBar: AppBar(
          title: Text('Back'),
          // elevation: 0.0,
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                child: Text('History',
                    style: TextStyle(
                        fontSize: 35.0, fontWeight: FontWeight.bold))),
            SizedBox(height: 10.0),
            new Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: sessionCards.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard(sessionCards[index]);
                },
              ),
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
