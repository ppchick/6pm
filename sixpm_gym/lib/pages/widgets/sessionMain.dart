import 'package:flutter/material.dart';
import '../session/SessionCard.dart';

final StatelessWidget session = new SessionWidget();

class SessionWidget extends StatelessWidget {
  SessionWidget();
  final List sessionCards =
      getSessionCards(); //TODO GET DB DATA (MATCHED SESSIONS BELONGING TO THIS USER)

  @override
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
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //header (greetings)
          Container(
              padding: EdgeInsets.fromLTRB(100.0, 20.0, 0.0, 10.0),
              child: Row(children: [
                Icon(Icons.cloud, color: Colors.black),
                Text('  Good evening xxx!', //TODO ENTER USER NAME HERE
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
              ])),

          //Exercise time counting
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
                          child: Text('30 HOURS', //TODO sumHours HERE
                              style: TextStyle(
                                  fontSize: 40.0, fontWeight: FontWeight.bold)))
                    ],
                  ))
                ])),
          ),
          SizedBox(height: 10.0),
          new Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sessionCards.length,
              itemBuilder: (BuildContext context, int index) {
                return makeCard(sessionCards[index]);
              },
            ),
          ),
          //choose button(join session, create session)
          Container(
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
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TESTING DATA
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
        name: "Name 3",
        date: "22/03/2019",
        startTime: "11:00",
        endTime: "12:00",
        focus: "Boxing",
        location: "Gym A"),
  ];
}
