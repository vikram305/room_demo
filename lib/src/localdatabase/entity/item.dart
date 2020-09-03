import 'package:floor/floor.dart';
import 'package:flutterroomdemo/src/localdatabase/entity/room.dart';
import 'package:meta/meta.dart';

@Entity(
  tableName: 'items',
  foreignKeys: [
    ForeignKey(
      childColumns: ['roomId'],
      parentColumns: ['roomId'],
      entity: Room
    )
  ]
)
class Item{
  @PrimaryKey(autoGenerate: false)
  final String cid;
  final String roomId;
  final String cFieldName;
  final String comments;
  final String cubicFeet;
  final String weight;
  final String groupNameId;
  final String density;

  Item({@required this.cid,@required this.roomId,@required this.cFieldName,@required this.comments,@required this.cubicFeet,
      @required this.weight,@required this.groupNameId,@required this.density
  });

}