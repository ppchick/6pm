import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final Text text;

  PlaceholderWidget(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: text,
    );
  }
}
