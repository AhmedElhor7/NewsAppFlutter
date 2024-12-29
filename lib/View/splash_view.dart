import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/View/Home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "initial";

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // To Navigate To Home Page After 2 Seconds
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed(HomeView.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            color: Colors.white,
            child: Image.asset(
              "assets/images/backgroundImage.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Logo Image
          Center(
            child: Image.asset('assets/images/logo.jpg'),
          ),
        ],
      ),
    );
  }
}
