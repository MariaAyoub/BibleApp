import 'package:flutter/material.dart';
import 'dart:async'; // For Future.delayed
import 'HomePage.dart'; // Import the HomePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds, then navigate to the home page
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png', // Your splash image
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
