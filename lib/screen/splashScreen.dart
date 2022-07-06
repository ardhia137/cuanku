import 'dart:async';

import 'package:cuanku/theme.dart';
import 'package:cuanku/widget/clipPathWidget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        child: Stack(
          children: [
            Center(
                child: Image.asset(
              'assets/cuanku.png',
              width: 239,
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 273,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 65,
                    width: 65,
                    margin: EdgeInsets.only(right: 100,top: 40),
                    decoration: BoxDecoration(
                        color: Color(0xffFFD376),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
            ),
            QuarterCircle(
              circleAlignment: CircleAlignment.bottomLeft,
              color: secondaryColor2,
              radius: 150,
            ),
            QuarterCircle(
              circleAlignment: CircleAlignment.bottomRight,
              color: secondaryColor3,
              radius: 195,
            ),
          ],
        ),
      ),
    );
  }
}

