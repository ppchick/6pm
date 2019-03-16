import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String text;

  PlaceholderWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      child: Card(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontSize: 40.0,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
