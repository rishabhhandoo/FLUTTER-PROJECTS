import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
  MaterialApp(
    home: BallPage(),
  ),
);

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      appBar: AppBar(
        title: Center(child:
        Text(
          'Ask Me Anything',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
        ),)),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Ball()
    );
  }
}



class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber=1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(

          onPressed: (){
            setState(() {
              ballNumber=Random().nextInt(5)+1;
              print('just trying if it works');
            });
          },
          child: Image.asset('images/ball$ballNumber.png')),
    );
  }
}
