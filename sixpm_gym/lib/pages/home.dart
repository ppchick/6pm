import 'package:flutter/material.dart';
import './session/session.dart';
import './gym/gym.dart';
import './profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    gym_placeholder,
    session_placeholder,
    profile_placeholder,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        backgroundColor: Colors.white,
        body: _children[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.map), title: new Text("gym")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("home")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.person), title: new Text("profile"))
          ],
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
