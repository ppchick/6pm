import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<WelcomePage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 155.0, 0.0, 0.0),
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(225.0, 155.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffe8a71))),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please enter your email';
                              }
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            validator: (input) {
                              if (input.length < 6) {
                                return 'Password is too short';
                              }
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            obscureText: true,
                          ),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 25.0, left: 20.0),
                            child: InkWell(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 7.0,
                              child: InkWell(
                                // NOTE Uncomment this and comment next line during testing
                                onTap: () {
                                  Navigator.of(context).pushNamed('/homepage');
                                },
                                // onTap: signIn,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
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
                      ),
                    ),

                    // REVIEW Login with Facebook
                    // Container(
                    //   height: 40.0,
                    //   color: Colors.transparent,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: Colors.black,
                    //             style: BorderStyle.solid,
                    //             width: 1.0),
                    //         color: Colors.transparent,
                    //         borderRadius: BorderRadius.circular(20.0)),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Center(
                    //           child:
                    //               ImageIcon(AssetImage('assets/facebook.png')),
                    //         ),
                    //         SizedBox(width: 10.0),
                    //         Center(
                    //           child: Text('Log in with facebook',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontFamily: 'Montserrat')),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to Sixpm Gym ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                      )
                    ]),
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).pushNamed('/signup');
                //   },
                //   child: Text(
                //     'Register',
                //     style: TextStyle(
                //         color: Colors.blue,
                //         fontFamily: 'Montserrat',
                //         fontWeight: FontWeight.bold,
                //         decoration: TextDecoration.underline),
                //   ),
                // )
              ],
            ),
          ],
        ));
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      debugPrint(_email);
      debugPrint(_password);
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home(user: user)));
        Navigator.pushNamed(context, '/homepage', arguments: {user: user});
        // Navigator.of(context).pushNamed('/homepage');
      } catch (e) {
        print(e.message);
      }
    }
  }
}
