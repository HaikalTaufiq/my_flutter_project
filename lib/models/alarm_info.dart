class AlarmInfo {
  int? id;
  String? title;
  DateTime? alarmDateTime;
  bool? isPending;

  AlarmInfo({
    this.id,
    this.title,
    this.alarmDateTime,
    this.isPending,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> map) {
    return AlarmInfo(
      id: map['id'],
      title: map['title'],
      alarmDateTime: DateTime.parse(map['alarmDateTime']),
      isPending: map['isPending'] == 1 ? true : false,
    );
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
        "isPending": isPending,
      };
}
