import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';
import '../constants.dart';
import '../Components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi,@required this.result,@required this.message});
  final String bmi;
  final result;
  final message;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT", style: TextStyle(fontSize: 20.0)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
               padding: EdgeInsets.all(15.0),
               alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    ),

              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(
              colours: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(result,style:TextStyle(color: Color(0xFF24D876), fontSize: 22.0,fontWeight: FontWeight.bold),),
                  Text(bmi,style: TextStyle(fontSize: 100.0,fontWeight: FontWeight.bold),),
                  Text(message,style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              page: () {
                Navigator.pop(context);
              },
              text: "RE-CALCULATE",
              deviceHeight: deviceHeight,
            ),
          ),
        ],
      ),
    );
  }
}
