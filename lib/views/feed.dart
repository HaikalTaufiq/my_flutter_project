// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/graph/bar_graph.dart';
import 'package:flutter_application_1/models/alarm_info.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_application_1/alarm_helper.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<double> weeklySummary = [
    80.10,
    60.50,
    50.10,
    40.40,
    64.30,
    80.10,
    90.10,
  ];

  AlarmHelper _alarmHelper = AlarmHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A747D),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/42.png'),
            fit: BoxFit.contain, // Adjust as needed
          ),
        ),
        child: ListView(
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
                            height: 115,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: Color(0xffEFEFEF).withOpacity(0.3)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 28),
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
                      top: -15,
                      right: 5,
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/images/cat.png'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, bottom: 15),
                  child: Row(
                    children: [
                      Text(
                        "April 2024",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 168),
                        child: IconButton(
                          icon: Transform.rotate(
                            angle:
                                pi / 2, // Rotate icon 90 degrees for down arrow
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            final List<AlarmInfo> alarms =
                                await _alarmHelper.getAlarms();

                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.75, // 75% of screen height
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        // Header section
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            'Amount History', // Replace with your title
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap:
                                              true, // Prevent excessive scrolling
                                          itemCount: alarms.length,
                                          itemBuilder: (context, index) {
                                            final alarm = alarms[index];
                                            final formattedDate = DateFormat(
                                                    'EEEE, d MMM, yyyy')
                                                .format(alarm.alarmDateTime!);
                                            final formattedTime =
                                                DateFormat('h:mm a').format(
                                                    alarm.alarmDateTime!);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '($formattedDate)',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                      Text(
                                                        ' at $formattedTime',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${alarm.amount} gram',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                        // ... Add more rows or other widgets as needed
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Container(
                    width: 400,
                    height: 250,
                    child: Center(
                      child: MyBarGraph(
                        weeklySummary: weeklySummary,
                      ),
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
                            color: Color(0xffefefef).withOpacity(0.3),
                            border: Border.all(
                                width: 5,
                                color: Color(0xffEFEFEF).withOpacity(0.3)),
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
                                  percent: 0.87,
                                  progressColor: Colors.white,
                                  backgroundColor: Color(0xff1A747D),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    '87%',
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
                              color: Color(0xffefefef).withOpacity(0.3),
                              border: Border.all(
                                  width: 5,
                                  color: Color(0xffEFEFEF).withOpacity(0.3)),
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
                              color: Color(0xffefefef).withOpacity(0.3),
                              border: Border.all(
                                  width: 5,
                                  color: Color(0xffEFEFEF).withOpacity(0.3)),
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
                            border: Border.all(
                                color: Colors.white.withOpacity(0.7), width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
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
                            border: Border.all(
                                color: Colors.white.withOpacity(0.7), width: 3),
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
                                          color: Color(0xfff9f9f9)
                                              .withOpacity(0.3),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(24),
                                              bottomRight:
                                                  Radius.circular(24))),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 160, top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
      ),
    );
  }
}
