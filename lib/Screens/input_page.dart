import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/reusable_card.dart';
import '../constants.dart';
import '../Components/RoundIconButton.dart';
import 'result_page.dart';
import '../Components/bottom_button.dart';
import 'package:bmi_calculator/brain.dart';
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colours: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: SafeArea(
                      child: IconContents(
                        icon: FontAwesomeIcons.male,
                        text: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colours: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: SafeArea(
                      child: IconContents(
                        icon: FontAwesomeIcons.female,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colours: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                      ),
                    ),
                    /*  SizedBox(
                     height: 8.0,
                   ),*/
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "CM",
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          inactiveColor: kInactiveCardColor,
                          activeColor: kBottomBarColor,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                    //  Slider(value: ,onChanged: (x){},),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colours: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "kg",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colours: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(deviceHeight: deviceHeight,text:"CALCULATE",
              page: () {
              Brain calc=Brain(weight: weight,height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ResultPage(bmi:calc.getBmi(),result: calc.getresult(),message: calc.getMessage(),),),
                );
              },
          ),
        ],
      ),
    );
  }
}


