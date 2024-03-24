// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:flutter_application_1/service/notif_service.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/home_page.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
      backgroundColor: Color(0xff252525),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/42.png'),
                  fit: BoxFit.contain, // Adjust as needed
                ),
              ),
              child: Center(
                child: Stack(children: [
                  Positioned(
                    top: 50, // Adjust the top value as needed
                    left: 163, // Adjust the left value as needed
                    child: Image.asset(
                      'assets/images/9.png', // Make sure the path is correct
                      width: 216, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 62,
                    child: Text(
                      "FEED",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 95,
                    left: 65,
                    child: Text(
                      "YOUR FISH",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 51,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        250, // Sesuaikan dengan posisi vertikal yang diinginkan
                    left:
                        49, // Sesuaikan dengan posisi horizontal yang diinginkan
                    child: Container(
                      height: 600, // Sesuaikan dengan tinggi yang diinginkan
                      width: 300, // Sesuaikan dengan lebar yang diinginkan
                      child: Lottie.asset('assets/json/jelly.json'),
                    ),
                  ),
                  Positioned(
                    top: 325,
                    left: 169,
                    child: Transform.scale(
                      scale: 3.0, // Mengatur faktor perbesaran
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
                        activeColor: Colors.white, // Warna ketika switch aktif
                        activeTrackColor: Color(
                            0xFF25A1AE), // Warna track ketika switch aktif
                        inactiveThumbColor: Colors
                            .grey, // Warna thumb ketika switch tidak aktif
                        inactiveTrackColor: Colors
                            .grey[300], // Warna track ketika switch tidak aktif
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          HomePage(),
          History()
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
            child: Image.asset('assets/images/clock.png'),
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
