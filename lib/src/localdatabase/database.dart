import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutterroomdemo/src/localdatabase/dao/item_dao.dart';
import 'package:flutterroomdemo/src/localdatabase/dao/room_dao.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/item.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/room.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Room,Item])
abstract class AppDatabase extends FloorDatabase{
  RoomDao get roomDao;
  ItemDao get itemDao;
}