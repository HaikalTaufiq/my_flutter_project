// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter_application_1/service/notif_service.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchValue = false;
  Timer? _timer;

  int _currentIndex = 1; // Indeks awal untuk menunjukkan halaman Feed
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer in the dispose method
    _pageController.dispose();
    super.dispose();
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A747D),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Feed(),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BackG.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "Let's check",
                          style: TextStyle(
                              color: Color(0xffF9F9F9),
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "the fish feeder today.",
                        style: TextStyle(
                            color: Color(0xffF9F9F9),
                            fontFamily: "poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 407,
                              width: 303,
                              decoration: BoxDecoration(
                                color: Color(0xffEFEFEF).withOpacity(0.7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(34)),
                                border: Border.all(
                                    width: 5,
                                    color: Color(0xffEFEFEF).withOpacity(0.3)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(34),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    color: Colors.transparent,
                                    // Konten Anda bisa ditaruh di sini
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 35,
                                left: 50,
                                child: Image.asset('assets/images/Man.png')),
                          ],
                        ),
                        Positioned(
                          top: 240,
                          child: Container(
                            width: 303,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250,
                          left: 78,
                          child: Text(
                            "SQUAREPANTS",
                            style: TextStyle(
                                color: Color(0xff12171D),
                                fontFamily: "poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 275,
                          left: 49,
                          child: Text(
                            "Toggle switch to feed your fish",
                            style: TextStyle(
                                color: Color(0xff12171D),
                                fontFamily: "poppins",
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Positioned(
                          top: 322,
                          left: 125,
                          child: Transform.scale(
                            scale: 2.3, // Mengatur faktor perbesaran
                            child: Switch(
                              value: switchValue, // Nilai switch (true/false)
                              onChanged: (bool newValue) {
                                setState(() {
                                  switchValue = newValue;
                                  if (newValue) {
                                    NotificationService.showNotif(
                                        "Feeding", "The Fish has been fed");
                                    _timer = Timer(Duration(seconds: 5), () {
                                      if (mounted) {
                                        setState(() {
                                          switchValue = false;
                                        });
                                      }
                                    });
                                  }
                                });
                              },
                              activeColor:
                                  Colors.white, // Warna ketika switch aktif
                              activeTrackColor: Color(
                                  0xFF25A1AE), // Warna track ketika switch aktif
                              inactiveThumbColor: Colors
                                  .white, // Warna thumb ketika switch tidak aktif
                              inactiveTrackColor:
                                  Color(0xff12171D).withOpacity(0.8),
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
          History()
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xff1A747D),
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
            child: Image.asset(
              'assets/images/stat.png',
            ),
            label: 'Statistic',
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
            label: 'Schedule',
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
