import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Center(child: (Text('Dice'))),
        backgroundColor: Colors.redAccent,
      ),
      body: DicePage(),
    ),
  ));
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}


class _DicePageState extends State<DicePage> {
  //we can define the variable here as well but then it wont get loaded when we hot relode
  int leftDiceNumber=1;
  int rightDiceNumber=1;
  void changeDice(){
    rightDiceNumber=Random().nextInt(6)+1;
    leftDiceNumber=Random().nextInt(6)+1;
  }
  @override
  Widget build(BuildContext context) {
//so we need to keep it inside the build method
//but declare it outside build cuz we dont want it to load each time we build
// var leftDiceNumber=1;
//     leftDiceNumber=1;

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(child: TextButton(
              onPressed: (){
                  setState(() {
                    // leftDiceNumber=Random().nextInt(6)+1;
                    // rightDiceNumber=Random().nextInt(6)+1;
                    changeDice();
                    print('left Dice was changed to $leftDiceNumber');
                  });
              },
              child: Image.asset('images/dice$leftDiceNumber.png')
          )),
          Expanded( child: TextButton(
              onPressed: (){
                setState(() {
                  // rightDiceNumber=Random().nextInt(6)+1;
                  // leftDiceNumber=Random().nextInt(6)+1;
                  changeDice();
                  print('right Dice was changed to $rightDiceNumber');
                });

              },
              child: Image.asset('images/dice$rightDiceNumber.png'))),
        ],
      ),
    );
  }
}

