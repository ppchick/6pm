import 'package:flutter/material.dart';

import 'pages/welcome/signup.dart';
import 'pages/welcome/welcome.dart';
import 'pages/welcome/sighup2.dart';
import 'pages/home.dart';
import 'pages/session/createSession.dart';
import 'pages/session/joinSession.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/signup2': (BuildContext context) => new SignupPage2(),
        '/createSession': (BuildContext context) => new CreateSessionPage(),
        '/joinSession': (BuildContext context) => new JoinSessionPage(),
      },
      home: new WelcomePage(),
    );
  }
}
