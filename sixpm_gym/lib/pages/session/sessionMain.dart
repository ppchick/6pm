import 'package:flutter/material.dart';
import '../widgets/placeholder.dart';

final PlaceholderWidget session_placeholder =
    new PlaceholderWidget(Colors.indigo, 'Session Placeholder');

class SessionHistory extends StatefulWidget{
  @override
  _SessionHistory createState() => _SessionHistory();
}

class _SessionHistory extends State<SessionHistory>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.blueAccent,
              color: Colors.blue,
              elevation: 7.0,
              child: InkWell(
                child: Center(
                  child: Text(
                    'You have exercised with us for:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            width: 150,
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
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            width: 150,
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
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}