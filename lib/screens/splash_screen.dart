import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy_courses/components/components.dart';
import 'package:udemy_courses/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      navicateAndFinished(context, HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('lib/assets/images/Group 39.png')),
    );
  }
}
