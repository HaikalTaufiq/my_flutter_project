// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_application_1/feed.dart';
import 'package:flutter_application_1/history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Indeks awal untuk menunjukkan halaman Feed
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Feed(),
          Center(
            child: Stack(
              children: [
                Positioned(
                  top: -200,
                  left: -27,
                  child: Container(
                    height: 385,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 39, 73, 77),
                          Color.fromARGB(255, 39, 73, 77),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 35, // Adjust the top value as needed
                    left: 20, // Adjust the left value as needed
                    child: Image.asset('assets/images/Logo.png')),
                Positioned(
                  top: 85,
                  left: 34,
                  child: Container(
                    height: 185,
                    width: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF25A1AE),
                          Color(0xFF25A1AE),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(4, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 69, // Adjust the top value as needed
                  left: 145, // Adjust the left value as needed
                  child: Image.asset(
                    'assets/images/Man.png', // Make sure the path is correct
                    width: 216, // Adjust the width as needed
                    height: 216, // Adjust the height as needed
                  ),
                ),
                Positioned(
                  top: 198, // Adjust the top value as needed
                  left: 34, // Adjust the left value as needed
                  child: Image.asset(
                    'assets/images/Rec.png', // Make sure the path is correct
                    width: 326, // Adjust the width as needed
                    height: 72, // Adjust the height as needed
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 290,
                  child: CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 4,
                    percent: 0.67,
                    progressColor: Colors.white,
                    backgroundColor: Color(0xFF1A747D),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '10%',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 214,
                  left: 54,
                  child: Text(
                    "Week's feed amount (Gram)",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Positioned(
                  top: 233,
                  left: 54,
                  child: Text(
                    "320 gram",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 295,
                  left: 34,
                  child: Container(
                    height: 85,
                    width: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF25A1AE),
                          Color(0xFF25A1AE),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(4, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 322,
                  left: 125,
                  child: Text(
                    "Monday",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 304, // Adjust the top value as needed
                  left: -85, // Adjust the left value as needed
                  child: Image.asset(
                    'assets/images/Group.png', // Make sure the path is correct
                    width: 326, // Adjust the width as needed
                    height: 72, // Adjust the height as needed
                  ),
                ),
                Positioned(
                  top: 283,
                  left: 175,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Image.asset(
                      'assets/images/Panah.png',
                      width: 326,
                      height: 72,
                    ),
                  ),
                ),
                Positioned(
                  top: 374,
                  left: 33,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height: isExpanded ? 200 : 0,
                    width: 325,
                    decoration: BoxDecoration(
                      color: Color(
                          0xFF020810), // Sesuaikan dengan warna yang diinginkan
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(4, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 11,
                          left: 33,
                          child: Text(
                            "Days",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 40,
                          child: Text(
                            "M      T      W      T      F      S",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 105,
                          left: 40,
                          child: Text(
                            "temperature",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          History(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF252525),
        color: Color(0xFFD9D9D9),
        iconPadding: 15,
        height: 65,
        index: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: [
          CurvedNavigationBarItem(
            child: Image.asset('assets/images/calendar.png'),
            label: 'Feed',
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              'assets/images/home.png',
            ),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/images/statistics.png'),
            label: 'Statistic',
          ),
        ],
      ),
    );
  }
}
