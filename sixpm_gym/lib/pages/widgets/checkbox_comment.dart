import 'package:flutter/material.dart';

class CommentCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommentCheckboxState();
  }
}

class _CommentCheckboxState extends State<CommentCheckbox> {
  Map<String, bool> comment_values = {
    'Helpful': false,
    'Considerate': false,
    'Responsible': false,
  };
  Map<String, bool> comment_values1 = {
    'Enthusiastic': false,
    'Punctual': false,
    'Skilful': false,
  };

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: new Stack(
        children: <Widget>[
          Column(
            children: comment_values.keys
                .map((key) => Container(
                      height: 45.0,
                      child: CheckboxListTile(
                        value: comment_values[key],
                        onChanged: (value) {
                        setState(() {
                          comment_values[key] = value;
                          });
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
              children: comment_values1.keys
                  .map((key) => Container(
                        height: 45.0,
                        child: CheckboxListTile(
                          value: comment_values1[key],
                          onChanged: (value) {
                        setState(() {
                          comment_values1[key] = value;
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
        ],
      ),
    );
  }
}

Widget getCheckboxWidgets(List<String> strings) {}
