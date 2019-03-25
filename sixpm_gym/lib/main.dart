import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'pages/welcome/signup.dart';
import 'pages/welcome/welcome.dart';
import 'pages/welcome/sighup2.dart';
import 'pages/session/createSession.dart';
import 'pages/session/createSession2.dart';
import 'pages/session/sessionInfo.dart';
import 'pages/home.dart';
import 'pages/session/joinSession.dart';
import 'pages/session/sessionHistory.dart';
import 'pages/session/matchedSession.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/signup2': (BuildContext context) => new SignupPage2(),
        '/sessionHistory': (BuildContext context) => new SessionHistory(),
        '/createSession': (BuildContext context) => new CreateSession(),
        '/createSession2':(BuildContext context) => new CreateSession2(),
        '/sessionInfo':(BuildContext context) => new SessionInfo(),
        '/joinSession': (BuildContext context) => new JoinSessionPage(),
        '/matchedSession': (BuildContext context) => new MatchedSession(),

      },
      home: new WelcomePage(),
    );
  }
}
