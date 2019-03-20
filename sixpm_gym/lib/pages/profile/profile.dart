import 'package:flutter/material.dart';
import '../widgets/placeholder.dart';

final PlaceholderWidget profile_placeholder =
    new PlaceholderWidget(Colors.lightGreen, 'Profile Placeholder');

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => new _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<String> items = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: 300,
              color: Colors.black.withOpacity(0.7),
            ),
            clipper: GetClipper(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(35.0, 55.0, 0, 0),
                    child: Material(
                      elevation: 4.0,
                      shape: CircleBorder(),
                      color: Colors.transparent,
                      child: Ink.image(
                        image: AssetImage('img/avatar1.png'),
                        fit: BoxFit.cover,
                        width: 120.0,
                        height: 120.0,
                        child: InkWell(
                          onTap: () {
                            print('[Avatar] Tapped');
                          },
                          child: null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 80.0, 0, 0),
                    child: Text(
                      'USERNAME',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      trailing: Icon(Icons.favorite),
                      title: Text(
                        'Interest',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      trailing: Icon(Icons.accessibility_new),
                      title: Text(
                        'Strength',
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    // FIXME should be scrollable
                    ListTile(
                      dense: true,
                      trailing: Icon(Icons.accessibility_new),
                      title: Text(
                        'Noti1',
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      trailing: Icon(Icons.accessibility_new),
                      title: Text(
                        'Noti2',
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      trailing: Icon(Icons.accessibility_new),
                      title: Text(
                        'Noti3',
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 30.0,
                width: 200.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.redAccent,
                  color: Colors.red,
                  elevation: 7.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.popUntil(
                          context, (Route<dynamic> route) => route.isFirst);
                    },
                    child: Center(
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

          // SizedBox(child: -20.0,)
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
