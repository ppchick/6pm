import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class SessionHistoryInfo extends StatefulWidget{
  @override
  SessionHistoryInfoState createState() => new SessionHistoryInfoState();
}

class SessionHistoryInfoState extends State<SessionHistoryInfo>{
  double rating = 2;
  int starCount = 5;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Icon(Icons.person, color: Colors.black, size: 100),
                      Text('UserID') 
                    ],
                  ),
                  // SizedBox(width : 50),
                  new Icon(Icons.link, color: Colors.black, size: 80),
                  Column(
                    children: <Widget>[
                      new Icon(Icons.person, color: Colors.black, size: 100),
                      Text('PartnerID') 
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Your History Session Details:',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(                         //TODO GET DB DATA (SESSION DETAILS)
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          Text(
                            'Time:         ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Location:      ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Focus:       ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Level of experience:   ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          SizedBox(height: 10),
                          Text(
                            'Feedback:      ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: new StarRating(
                              size:50.0,
                              color: Colors.orange,
                              borderColor: Colors.grey,
                              rating: rating,
                              starCount: starCount
                            )
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}