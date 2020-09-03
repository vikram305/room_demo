import 'package:floor/floor.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/room.dart';

@dao
abstract class RoomDao{
  @Query('SELECT * FROM rooms')
  Future<List<Room>> getAllRooms();

  @insert
  Future<List<int>> insertRooms(List<Room> rooms);

  @Query('SELECT * FROM rooms WHERE roomId = :query')
  Future<List<Room>> findRoomBySearchQuery(String query);
}