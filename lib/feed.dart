// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            top: 250, // Adjust the top value as needed
            left: 0, // Adjust the left value as needed
            child: Image.asset(
              'assets/images/42.png', // Make sure the path is correct
            ),
          ),
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
            top: 250, // Sesuaikan dengan posisi vertikal yang diinginkan
            left: 49, // Sesuaikan dengan posisi horizontal yang diinginkan
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
                  value: true, // Nilai switch (true/false)
                  onChanged: (bool newValue) {
                    // Fungsi yang dipanggil ketika nilai switch berubah
                    // Anda dapat menambahkan logika yang sesuai di sini
                  },
                  activeColor: Colors.white, // Warna ketika switch aktif
                  activeTrackColor:
                      Color(0xFF25A1AE), // Warna track ketika switch aktif
                  inactiveThumbColor:
                      Colors.grey, // Warna thumb ketika switch tidak aktif
                  inactiveTrackColor:
                      Colors.grey[300], // Warna track ketika switch tidak aktif
                ),
              )),
        ]),
      ),
    );
  }
}
