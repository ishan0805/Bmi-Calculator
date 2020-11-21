import 'package:flutter/material.dart';
import '../constants.dart';


class IconContents extends StatelessWidget {
  final IconData icon;
  final String text;
  IconContents({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Icon(
            icon,
            size: 90.0,
          ),
        ),
        SizedBox(
          height: 1.0,
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            style:kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}