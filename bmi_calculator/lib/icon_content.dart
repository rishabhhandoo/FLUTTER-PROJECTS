import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const labelTextStyle = TextStyle(
  color: Color(0XFF8D8E98),
  fontSize: 18.0,
);


class IconContent extends StatelessWidget {
  IconContent({required this.icn,required this.txt });

  final String txt;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icn,
          size: 80.0,
        ),
        SizedBox(
          width: 0.0,
          height: 10.0,
        ),
        Text(txt,style: labelTextStyle)

      ],
    );
  }
}