import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/radiobutton_sessionfocus.dart';
import '../widgets/radiobutton_genderPreference.dart';
import 'global.dart' as globals;
import '../globalUserID.dart' as globalUID;

class CreateSession2 extends StatelessWidget {
  List<Map<String, dynamic>> params;
  BuildContext context;
  CreateSession2(this.context,
      this.params); //constructor receives params from createSession

  String _level = 'Newbie';

  DocumentReference doc;
// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("New Session Info"),
          content: new Text(
              "Time  \n" + "Gym  \n" + "Focus  \n" + "Level of experience  \n"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Container(
              child: Row(
                children: <Widget>[
                  new FlatButton(
                    child: new Text("Back"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("Confirm"),
                    onPressed: () {
                      params.add({'level': _level});
                      params.add({'focus': globals.focus});
                      params.add({'sameGender': globals.sameGender});
                      params.add({'userID' : globalUID.uid});
                      add();
                      Navigator.popUntil(
                          context, ModalRoute.withName('/homepage'));
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future add() async {
    var highestID = 0;
    await Firestore.instance
        .collection('UnmatchedSession')
        .getDocuments()
        .then((doc) {
      int sessionCount = doc.documents.length;
      if (sessionCount != 0) {
        for (int i = 0; i < sessionCount; i++) {
          DocumentSnapshot session = doc.documents[i];
          int sessionID = int.parse(session['ID']);
          if (sessionID > highestID) highestID = sessionID;
        }
      }
    });

    String idNum = (highestID + 1).toString();
    doc = Firestore.instance.document('UnmatchedSession/session$idNum');
    Map<String, Object> data = <String, Object>{
      'ID': idNum,
      'location': params[0]['location'],
      'startTime': params[1]['startTime'],
      'endTime': params[2]['endTime'],
      'date': params[3]['date'],
      'focus': params[5]['focus'],
      'level': params[4]['level'],
      'sameGender': params[6]['sameGender'],
      'userID': params[7]['userID'],
      'isMatched': false,
    };
    globals.idNum = int.parse(idNum);

    doc.setData(data).whenComplete(() {
      print("UnmatchedSession/session$idNum added");
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
            child: Text(
              'Create my own session!',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 245.0, 0.0),
                    child: Text(
                      'My Focus:',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SessionfocusRadioButton(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 100.0, 0.0),
              child: Stack(
                children: <Widget>[
                  Text(
                    'My level of experience in this focus :',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(150.0, 20.0, 0.0, 0.0),
                    child: DropdownButton<String>(
                      value: _level,
                      style: TextStyle(
                          inherit: true,
                          fontSize: 20.0,
                          color: Colors.blue,
                          decorationColor: Colors.blue),
                      items: <String>[
                        'Newbie',
                        'Pro',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (item) {
                        print('[Dropdown] changed to ' + item);
                        //setState(() {//       FIXME
                        _level = item;
                        //globals.level = _level;
                        //});
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(250.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.help),
                      color: Colors.black,
                      onPressed: () {
                        print("filled background");
                      },
                    ),
                  ),
                ],
              )),
          Container(
              child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 50.0, 0.0),
                child: Text(
                  'Do you prefer partner of the same gender?',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              GenderPrefrenceRadioButton(),
            ],
          )),
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  /*Container(
                    // padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    height: 40.0,
                    width: 110.0,
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
                  ),*/
                  Container(
                    // padding: EdgeInsets.only(top: 10.0, left: 0.0, right: 20.0),
                    height: 40.0,
                    width: 100.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () {
                          //Navigator.popUntil(context, ModalRoute.withName('/homepage'));
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
                  SizedBox(height: 10.0, width: 150),
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
                          _showDialog();
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
                ],
              )),
        ],
      ),
    );
  }
}
