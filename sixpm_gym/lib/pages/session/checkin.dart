import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globalUserID.dart' as globalUID;

class SessionCheckIn extends StatefulWidget {
  final DocumentSnapshot document;
  SessionCheckIn(
      {this.document});
  @override
  SessionCheckInState createState() => new SessionCheckInState();
  
}

class SessionCheckInState extends State<SessionCheckIn> {
  Timer _timer;
  int _second = 0;
  int _minute = 0;
  int _hour = 0;
  String showTimer = "START";
  DocumentSnapshot document;
  SessionCheckInState(
      {this.document});

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_hour > 2) {
                timer.cancel();
              } else if (_second < 60) {
                _second += 1;
              } else if (_second >= 60) {
                _second = 0;
                _minute += 1;
              } else if (_minute == 60) {
                _hour += 1;
                _minute = 0;
              }
              showTimer = "0$_hour : $_minute : $_second";
            }));
  }
  void update(String field){
    DocumentReference doc;
    int id = document['ID'];
    doc = Firestore.instance.document('UnmatchedSession/session$id');
    
      Map<String, Object> data1 = <String, Object>{
      'hasCheckedIn1':true,
    };
    Map<String, Object> data2 = <String, Object>{
      'hasCheckedIn2':true,
    };
    Map<String, Object> data3 = <String, Object>{
      'completed':true,
    };

    if(field == "hasCheckedIn1"){
    doc.updateData(data1).whenComplete(() {
      print("UnmatchedSession/session$id added");
    }).catchError((e) => print(e));
  }
  else if(field == "hasCheckedIn2"){
    doc.updateData(data2).whenComplete(() {
      print("UnmatchedSession/session$id added");
    }).catchError((e) => print(e));
  }
  else if (field == "finish"){
    doc.updateData(data3).whenComplete(() {
      print("UnmatchedSession/session$id added");
    }).catchError((e) => print(e));
  }
  }
  

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
            child: Row(
              children: <Widget>[
                new Icon(Icons.person, color: Colors.black, size: 100),
                new Icon(Icons.link, color: Colors.black, size: 80),
                new Icon(Icons.person, color: Colors.black, size: 100),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          
              // Container(
              //   child: Material(
              //     shape:CircleBorder(),
              //     // borderRadius: BorderRadius.circular(20.0),
              //     shadowColor: Colors.blueAccent,
              //     color: Colors.blue,
              //     elevation: 7.0,
              //     child: InkWell(
              //       onTap: () {
              //         if(start == false){
              //           showTimer = "START";
              //         }
              //         else{
              //           showTimer = "0$_hour : $_minute : $_second";
              //         }

              //       },
              //       child: Center(
              //         child: Text(
              //           showTimer,
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontFamily: 'Montserrat'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () { //TODO START TIMER
                  setState(() {
                    //FIXME hasCheckedIn FLAG SHOULD BE UPDATED WHEN USER CLICKS ON CHECK IN IN matchedSession PAGE, NOT HERE
                    //TODO ONLY ALLOW USER TO START THE TIMER WHEN BOTH USERS HAVE CHECKED IN ALREADY
                    if (document['hasCheckedIn1'] == false ||document['hasCheckedIn2'] == false ) {
                      if(globalUID.uid==document['userID1']){
                        update("hasCheckedIn1");
                      }
                      else if (globalUID.uid==document['userID2']){
                        update("hasCheckedIn2");
                      }
                    }
                    else if (document['hasCheckedIn1'] == true ||document['hasCheckedIn2'] == false ){
                      if(globalUID.uid==document['userID1']){}
                      else if (globalUID.uid==document['userID2']){
                        update("hasCheckedIn2");
                        startTimer();
                      }
                    }
                    else if (document['hasCheckedIn1'] == false ||document['hasCheckedIn2'] == true ){
                      if(globalUID.uid==document['userID1']){
                        update("hasCheckedIn1");
                        startTimer();
                      }
                      else if (globalUID.uid==document['userID2']){
                        
                      }
                    }
                  });
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.blue,
                    height: 300.0, // height of the button
                    width: 300.0, // width of the button
                    child: Center(
                      child: Text(
                        showTimer,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),

              // Container(
              //   padding:EdgeInsets.fromLTRB(130, 150, 0, 0),
              //   child:Text("0$_hour : $_minute : $_second",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              //   ),
           
          SizedBox(height: 30),
          Container(
            height: 40.0,
            width:200,
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: InkWell(
                onTap: () {
                  print('[Finish] Pressed');
                  update("finish");
                  Navigator.of(context).pushNamed('/rateSession'); //TODO PASS SESSION DOCUMENT TO RATING PAGE
                },
                child: Center(
                  child: Text(
                    'FINISH',
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
