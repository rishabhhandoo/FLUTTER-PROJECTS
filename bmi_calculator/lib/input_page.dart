import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 65.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColur = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: IconContent(icn: FontAwesomeIcons.mars,txt:'MALE',),
                )),
                Expanded(child: ReusableCard(colour: activeCardColour,
                  cardChild:IconContent(icn: FontAwesomeIcons.venus,txt: 'FEMALE',)
                  ,))
              ],
            )),
            Expanded(
              child: ReusableCard(colour: activeCardColour),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                ))
              ],
            )),
            Container(
              color: bottomContainerColur,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}

