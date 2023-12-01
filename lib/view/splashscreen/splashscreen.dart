import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minto_softronics/view/loginscreen/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Loginscreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
        "assets/minto logo.gif",
        height: 200,
        width: 230,
      )),
    );
  }
}
