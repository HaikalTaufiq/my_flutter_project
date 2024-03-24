import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NumberPickerWidget(
        hour: hour,
        minute: minute,
        timeFormat: timeFormat,
        onHourChanged: (value) {
          setState(() {
            hour = value;
          });
        },
        onMinuteChanged: (value) {
          setState(() {
            minute = value;
          });
        },
        onTimeFormatChanged: (value) {
          setState(() {
            timeFormat = value;
          });
        },
      ),
    );
  }
}

class NumberPickerWidget extends StatelessWidget {
  final int hour;
  final int minute;
  final String timeFormat;
  final ValueChanged<int> onHourChanged;
  final ValueChanged<int> onMinuteChanged;
  final ValueChanged<String> onTimeFormatChanged;

  const NumberPickerWidget({
    required this.hour,
    required this.minute,
    required this.timeFormat,
    required this.onHourChanged,
    required this.onMinuteChanged,
    required this.onTimeFormatChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 0),
            decoration: BoxDecoration(
              color: Color(0xFF252525),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberPicker(
                  minValue: 0,
                  maxValue: 12,
                  value: hour,
                  zeroPad: true,
                  infiniteLoop: true,
                  itemWidth: 80,
                  itemHeight: 60,
                  onChanged: onHourChanged,
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "poppins",
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      bottom: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                NumberPicker(
                  minValue: 0,
                  maxValue: 59,
                  value: minute,
                  zeroPad: true,
                  infiniteLoop: true,
                  itemWidth: 80,
                  itemHeight: 60,
                  onChanged: onMinuteChanged,
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontFamily: "poppins",
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "poppins",
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      bottom: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
