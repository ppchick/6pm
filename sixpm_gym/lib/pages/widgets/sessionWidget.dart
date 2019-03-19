import 'package:flutter/material.dart';

class SessionWidget extends StatelessWidget {
  SessionWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 30.0,
              padding: EdgeInsets.fromLTRB(65.0, 30.0, 0.0, 0.0),
              child: Text(
                'Good Afternoon!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: Text(
                'You have exercised with us for X hours.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(
                height:
                    450.0), //NOTE Replace this with list of current sessions
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // NOTE Create Session Button
                Container(
                  height: 40.0,
                  width: 180.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: InkWell(
                      onTap: () {
                        print('[Create Session] Pressed');
                        Navigator.of(context).pushNamed('/createSession');
                      },
                      child: Center(
                        child: Text(
                          'Create Session',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                // NOTE Join Session Button
                Container(
                  height: 40.0,
                  width: 180.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: InkWell(
                      onTap: () {
                        print('[Join Session] Pressed');
                        Navigator.of(context).pushNamed('/joinSession');
                      },
                      child: Center(
                        child: Text(
                          'Join Session',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
