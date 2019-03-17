import 'package:flutter/material.dart';

class InterestCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterestCheckboxWidgetState();
  }
}

class _InterestCheckboxWidgetState extends State<InterestCheckboxWidget> {
  Map<String, bool> interest_values = {
    'HIIT': false,
    'Burpees': false,
    'Yoga': false,
    'Aerobics': false,
  };

  // bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: interest_values.keys
              .map((key) => Container(
                    height: 50.0,
                    child: CheckboxListTile(
                      value: interest_values[key],
                      onChanged: (value) {
                        setState(() {
                          interest_values[key] = value;
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
