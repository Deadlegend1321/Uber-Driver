import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:uber_driver/authentication/login_screen.dart';
import 'package:uber_driver/authentication/signup_screen.dart';
import 'package:uber_driver/mainScreens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 3), () async{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => LoginScreen()
          )
      );
    });
  }


  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/driver_logo.png',
              ),
              const SizedBox(height: 10,),
              const Text(
                  "Uber Driver Clone App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
