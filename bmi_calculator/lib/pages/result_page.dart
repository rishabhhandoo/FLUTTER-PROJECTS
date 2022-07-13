import 'package:flutter/material.dart';
import '../reusable_card.dart';
import '../const_file.dart';
import 'input_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(

              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: KTitleTextStyle,

                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: KLargeButtonTextStyle,
                  ),
                ),
                color: kBottomContainerColur,
                width: double.infinity,
                height: 60.0,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ),
          ],
        ));
  }
}
