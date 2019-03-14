import 'package:flutter/material.dart';
import './widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
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
