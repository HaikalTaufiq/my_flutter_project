import 'package:intl/intl.dart';

class AlarmInfo {
  int? id;
  String? title;
  DateTime? alarmDateTime;
  bool? isPending;
  int? amount;

  AlarmInfo({
    this.id,
    this.title,
    this.alarmDateTime,
    this.isPending,
    this.amount,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> map) {
    return AlarmInfo(
      id: map['id'],
      title: map['title'],
      alarmDateTime: DateTime.parse(map['alarmDateTime']),
      isPending: map['isPending'] == 1 ? true : false,
      amount: map['amount'],
    );
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
        "isPending": isPending,
        "amount": amount,
      };

  String getFormattedDate() {
    if (alarmDateTime == null) {
      return ""; // Handle null case gracefully
    }
    return DateFormat('yMMMMd')
        .format(alarmDateTime!); // Use a more user-friendly format
  }

  String getFormattedTime() {
    if (alarmDateTime == null) {
      return ""; // Handle null case gracefully
    }
    return DateFormat.Hm().format(alarmDateTime!); // Format for time only
  }
}
