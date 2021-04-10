import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_persistence_example/views/auth/details_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      //  TODO: Check auth status

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailsScreen()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/fdk_logo.png'),
      ),
    );
  }
}
