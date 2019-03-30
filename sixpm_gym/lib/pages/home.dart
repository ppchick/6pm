import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './widgets/sessionMain.dart';
import './gym/gym.dart';
import './profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState(user);
  }
}

class _HomePageState extends State<HomePage> {
  final FirebaseUser user;
  _HomePageState(this.user);
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      GymPage(storage: GymStorage()),
      SessionMainPage(),
      MyProfile(
        user: user,
      ),
    ];
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: SignOut,
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

  void SignOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }
}
