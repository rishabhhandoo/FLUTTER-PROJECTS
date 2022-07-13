import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.black,
              ),
              child: Text('Go To Screen 1'),
              onPressed: () {
                //Navigate to Screen 1
                Navigator.pushNamed(context, '/first');
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Go To Screen 2'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}
