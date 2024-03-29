// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A747D),
      body: ListView(
        children: [
          Column(
            children: [
              Transform.translate(
                offset: Offset(25, 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's check",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Your Statistics.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 5),
                    child: Stack(
                      children: [
                        Container(
                          height: 105,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, left: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Let's check your ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Feeding Summary',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -20,
                      right: 10,
                      child: Image.asset('assets/images/cat.png')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 15,
                        child: Row(
                          children: [
                            Text(
                              "March 2024",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 255,
                        left: 23,
                        child: Text(
                          " 30        31          1          2          3          4         5",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      // Sesuaikan dengan posisi horizontal yang diinginkan
                      Positioned(
                        top: -10,
                        left: 75,
                        child: Row(
                          children: [
                            Transform.rotate(
                              angle:
                                  -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        18, // Sesuaikan dengan tinggi yang diinginkan
                                    width:
                                        205, // Sesuaikan dengan lebar yang diinginkan
                                    child: LinearPercentIndicator(
                                      lineHeight:
                                          200, // Sesuaikan dengan tinggi yang diinginkan
                                      percent: 0.4,
                                      progressColor: Colors.white,
                                      backgroundColor:
                                          Color(0xFF25A1AE).withOpacity(0.5),
                                      barRadius: Radius.circular(
                                          15), // Menambahkan radius pada ujung
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 0.6,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 0.8,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 1.0,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 0.5,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 0.4,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height:
                                          18, // Sesuaikan dengan tinggi yang diinginkan
                                      width:
                                          205, // Sesuaikan dengan lebar yang diinginkan
                                      child: LinearPercentIndicator(
                                        lineHeight:
                                            200, // Sesuaikan dengan tinggi yang diinginkan
                                        percent: 0.2,
                                        progressColor: Colors.white,
                                        backgroundColor:
                                            Color(0xFF25A1AE).withOpacity(0.5),
                                        barRadius: Radius.circular(
                                            15), // Menambahkan radius pada ujung
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 135,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                  children: [
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color(0xfff9f9f9).withOpacity(0.3),
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Transform.translate(
                        offset: Offset(25, 18),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 45,
                              child: CircularPercentIndicator(
                                radius: 35,
                                lineWidth: 8,
                                percent: 0.67,
                                progressColor: Colors.white,
                                backgroundColor: Color(0xff1A747D),
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  '67%',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total food leave this week",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '320 gram',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color(0xfff9f9f9).withOpacity(0.3),
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Transform.translate(
                          offset: Offset(25, 18),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 45,
                                child: CircularPercentIndicator(
                                  radius: 35,
                                  lineWidth: 8,
                                  percent: 0.67,
                                  progressColor: Colors.white,
                                  backgroundColor: Color(0xff1A747D),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    '67%',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total food leave this week",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '320 gram',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color(0xfff9f9f9).withOpacity(0.3),
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Transform.translate(
                          offset: Offset(25, 18),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 45,
                                child: CircularPercentIndicator(
                                  radius: 35,
                                  lineWidth: 8,
                                  percent: 0.67,
                                  progressColor: Colors.white,
                                  backgroundColor: Color(0xff1A747D),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    '67%',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total food leave this week",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '320 gram',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Container(
                      width: 350,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Transform.translate(
                        offset: Offset(0, 0),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 144,
                                  decoration: BoxDecoration(
                                      color: Color(0xfff9f9f9),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(21),
                                          bottomLeft: Radius.circular(21))),
                                ),
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Color(0xfff9f9f9).withOpacity(0.3),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(24),
                                          bottomRight: Radius.circular(24))),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 160, top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Feed your fish with the best quality.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Squarepants Fish Food, fish pellets with a mixture of vitamins.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -170,
                      left: -155,
                      child: Transform.scale(
                          scale: 0.4,
                          child: Image.asset('assets/images/food.png'))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: 350,
                        height: 155,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Transform.translate(
                          offset: Offset(0, 0),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 144,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff9f9f9),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(21),
                                            bottomLeft: Radius.circular(21))),
                                  ),
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xfff9f9f9).withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(24),
                                            bottomRight: Radius.circular(24))),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 160, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Feed your fish with the best quality.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "poppins",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Squarepants Fish Food, fish pellets with a mixture of vitamins.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: -140,
                        left: -165,
                        child: Transform.scale(
                            scale: 0.4,
                            child: Image.asset('assets/images/food.png'))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
