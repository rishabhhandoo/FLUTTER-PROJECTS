import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_buttons.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;  // so that it can be used only here
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
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Email id '),
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
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Pasword',
            ),),
            SizedBox(
              height: 24.0,
            ),
           RoundedButton(onPressed: () async{
             try{
               final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
               if(newUser!=null){
                  Navigator.pushNamed(context, ChatScreen.id);
               }
             }catch(e){
               print(e);
             }
           },text: 'Register',color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
