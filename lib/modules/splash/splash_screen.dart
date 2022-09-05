import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Image.asset(
          'assets/images/News_Nation.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
