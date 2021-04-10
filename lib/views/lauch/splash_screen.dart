import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_persistence_example/cubits/auth_cubit.dart';
import 'package:state_persistence_example/views/auth/details_screen.dart';
import 'package:state_persistence_example/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      final AuthState authState = BlocProvider.of<AuthCubit>(context).state;
      if (authState is AuthStateAuthenticated) {
        // Go to home screen
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
      } else {
        // Go to details screen
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailsScreen()), (route) => false);
      }
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
