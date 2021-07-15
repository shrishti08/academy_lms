import 'package:academy_lms/Theme/colors.dart';
import 'package:flutter/material.dart';

class LineContainer extends StatefulWidget {
  @override
  _LineContainerState createState() => _LineContainerState();
}

class _LineContainerState extends State<LineContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      color: textFieldColor,
    );
  }
}
