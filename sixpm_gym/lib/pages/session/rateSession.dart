import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../widgets/checkbox_comment.dart';

class RateSession extends StatefulWidget{
  @override
  _RateSessionState createState() => _RateSessionState();
}

class _RateSessionState extends State<RateSession>{
  //TODO CONSTRUCTOR TO GET SESSION DOCUMENT FROM CHECKIN PAGE
  double rating = 0;
  int starCount = 5;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Row(children: <Widget>[
              Expanded(child: Column(
                children: [
                  Text('Feedback',
                    style:TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold
                      )
                    ),
                  Divider(color: Colors.black)
                  ]
                ),)
              ],)
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text('Rate your partner:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: new StarRating(
              size:60.0,
              color: Colors.orange,
              borderColor: Colors.grey,
              rating: rating,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                (){
                  this.rating = rating;
                }
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text('Comment on your partner:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          CommentCheckbox(),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text('Remark on session:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(child:
             Container(
              padding: EdgeInsets.only(left: 5),
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                border:Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Please provide some feedback:'
                  ),
                )
            )
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.fromLTRB(120.0, 10.0, 30.0, 20.0),
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
                          //TODO UPDATE MatchedSession DB WITH RATE, FEEDBACK, COMPLETED = TRUE
                          //TODO UPDATE BOTH PROFILES HourSum AND numOfSession
                          Navigator.popUntil(
                        context, ModalRoute.withName('/homepage'));
                        },
                        child: Center(
                          child: Text(
                            'OKAY',
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
                  ]
                )
            )
        ])
    );
  }
}

