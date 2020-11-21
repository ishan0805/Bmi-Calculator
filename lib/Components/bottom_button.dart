import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {


  final double deviceHeight;
  final String text;
  final Function page;
  BottomButton({this.deviceHeight,@required this.page,@required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: page,
      child: Container(
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))),
        color: kBottomBarColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: deviceHeight * 0.08,
      ),
    );
  }
}