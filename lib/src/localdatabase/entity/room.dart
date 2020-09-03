import 'package:floor/floor.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/item.dart';
import 'package:meta/meta.dart';

@Entity(tableName: 'rooms')
class Room{
  @PrimaryKey(autoGenerate: false)
  final String roomId;
  final String roomName;
  final String surveyId;

  @ignore
  final List<Item> items;

  Room({@required this.roomId,@required this.roomName,@required this.surveyId,@required this.items});
}