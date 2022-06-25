import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());
final ThemeData theme = ThemeData();
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: Color(0xFF0A0E21),
        ),

      // theme: ThemeData(
      //   appBarTheme: ColorScheme.fromSeed ,
      //   primaryColor: Color(0xFF0A0E21),
      //   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      ),
      home: InputPage(),
    );
  }
}

