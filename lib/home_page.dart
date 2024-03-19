// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Transform.translate(
                    offset: Offset(0, -35),
                    child: Center(
                      child: Image.asset("assets/images/Ellipse.png"),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(15, 25),
                  child: Image.asset('assets/images/Logo.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Transform.translate(
                  offset: Offset(0, 70),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 185,
                          width: 325,
                          decoration: BoxDecoration(
                            color: Color(0xFF25A1AE),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        Transform.translate(
                          offset: Offset(120, -5),
                          child: Image.asset('assets/images/Man.png'),
                        ),
                        Stack(
                          children: [
                            Transform.translate(
                              offset: Offset(0, 113),
                              child: Image.asset('assets/images/Rec.png'),
                            ),
                            Transform.translate(
                              offset: Offset(15, 128),
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
                            Transform.translate(
                              offset: Offset(15, 148),
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
                            Transform.translate(
                              offset: Offset(264, 131),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    color: Color(0xFF25A1AE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(260, 127),
                              child: CircularPercentIndicator(
                                radius: 23,
                                lineWidth: 4,
                                percent: 0.67,
                                progressColor: Colors.white,
                                backgroundColor: Colors.black,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  '67%',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Transform.translate(
                offset: Offset(4, 10),
                child: Container(
                  height: 85,
                  width: 324,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF25A1AE),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(4, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Image.asset(
                          'assets/images/Group.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10), // Memberikan jarak dari kiri
                        child: Text(
                          "Statistics",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
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
                                                    horizontal: 10,
                                                    vertical: 10),
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
                                                    horizontal: 10,
                                                    vertical: 10),
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
                        },
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 95, top: 10),
                                child: Image.asset('assets/images/Panah.png')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Center(
                child: Container(
                  height: 200,
                  width: 328,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "Makanan Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Center(
                child: Container(
                  height: 200,
                  width: 328,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "Makanan Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Center(
                child: Container(
                  height: 200,
                  width: 328,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "Makanan Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
