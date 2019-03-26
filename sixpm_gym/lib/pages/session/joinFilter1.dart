import 'package:flutter/material.dart';
import '../widgets/date_picker_session.dart';
import 'global.dart' as globals;

class JoinFilter1Page extends StatefulWidget {
  @override
  JoinFilter1State createState() => new JoinFilter1State();
}

class JoinFilter1State extends State<JoinFilter1Page> {
  String _startTime = '00:00';
  String _endTime = '00:00';
  List<String> time = [
    '00:00',
    '00:30',
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
            child: Text(
              'Filter Results',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, right: 320, top: 30),
                  child: Text(
                    'Gym :',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 40.0,
                    width: 1000.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      // shadowColor: Colors.grey,
                      color: Colors.white,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/searchSession');
                        },
                        child: Center(
                          child: Text(
                            globals.gymText,
                            style: TextStyle(
                                color: Colors.black,
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
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 30.0, 0.0, 0.0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 250.0, 0.0),
                    child: Text(
                      'Time Slot :',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'FROM :  ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              new DropdownButton<String>(
                                value: _startTime,
                                style: TextStyle(
                                    inherit: true,
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue),
                                items: time.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  print('[Dropdown] changed to ' + item);
                                  setState(() {
                                    _startTime = item;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'TO :  ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              new DropdownButton<String>(
                                value: _endTime,
                                style: TextStyle(
                                    inherit: true,
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue),
                                items: time.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  print('[Dropdown] changed to ' + item);
                                  setState(() {
                                    _endTime = item;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: DatePickerSession(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 40.0,
                    width: 100.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () {
                          print('[Go Back] Pressed');
                          globals.gymText ="SEARCH FOR GYM";
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text(
                            'GO BACK',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0, width: 150),
                  Container(
                    // padding: EdgeInsets.only(top: 10.0, left: 0.0, right: 20.0),
                    height: 40.0,
                    width: 100.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/joinFilter2');
                        },
                        child: Center(
                          child: Text(
                            'NEXT',
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
              ))
        ],
      ),
    );
  }
}

