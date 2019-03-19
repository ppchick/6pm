import 'package:flutter/material.dart';

class JoinSessionPage extends StatefulWidget {
  @override
  JoinSessionState createState() => JoinSessionState();
}

class JoinSessionState extends State<JoinSessionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(60.0, 50.0, 0.0, 0.0),
              child: Text('Join A Session!',
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10.0),
            // NOTE Filters Button
            Container(
              height: 40.0,
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
                    print('[Join Filter] Pressed');
                    //Navigator.of(context).pushNamed('/joinFilter');
                  },
                  child: Center(
                    child: Text(
                      'Filter Results',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            new Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard;
                },
              ),
            )
          ],
        ));
  }
}

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew,
          color: Colors
              .white), //NOTE PROFILE PIC OF USER WHO POSTED THE SESSION HERE
    ),
    title: Text(
      "DATE TIME HERE", //NOTE CHANGE TO DATE AND TIME OF SESSION
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: <Widget>[
        Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(" LOCATION AND FOCUS HERE",
            style: TextStyle(
                color: Colors
                    .white)) //NOTE CHANGE TO LOCATION AND FOCUS OF SESSION
      ],
    ),
    trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
