import 'package:flutter/material.dart';

class InterestCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterestCheckboxWidgetState();
  }
}

class _InterestCheckboxWidgetState extends State<InterestCheckboxWidget> {
  Map<String, bool> interestValues = {
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
          children: interestValues.keys
              .map((key) => Container(
                    height: 45.0,
                    child: CheckboxListTile(
                      value: interestValues[key],
                      onChanged: (value) {
                        setState(() {
                          interestValues[key] = value;
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

//Widget getCheckboxWidgets(List<String> strings) {}
