import 'package:flutter/material.dart';

class StrengthCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StrengthCheckboxWidgetState();
  }
}

class _StrengthCheckboxWidgetState extends State<StrengthCheckboxWidget> {
  Map<String, bool> strengthValues = {
    'HIIT': false,
    'Burpees': false,
    'Yoga': false,
    'Aerobics': false,
    // 'Boxing': false,
  };

  // bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: strengthValues.keys
              .map((key) => Container(
                    height: 45.0,
                    child: CheckboxListTile(
                      value: strengthValues[key],
                      onChanged: (value) {
                        setState(() {
                          strengthValues[key] = value;
                        });
                      },
                      title: new Text(key),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.red,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

Widget getCheckboxWidgets(List<String> strings) {}
