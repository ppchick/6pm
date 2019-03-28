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
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    GymPage(),
    SessionWidget(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home ${widget.user.email}'),
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
      // body: StreamBuilder<DocumentSnapshot>(
      //   stream: Firestore.instance
      //       .collection('Profile')
      //       .document(widget.user.uid)
      //       .snapshots(),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     }
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Text('Loading..');
      //       default:
      //         // return Text(snapshot.data['username']);
      //         return _children[_currentIndex];
      //     }
      //   },
      // ),
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
    return FirebaseAuth.instance.signOut();
  }
}
