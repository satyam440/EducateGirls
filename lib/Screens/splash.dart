import 'dart:async';

import 'package:educategirl/Authentication/login_page.dart';
import 'package:educategirl/helper/helper.dart';
import 'package:flutter/material.dart';

import '../Authentication/login_page_new.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  bool _isSignedIn = false;
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      if (!_isSignedIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginPageNew()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage()));
      }
    });

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: Image(
              image: AssetImage("assets/images/happygirls.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ), //<- place where the image appears
      ),
    );
  }
}







