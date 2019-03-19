import 'package:flutter/material.dart';
import '../widgets/Placeholder.dart';
import '../widgets/date_picker.dart';
import '../widgets/checkbox_sessionfocus.dart';
import '../widgets/checkbox_genderPreference.dart';

class CreateSession2 extends StatefulWidget {
  @override
  CreateSessionState2 createState() => new CreateSessionState2();
}

class CreateSessionState2 extends State<CreateSession2> {
  String  _level = 'Newbie';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children:<Widget>[
        Container(
          padding : EdgeInsets.fromLTRB(10.0,80.0,0.0,0.0),
          child:Text(
            'Create my own session!',
            style: TextStyle(
              fontSize: 40.0,fontWeight: FontWeight.bold),
            ),
        ),
        Container(
          padding : EdgeInsets.fromLTRB(10.0,20.0,20.0,0.0),
          child:Card(
            color: Colors.white,
            child:Column(children: <Widget>[
              Container(
                padding : EdgeInsets.fromLTRB(0.0,10.0,245.0,0.0),
                  child:Text(
                    'My Focus :',
                    style: TextStyle(
                      fontSize: 25.0,fontWeight: FontWeight.bold),
                    ),
                ),
              SessionfocusCheckbox(),
              SizedBox(height:20),
              
            ],

        ),),),
        Container(
          padding : EdgeInsets.fromLTRB(15.0,25.0,100.0,0.0),
          child:Stack(children: <Widget>[
            Text(
              'My level of experience in this focus :',
              style: TextStyle(
                fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(150.0, 20.0, 0.0, 0.0),
              child: DropdownButton<String>(
              value: _level,
              style: TextStyle(
                  inherit: true,
                  fontSize: 20.0,
                  color: Colors.blue,
                  decorationColor: Colors.blue),
              items: <String>['Newbie','Pro',].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (item) {
                print('[Dropdown] changed to ' + item);
                setState(() {
                  _level = item;
                });
              },
                          ),
           ),
           Container(
             padding:EdgeInsets.fromLTRB(250.0, 20.0, 0.0, 0.0),
             child:IconButton(
             icon: Icon(Icons.help),
             color: Colors.black,
             onPressed: () { print("filled background"); },
          ), ),

           ],)
        ),
        Container(
          child:Column(children: <Widget>[
            Container(
              padding:EdgeInsets.fromLTRB(15.0,20.0,50.0,0.0),
              child: Text(
                'Do you prefer partner of the same gender?',
                style: TextStyle(
                  fontSize: 25.0,fontWeight: FontWeight.bold),
              ),),
            GenderPrefrenceCheckbox(),

          ],)
        ),
          Container(
          padding:EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          child:Row(children: <Widget>[
            SizedBox(width: 20,),
            Container(
              // padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),          
              height: 40.0,
              width : 110.0,
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
                    
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              
              
            ),
            SizedBox(height: 20.0,width:150),
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
                    Navigator.of(context).pushNamed('/createSession2');
                  },
                  child: Center(
                    child: Text(
                      'FINISH',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
              
            ),
          ],)
        ),


       ], ),


    );
  }
}