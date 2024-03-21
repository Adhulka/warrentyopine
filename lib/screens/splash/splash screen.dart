import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';


void main(){
  runApp(MaterialApp(home: SplashScreen(),));
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void  intiState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/splash.png'),fit: BoxFit.fill)
        ),
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/w.png'))),
          ),
        ),
      ),
    );
  }
}
