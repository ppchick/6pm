import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  final FirebaseUser user;
  MyProfile({Key key, @required this.user}) : super(key: key);
  @override
  _MyProfileState createState() => new _MyProfileState(user);
}

class _MyProfileState extends State<MyProfile> {
  // List<String> items = ['1', '2', '3'];
  final FirebaseUser user;
  _MyProfileState(this.user);

  Future<DocumentSnapshot> getProfileDocument() async {
    DocumentSnapshot document =
        await Firestore.instance //Get current user profile
            .collection('Profile')
            .document(user.uid)
            .get();
    return document;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: getProfileDocument(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Scaffold(
                body: Stack(
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
                              padding: EdgeInsets.fromLTRB(40.0, 80.0, 0, 0),
                              child: Container(
                                padding: EdgeInsets.all(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data['username'],
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20.0),
                                        ),
                                        SizedBox(width: 5.0),
                                        snapshot.data['gender'] == 'male'
                                            ? Image.asset(
                                                'img/male.png',
                                                height: 20.0,
                                                width: 20.0,
                                              )
                                            : Image.asset(
                                                'img/female.png',
                                                height: 20.0,
                                                width: 20.0,
                                              )

                                        // SizedBox(width: 110.0),
                                        // Text(
                                        //   '5.8km',
                                        //   style: TextStyle(
                                        //       fontFamily: 'Montserrat',
                                        //       fontSize: 20.0,
                                        //       color: Colors.grey),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: 9.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'You have exercised ' +
                                              snapshot.data['hourSum']
                                                  .toString() +
                                              ' hours!',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              // Text(
                              //   snapshot.data['username'],
                              //   style: TextStyle(
                              //       fontSize: 30.0,
                              //       fontFamily: 'Montserrat',
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.star),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    snapshot.data['currentRating'].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0),
                                  ),
                                  // SizedBox(width: 110.0),
                                  // Text(
                                  //   '5.8km',
                                  //   style: TextStyle(
                                  //       fontFamily: 'Montserrat',
                                  //       fontSize: 20.0,
                                  //       color: Colors.grey),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Interest',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(Icons.favorite_border)

                                    // SizedBox(width: 110.0),
                                    // Text(
                                    //   '5.8km',
                                    //   style: TextStyle(
                                    //       fontFamily: 'Montserrat',
                                    //       fontSize: 20.0,
                                    //       color: Colors.grey),
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 9.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['interest']
                                          .toString()
                                          .substring(0, 48),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 9.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['interest']
                                          .toString()
                                          .substring(48, 100),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Strength',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(Icons.accessibility_new)

                                    // SizedBox(width: 110.0),
                                    // Text(
                                    //   '5.8km',
                                    //   style: TextStyle(
                                    //       fontFamily: 'Montserrat',
                                    //       fontSize: 20.0,
                                    //       color: Colors.grey),
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 9.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['strength']
                                          .toString()
                                          .substring(0, 48),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 9.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['strength']
                                          .toString()
                                          .substring(48, 100),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        // Card(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Container(
                        //         padding:
                        //             EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                        //         child: Text(
                        //           'Notification',
                        //           style: TextStyle(
                        //               fontSize: 20.0,
                        //               fontFamily: "Montserrat",
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),

                        //       // FIXME should be scrollable
                        //       ListTile(
                        //         dense: true,
                        //         trailing: Icon(Icons.accessibility_new),
                        //         title: Text(
                        //           'Noti1',
                        //           style: TextStyle(fontFamily: "Montserrat"),
                        //         ),
                        //       ),
                        //       ListTile(
                        //         dense: true,
                        //         trailing: Icon(Icons.accessibility_new),
                        //         title: Text(
                        //           'Noti2',
                        //           style: TextStyle(fontFamily: "Montserrat"),
                        //         ),
                        //       ),
                        //       ListTile(
                        //         dense: true,
                        //         trailing: Icon(Icons.accessibility_new),
                        //         title: Text(
                        //           'Noti3',
                        //           style: TextStyle(fontFamily: "Montserrat"),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 25.0,
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
                              onTap: signOut,
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
          } else {
            return new CircularProgressIndicator();
          }
        });
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
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
