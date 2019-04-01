import 'package:flutter/material.dart';

import 'pages/welcome/signup.dart';
import 'pages/welcome/welcome.dart';
import 'pages/session/createSession.dart';
import 'pages/session/sessionInfo.dart';
import 'pages/session/joinSession.dart';
import 'pages/session/sessionHistory.dart';
import 'pages/session/matchedSession.dart';
import 'pages/session/search_session_gym.dart';
import 'pages/session/rateSession.dart';
import 'pages/gym/gym.dart';
import 'pages/session/checkin.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/sessionHistory': (BuildContext context) => new SessionHistory(),
        '/rateSession': (BuildContext context) => new RateSession(),
        '/createSession': (BuildContext context) => new CreateSession(),
        '/sessionInfo': (BuildContext context) => new SessionInfo(),
        '/joinSession': (BuildContext context) => new JoinSessionPage(),
        '/matchedSession': (BuildContext context) => new MatchedSession(),
        '/searchSession': (BuildContext context) => new SearchSession(),
        '/checkIn': (BuildContext context) => new SessionCheckIn(),
        '/gympage': (BuildContext context) => new GymPage(storage: GymStorage()),
      },
      home: new WelcomePage(),
    );
  }
}
