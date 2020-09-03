import 'package:floor/floor.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/item.dart';

@dao
abstract class ItemDao{
  @Query('SELECT * FROM items')
  Future<List<Item>> getAllItems();

  @insert
  Future<List<int>> insertItems(List<Item> items);

  @Query('SELECT * FROM items WHERE roomId = :roomId')
  Future<List<Item>> findItemByRoomId(String roomId);

}