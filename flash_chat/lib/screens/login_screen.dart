import 'package:flash_chat/components/rounded_buttons.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress, //so that email typing keyboard pops up
                textAlign: TextAlign.center,  // to align the text to centre
                onChanged: (value) {
                  email = value;
                },
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your email')
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your password')
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(onPressed: (){},text: 'Log in',color: Colors.lightBlueAccent,),
          ],
        ),
      ),
    );
  }
}
