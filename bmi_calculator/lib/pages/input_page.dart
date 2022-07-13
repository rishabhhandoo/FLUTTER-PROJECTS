import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/const_file.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

//ENUM
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;

  //1 = male , 2 = female
  // void updateColor(Gender gender){
  //
  //   if(gender==Gender.male){
  //     if(maleCardColour==inactiveCardColour){
  //       maleCardColour=activeCardColour;
  //       femaleCardColor=inactiveCardColour;
  //     }else{
  //       maleCardColour=inactiveCardColour;
  //     }
  //   }
  //
  //   if(gender==Gender.female){
  //     if(femaleCardColor==inactiveCardColour){
  //       maleCardColour=inactiveCardColour;
  //       femaleCardColor=activeCardColour;
  //     }else{
  //       femaleCardColor=inactiveCardColour;
  //     }
  //   }
  //
  // }
  int height = 180;
  int weight = 80;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icn: FontAwesomeIcons.mars,
                    txt: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icn: FontAwesomeIcons.venus,
                    txt: 'FEMALE',
                  ),
                ))
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        //onChanged is called when value is changed by the slider
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                            backgroundColor: Colors.white12,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                            backgroundColor: Colors.white12,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kActiveCardColour,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(age.toString(), style: kNumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.white12,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          backgroundColor: Colors.white12,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ]),
                ))
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResults(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColur,
        width: double.infinity,
        height: 20,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
