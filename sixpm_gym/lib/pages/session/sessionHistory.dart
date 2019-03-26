import 'package:flutter/material.dart';

class SessionHistory extends StatefulWidget{
  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
          title: Text('Back'),
          // elevation: 0.0,
        ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text('History',
              style:TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold
              )
            )
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
      )
    );
  }
}


final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: 
      Container(
            height: 80,
            padding: EdgeInsets.only(left:30.0,top:5.0),
            // decoration: new BoxDecoration(
            //   border: new Border.all(color: Colors.black),
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            child: Center(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.black,
                size: 70.0
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('19:30 - 21:30, 12/03/2019',
                      style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold
                    )),
                    Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(         
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
                                  child: Center(
                                    child:Text('Location',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                                ),
                              )
                            )
                          ),
                          Container(         
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
                                  child: Center(
                                    child:Text('Focus',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                                ),
                              )
                            )
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            ],)
            )
            
        ),
  );