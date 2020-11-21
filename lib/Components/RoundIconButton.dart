import 'package:flutter/material.dart';
import '../constants.dart';
class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconButton({@required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
      width: 56.0,
    height: 56.0,),
      fillColor:  Color(0xFF4C4F5E),
    );
  }

}
