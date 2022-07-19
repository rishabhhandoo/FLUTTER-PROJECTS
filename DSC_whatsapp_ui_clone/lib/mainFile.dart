import 'dart:ui';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'WhatsApp',
          style: TextStyle(
              color: Color(0xff232026),
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: (){}, icon:Icon. )
        ],
      ),
    );
  }
}
