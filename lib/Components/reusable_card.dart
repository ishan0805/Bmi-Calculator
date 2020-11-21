import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colours, this.cardChild,this.onPress});

  final Color colours;
  final Widget cardChild;
  final Function onPress ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colours,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
