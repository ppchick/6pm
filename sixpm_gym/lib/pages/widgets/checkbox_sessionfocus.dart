import 'package:flutter/material.dart';

class SessionfocusCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SessionfocusCheckboxState();
  }
}

class _SessionfocusCheckboxState extends State<SessionfocusCheckbox> {
  Map<String, bool> focus_values = {
    'HIIT': false,
    'Yoga': false,
    'Aerobics': false,
  };
  Map<String, bool> focus_values1 = {
    'Burpees': false,
    'Boxing': false,
    'Strength': false,
  };

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: <Widget>[
          Column(
            children: focus_values.keys
                .map((key) => Container(
                      height: 45.0,
                      child: CheckboxListTile(
                        value: focus_values[key],
                        onChanged: (value) {
                          if (flag == false) {
                            setState(() {
                              focus_values[key] = value;
                              flag = true;
                            });
                          }
                          if (flag == true) {
                            if (value == false) {
                              setState(() {
                                focus_values[key] = value;
                                flag = false;
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
            padding: EdgeInsets.fromLTRB(180.0, 0.0, 0.0, 0.0),
            child: Column(
              children: focus_values1.keys
                  .map((key) => Container(
                        height: 45.0,
                        child: CheckboxListTile(
                          value: focus_values1[key],
                          onChanged: (value) {
                            if (flag == false) {
                              setState(() {
                                focus_values1[key] = value;
                                flag = true;
                              });
                            }
                            if (flag == true) {
                              if (value == false) {
                                setState(() {
                                  focus_values1[key] = value;
                                  flag = false;
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
