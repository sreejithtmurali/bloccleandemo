// presentation/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:blocclean/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after a delay
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Implement your splash screen UI
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
