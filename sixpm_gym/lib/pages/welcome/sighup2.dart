import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import '../widgets/date_picker.dart';

class SignupPage2 extends StatefulWidget {
  @override
  _SignupPageState2 createState() => _SignupPageState2();
}

class _SignupPageState2 extends State<SignupPage2> {
  String _genderValue = 'Male';
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
                      padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                      child: Text(
                        'Almost there',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(250.0, 60.0, 0.0, 0.0),
                      child: Text(
                        '!',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffe8a71)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 0),
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Gender:  ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              new DropdownButton<String>(
                                value: _genderValue,
                                style: TextStyle(
                                    inherit: true,
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue),
                                items: <String>['Male', 'Female', 'Other']
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  print('[Dropdown] changed to ' + item);
                                  setState(() {
                                    _genderValue = item;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                          child: DatePickerWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
