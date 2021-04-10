import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_persistence_example/config/config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          // TODO: Display user details
          child: Text(
            "Hi, you're home,",
            style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
