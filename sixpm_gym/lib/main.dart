import 'package:flutter/material.dart';
import 'package:sixpm_gym/homepage.dart';
import 'package:sixpm_gym/loginpage.dart';
import 'package:sixpm_gym/signup.dart';
//import 'package:firebase_auth/firebase_auth.dart';
void main()=>runApp(FireAuth());

class FireAuth extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Firebase Auth",
      debugShowCheckedModeBanner: false,
theme: ThemeData(primarySwatch: Colors.blue),
      home:LoginPage(),
      routes: <String,WidgetBuilder>{
        "/userpage":(BuildContext context)=>new Page(),
        "/loginpage":(BuildContext context)=>new LoginPage(),
        "/signup":(BuildContext context)=>new SignUpPage()

      },
    );
  }
}