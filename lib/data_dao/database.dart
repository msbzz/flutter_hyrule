// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/data_dao/entry_dao.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

 

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
   EntrytDao get entrytDaoDao;
}