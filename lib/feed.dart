// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      body: Center(
        child: Stack(children: [
          Positioned(
            top: 160, // Adjust the top value as needed
            left: 0, // Adjust the left value as needed
            child: Image.asset(
              'assets/images/42.png', // Make sure the path is correct
            ),
          ),
          Positioned(
            top: 80, // Adjust the top value as needed
            left: 160, // Adjust the left value as needed
            child: Image.asset(
              'assets/images/9.png', // Make sure the path is correct
              width: 216, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
          ),
          Positioned(
            top: 65,
            left: 70,
            child: Text(
              "FEED",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 125,
            left: 70,
            child: Text(
              "YOUR FISH",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 51,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 325,
            left: 125,
            child: LiteRollingSwitch(
              value: true,
              textOn: "On",
              textOff: "Off",
              colorOn: Color(0xff25A1AE),
              colorOff: Color.fromARGB(255, 66, 60, 60),
              iconOn: Icons.alarm_on,
              iconOff: Icons.alarm_off,
              width: 130,
              textSize: 18.0,
              onChanged: (bool position) {
                print("The button is $position");
              },
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
