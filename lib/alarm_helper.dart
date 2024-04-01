import 'package:flutter_application_1/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDateTime = 'alarmDateTime';
final String columnPending = 'isPending';
final String columnAmount = 'amount';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = join(dir, "alarm.db");

    var database = await openDatabase(
      path,
      version: 3,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
            $columnId integer primary key autoincrement, 
            $columnTitle text not null,
            $columnDateTime text not null,
            $columnPending integer
            $columnAmount integer  -- Added amount column
          )
       ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          try {
            db.execute('ALTER TABLE alarm ADD COLUMN amount INTEGER');
          } catch (error) {
            // Tangani kesalahan jika terjadi selama ALTER TABLE (opsional)
          }
        }
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, alarmInfo.toMap());
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }

  Future<int> delete(int? id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    return await db.update(
      tableAlarm,
      alarmInfo.toMap(),
      where: '$columnId = ?',
      whereArgs: [alarmInfo.id],
    );
  }
}
