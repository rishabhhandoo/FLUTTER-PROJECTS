import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'const_file.dart';

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
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                ))
              ],
            )),
            Container(
              color: kBottomContainerColur,
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
