import 'package:flutter/material.dart';
import './widgets/sessionMain.dart';
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
    session,
    profile_placeholder,
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('Logout'),
          ),
        ],
        // elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        //backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.map), title: new Text("gym")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("session")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("profile"))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
