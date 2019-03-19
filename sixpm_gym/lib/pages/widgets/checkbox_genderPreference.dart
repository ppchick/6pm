import 'package:flutter/material.dart';

class GenderPrefrenceCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GenderPrefrenceCheckboxState();
  }
}

class _GenderPrefrenceCheckboxState extends State<GenderPrefrenceCheckbox> {
  Map<String, bool> _values = {
    'Yes': false,
  };
  Map<String, bool> _values1 = {
    'No': false,
  };

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(children: <Widget>[
        Stack(
          children: _values.keys
              .map((key) => Container(
                    height: 45.0,
                    child: CheckboxListTile(
                      value: _values[key],
                      onChanged: (value) {
                        if(flag == false){
                        setState(() {
                          _values[key] = value;
                          flag =true;
                        });}
                        if(flag == true){
                          if(value == false){
                            setState(() {
                            _values[key] = value;
                            flag =false;
                        });
                          }
                        }
                      },
                      title: new Text(key),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.red,
                    ),
                  ))
              .toList(),
        ),
          Container(
            padding:EdgeInsets.fromLTRB(200.0, 0.0, 0.0, 0.0),
            child: Stack(
              children: _values1.keys
              .map((key) => Container(
                    height: 45.0,
                    child: CheckboxListTile(
                      value: _values1[key],
                      onChanged: (value) {
                        if(flag == false){
                        setState(() {
                          _values1[key] = value;
                          flag =true;
                        });}
                        if(flag == true){
                          if(value == false){
                            setState(() {
                            _values1[key] = value;
                            flag =false;
                        });
                          }
                        }
                      },
                      title: new Text(key),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.red,
                    ),
                  ))
              .toList(),

            ),

            

          ),

        ],
          
          
        ),
   
);
  }
}

Widget getCheckboxWidgets(List<String> strings) {}
