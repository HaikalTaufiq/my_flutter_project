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
                  left: -129,
                  child: Container(
                    height: 385,
                    width: 650,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(400),
                        bottomRight: Radius.circular(400),
                      ),
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
                  top: 214,
                  left: 294,
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF25A1AE),
                          Color(0xFF25A1AE),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
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
                    backgroundColor: Colors.black,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '67%',
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
                    "Statistics",
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
                        showModalBottomSheet(
                          backgroundColor: Color(0xFF252525),
                          useRootNavigator: true,
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setModalState) {
                              return Container(
                                padding: EdgeInsets.all(23),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 12,
                                      left: 1,
                                      child: Text(
                                        "Feeding Statistics :",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 201,
                                      left: 2,
                                      child: Text(
                                        "___________________________________",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 180,
                                      left: 10,
                                      child: Text(
                                        " Mon     Tue     Wed      Thu       Fri       Sat      Sun",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 238,
                                      left: 12,
                                      child: Text(
                                        "This Week",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 276,
                                      left: 12,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 100,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFF25A1AE),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Total Feed/day",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "poppins",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  Text(
                                                    "10 gram",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "poppins",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 276,
                                      left: 185,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 100,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFF25A1AE),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Total Output",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "poppins",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  Text(
                                                    "70 gram",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "poppins",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 318,
                                      left: 280,
                                      child: CircularPercentIndicator(
                                        radius: 23,
                                        lineWidth: 4,
                                        percent: 0.70,
                                        progressColor: Colors.white,
                                        backgroundColor: Color(0xFF252525),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                          '70%',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 318,
                                      left: 105,
                                      child: CircularPercentIndicator(
                                        radius: 23,
                                        lineWidth: 4,
                                        percent: 0.14,
                                        progressColor: Colors.white,
                                        backgroundColor: Color(0xFF252525),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                          '14%',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          -35, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.6,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          15, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.7,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          65, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.8,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          115, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.9,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          165, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 1.0,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          215, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.8,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          102, // Sesuaikan dengan posisi vertikal yang diinginkan
                                      left:
                                          265, // Sesuaikan dengan posisi horizontal yang diinginkan
                                      child: Transform.rotate(
                                        angle:
                                            -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                                        child: Container(
                                          height:
                                              18, // Sesuaikan dengan tinggi yang diinginkan
                                          width:
                                              125, // Sesuaikan dengan lebar yang diinginkan
                                          child: LinearPercentIndicator(
                                            lineHeight:
                                                200, // Sesuaikan dengan tinggi yang diinginkan
                                            percent: 0.6,
                                            progressColor: Color(0xFF25A1AE),
                                            backgroundColor: Colors.white,
                                            barRadius: Radius.circular(
                                                15), // Menambahkan radius pada ujung
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        );
                      });
                    },
                    child: Image.asset(
                      'assets/images/Panah.png',
                      width: 326,
                      height: 72,
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
        iconPadding: 16,
        height: 70,
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
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              color:
                  Color(0xff25A1AE), // Ganti dengan warna biru yang diinginkan
            ),
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              'assets/images/home.png',
            ),
            label: 'Home',
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              color:
                  Color(0xff25A1AE), // Ganti dengan warna biru yang diinginkan
            ),
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/images/calendar.png'),
            label: 'Statistic',
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              color:
                  Color(0xff25A1AE), // Ganti dengan warna biru yang diinginkan
            ),
          ),
        ],
      ),
    );
  }
}
