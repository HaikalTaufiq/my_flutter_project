// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff252525),
        body: Stack(
          children: [
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
              top: 30,
              left: 20,
              child: Text(
                "Statistics",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: -70, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.6,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: -20, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.5,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 30, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.6,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 80, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.7,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 130, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.8,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 180, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.9,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 326, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 230, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Transform.rotate(
                angle:
                    -1.5708, // Rotasi sebesar 90 derajat (ubah sesuai kebutuhan)
                child: Container(
                  height: 23, // Sesuaikan dengan tinggi yang diinginkan
                  width: 250, // Sesuaikan dengan lebar yang diinginkan
                  child: LinearPercentIndicator(
                    lineHeight: 200, // Sesuaikan dengan tinggi yang diinginkan
                    percent: 0.8,
                    progressColor: Color(0xFF25A1AE),
                    backgroundColor: Colors.white,
                    barRadius:
                        Radius.circular(15), // Menambahkan radius pada ujung
                  ),
                ),
              ),
            ),
            Positioned(
              top: 342, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: -110, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Container(
                height: 400, // Sesuaikan dengan tinggi yang diinginkan
                width: 400, // Sesuaikan dengan lebar yang diinginkan
                child: Lottie.asset('assets/json/Anim.json'),
              ),
            ),
            Positioned(
              top: 186, // Sesuaikan dengan posisi vertikal yang diinginkan
              left: 38, // Sesuaikan dengan posisi horizontal yang diinginkan
              child: Text(
                "Jan   Feb   Mar   Apr   Mei   Jun   Jul",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ));
  }
}
