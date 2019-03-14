import 'package:flutter/material.dart';

import 'pages/welcome/signup.dart';
import 'pages/welcome/welcome.dart';
import 'pages/home/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage(),
      },
      home: new WelcomePage(),
    );
  }
}
