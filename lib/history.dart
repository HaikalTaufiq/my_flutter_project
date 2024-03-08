// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
  DateTime? _alarmTime;
  late String _alarmTimeString;
  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;
  Timer? _timer;

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
    _alarms = _alarmHelper.getAlarms();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Schedule',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "poppins",
                fontSize: 35,
                fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Color(0xFF252525),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/42.png'),
            fit: BoxFit.contain, // Adjust as needed
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 54),
        child: Column(
          children: <Widget>[
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
                            margin: EdgeInsets.only(bottom: 32),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Color(0xFF25A1AE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.label,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          alarm.title!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "poppins",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Switch(
                                      onChanged: (bool value) {},
                                      value: true,
                                      activeColor: Colors.white,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Mon-Fri',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "poppins",
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      alarmTime,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "poppins",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.white,
                                        onPressed: () {
                                          deleteAlarm(alarm.id);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).followedBy([
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: MaterialButton(
                              onPressed: () {
                                _alarmTimeString =
                                    DateFormat('HH:mm').format(DateTime.now());
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
                                        padding: EdgeInsets.all(32),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    right: 40,
                                                    left: 40),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16), // Atur radius sesuai keinginan Anda
                                                ),
                                                backgroundColor: Color(
                                                    0xFF25A1AE), // Warna latar belakang button
                                              ),
                                              onPressed: () async {
                                                var selectedTime =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                  builder:
                                                      (BuildContext context,
                                                          Widget? child) {
                                                    return Theme(
                                                      data: ThemeData.dark()
                                                          .copyWith(
                                                        primaryColor: Color(
                                                                0xFF25A1AE)
                                                            .withOpacity(0.8),
                                                        hintColor:
                                                            Color(0xFF25A1AE),
                                                        textTheme: TextTheme(
                                                          headlineSmall:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      "poppins"),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                );
                                                if (selectedTime != null) {
                                                  final now = DateTime.now();
                                                  var selectedDateTime =
                                                      DateTime(
                                                          now.year,
                                                          now.month,
                                                          now.day,
                                                          selectedTime.hour,
                                                          selectedTime.minute);
                                                  _alarmTime = selectedDateTime;
                                                  setModalState(
                                                    () {
                                                      _alarmTimeString =
                                                          DateFormat('HH:mm')
                                                              .format(
                                                                  selectedDateTime);
                                                    },
                                                  );
                                                }
                                              },
                                              child: Text(
                                                _alarmTimeString,
                                                style: TextStyle(
                                                    fontSize: 42,
                                                    fontFamily: "poppins",
                                                    color: Colors.white),
                                              ),
                                            ),
                                            ListTile(
                                              title: Center(
                                                child: Text(
                                                  'Set Feed Schedule',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: "poppins"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 150,
                                            ),
                                            FloatingActionButton.extended(
                                              backgroundColor:
                                                  Color(0xFF25A1AE),
                                              onPressed: onSaveAlarm,
                                              icon: Icon(
                                                Icons.alarm,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                'Save',
                                                style: TextStyle(
                                                  fontFamily: "poppins",
                                                  color: Colors.white,
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
                        color: Colors.black,
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
    DateTime scheduleAlarmDateTime;
    if (_alarmTime!.isAfter(DateTime.now())) {
      scheduleAlarmDateTime = _alarmTime!;
    } else {
      scheduleAlarmDateTime = _alarmTime!.add(Duration(days: 1));
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      title: 'Alarm',
    );

    _alarmHelper.insertAlarm(alarmInfo);

    // Start a periodic timer to check if it's time to show the notification
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkAndShowNotification(alarmInfo);
    });

    Navigator.pop(context);
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
}
