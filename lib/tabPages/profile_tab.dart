import 'package:flutter/material.dart';
import 'package:uber_driver/global/global.dart';

import '../splashScreen/splash_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: (){
            firebaseAuth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (c)=> SplashScreen()));
          },
          child: Text(
            "Sign Out"
          )
      ),
    );
  }
}
