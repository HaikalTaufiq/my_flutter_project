// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/service/timepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/service/notif_service.dart';
import 'package:flutter_application_1/alarm_helper.dart';
import 'package:flutter_application_1/models/alarm_info.dart';
import 'dart:async';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // ignore: unused_field
  DateTime? _alarmTime;
  AlarmHelper _alarmHelper = AlarmHelper();

  Future<List<AlarmInfo>>? _alarms;
  Timer? _timer;
  String _selectedTimeFormat = "AM";
  int _selectedMinute = 0;
  int _selectedHour = 0;
  int? amount;

  @override
  void initState() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database initialized');
      LoadAlarms();
    });
    super.initState();
  }

  void LoadAlarms() {
    if (mounted) {
      _alarms = _alarmHelper.getAlarms();
      setState(() {});
    }
  }

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          children: <Widget>[
            Transform.translate(
              offset: Offset(-60, 25),
              child: Column(
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
                    'your fish feeding.',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 0),
                  child: Stack(
                    children: [
                      Container(
                        height: 115,
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffEFEFEF).withOpacity(0.3),
                                width: 5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 28),
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
                              "Let's schedule your ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Fish Feeder',
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
                  top: -5,
                  right: 5,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/cat.png'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<AlarmInfo>>(
                  future: _alarms,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.map<Widget>((alarm) {
                          var alarmTime = DateFormat('hh:mm aa')
                              .format(alarm.alarmDateTime!);
                          return Container(
                            margin: EdgeInsets.only(bottom: 25),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            decoration: BoxDecoration(
                              color: Color(0xffEFEFEF).withOpacity(0.4),
                              border: Border.all(
                                  color: Color(0xffEFEFEF).withOpacity(0.3),
                                  width: 5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(9, 0),
                                      child: Row(
                                        children: [
                                          Transform.translate(
                                            offset: Offset(-2, 0),
                                            child: Icon(
                                              Icons.label,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            'Feed',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "poppins",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        onChanged: (bool value) {},
                                        value: true,
                                        activeColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Color(0xffF9F9F9),
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
                                              padding: EdgeInsets.all(0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ListTile(
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 3,
                                                            width: 40,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            30))),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            'Edit Time',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      33,
                                                                      33,
                                                                      33),
                                                              fontFamily:
                                                                  "poppins",
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Feeding Schedule',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        95,
                                                                        95,
                                                                        95),
                                                                fontFamily:
                                                                    "poppins",
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  NumberPickerWidget(
                                                    hour: _selectedHour,
                                                    minute: _selectedMinute,
                                                    timeFormat:
                                                        _selectedTimeFormat,
                                                    onHourChanged: (value) {
                                                      setModalState(() {
                                                        _selectedHour = value;
                                                      });
                                                    },
                                                    onMinuteChanged: (value) {
                                                      setModalState(() {
                                                        _selectedMinute = value;
                                                      });
                                                    },
                                                    onTimeFormatChanged:
                                                        (value) {
                                                      setModalState(() {
                                                        _selectedTimeFormat =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  FloatingActionButton.extended(
                                                    backgroundColor:
                                                        Color(0xFF25A1AE),
                                                    onPressed: () {
                                                      // Panggil fungsi untuk mengupdate alarm di sini
                                                      updateAlarm(alarm.id);
                                                      // Tutup bottom sheet setelah update
                                                    },
                                                    label: Text(
                                                      'Save',
                                                      style: TextStyle(
                                                        fontFamily: "poppins",
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Transform.translate(
                                    offset: Offset(0, -10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            alarmTime,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'poppins',
                                              fontSize: 34,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: IconButton(
                                              icon: Icon(Icons.delete),
                                              color: Colors.white,
                                              onPressed: () {
                                                deleteAlarm(alarm.id);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        }).followedBy([
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: MaterialButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Color(0xffF9F9F9),
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
                                        padding: EdgeInsets.all(0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ListTile(
                                              title: Center(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 4,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30))),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Set Time',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 33, 33, 33),
                                                        fontFamily: "poppins",
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Feeding Schedule',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 95, 95, 95),
                                                          fontFamily: "poppins",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            NumberPickerWidget(
                                              hour: _selectedHour,
                                              minute: _selectedMinute,
                                              timeFormat: _selectedTimeFormat,
                                              onHourChanged: (value) {
                                                setModalState(() {
                                                  _selectedHour = value;
                                                });
                                              },
                                              onMinuteChanged: (value) {
                                                setModalState(() {
                                                  _selectedMinute = value;
                                                });
                                              },
                                              onTimeFormatChanged: (value) {
                                                setModalState(() {
                                                  _selectedTimeFormat = value;
                                                });
                                              },
                                            ),
                                            FloatingActionButton.extended(
                                              backgroundColor: Color(0xFF25A1AE)
                                                  .withOpacity(0.7),
                                              onPressed: onSaveAlarm,
                                              label: Text(
                                                'Save',
                                                style: TextStyle(
                                                  fontFamily: "poppins",
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]).toList(),
                      );
                    }
                    return Center(
                        child: Text(
                      'Loading ...',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins",
                      ),
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void onSaveAlarm() async {
    // Membuat DateTime dari nilai NumberPickerWidget yang dipilih
    DateTime now = DateTime.now();
    DateTime scheduleAlarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedHour, // Menggunakan nilai _selectedHour dari NumberPickerWidget
      _selectedMinute, // Menggunakan nilai _selectedMinute dari NumberPickerWidget
    );

    // Memastikan waktu alarm diatur di masa depan
    if (scheduleAlarmDateTime.isBefore(now)) {
      scheduleAlarmDateTime = scheduleAlarmDateTime.add(Duration(days: 1));
    }

    // Membuat objek AlarmInfo
    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      title: 'alarm',
      amount: 10,
    );

    // Menyimpan alarm ke dalam database
    _alarmHelper.insertAlarm(alarmInfo);

    // Memulai timer periodik untuk memeriksa apakah sudah waktunya menampilkan notifikasi
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkAndShowNotification(alarmInfo);
    });

    // Menutup modal bottom sheet
    Navigator.pop(context);

    // Memuat ulang daftar alarm setelah menambahkan alarm baru
    LoadAlarms();
  }

  void checkAndShowNotification(AlarmInfo alarmInfo) {
    // Check if the current time matches the set alarm time
    DateTime now = DateTime.now();
    if (now.hour == alarmInfo.alarmDateTime!.hour &&
        now.minute == alarmInfo.alarmDateTime!.minute) {
      // Show the notification
      NotificationService.showNotif('Feeding Time!', 'The Fish has been fed');

      // Cancel the timer after showing the notification
      _timer?.cancel();
    }
  }

  void deleteAlarm(int? id) {
    _alarmHelper.delete(id);
    LoadAlarms();
  }

  void updateAlarm(int? id) async {
    // Membuat DateTime dari nilai NumberPickerWidget yang dipilih
    DateTime now = DateTime.now();
    DateTime scheduleAlarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedHour, // Menggunakan nilai _selectedHour dari NumberPickerWidget
      _selectedMinute, // Menggunakan nilai _selectedMinute dari NumberPickerWidget
    );

    if (id != null) {
      // Membuat objek AlarmInfo baru dengan data yang diperbarui
      var updatedAlarmInfo = AlarmInfo(
        id: id,
        alarmDateTime: scheduleAlarmDateTime,
        title: 'alarm', // Anda dapat menyesuaikan judul sesuai kebutuhan
        amount: 10,
      );

      // Memanggil metode updateAlarm dari AlarmHelper untuk mengupdate data di database
      await _alarmHelper.updateAlarm(updatedAlarmInfo);
    } else {
      // Jika id null, maka tidak ada alarm yang perlu diperbarui
      // Tambahkan logika penanganan kesalahan di sini jika diperlukan
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      title: 'alarm',
    );

    // Menyimpan alarm ke dalam database
    _alarmHelper.updateAlarm(alarmInfo);

    // Memulai timer periodik untuk memeriksa apakah sudah waktunya menampilkan notifikasi
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkAndShowNotification(alarmInfo);
    });

    // Menutup modal bottom sheet
    Navigator.pop(context);

    // Memuat ulang daftar alarm setelah menambahkan alarm baru
    LoadAlarms();
  }
}
