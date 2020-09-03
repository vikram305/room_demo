// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RoomDao _roomDaoInstance;

  ItemDao _itemDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `rooms` (`roomId` TEXT, `roomName` TEXT, `surveyId` TEXT, PRIMARY KEY (`roomId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `items` (`cid` TEXT, `roomId` TEXT, `cFieldName` TEXT, `comments` TEXT, `cubicFeet` TEXT, `weight` TEXT, `groupNameId` TEXT, `density` TEXT, FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`cid`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RoomDao get roomDao {
    return _roomDaoInstance ??= _$RoomDao(database, changeListener);
  }

  @override
  ItemDao get itemDao {
    return _itemDaoInstance ??= _$ItemDao(database, changeListener);
  }
}

class _$RoomDao extends RoomDao {
  _$RoomDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _roomInsertionAdapter = InsertionAdapter(
            database,
            'rooms',
            (Room item) => <String, dynamic>{
                  'roomId': item.roomId,
                  'roomName': item.roomName,
                  'surveyId': item.surveyId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _roomsMapper = (Map<String, dynamic> row) => Room(
      roomId: row['roomId'] as String,
      roomName: row['roomName'] as String,
      surveyId: row['surveyId'] as String);

  final InsertionAdapter<Room> _roomInsertionAdapter;

  @override
  Future<List<Room>> getAllRooms() async {
    return _queryAdapter.queryList('SELECT * FROM rooms', mapper: _roomsMapper);
  }

  @override
  Future<List<Room>> findRoomBySearchQuery(String query) async {
    return _queryAdapter.queryList('SELECT * FROM rooms WHERE roomId = ?',
        arguments: <dynamic>[query], mapper: _roomsMapper);
  }

  @override
  Future<List<int>> insertRooms(List<Room> rooms) {
    return _roomInsertionAdapter.insertListAndReturnIds(
        rooms, OnConflictStrategy.abort);
  }
}

class _$ItemDao extends ItemDao {
  _$ItemDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _itemInsertionAdapter = InsertionAdapter(
            database,
            'items',
            (Item item) => <String, dynamic>{
                  'cid': item.cid,
                  'roomId': item.roomId,
                  'cFieldName': item.cFieldName,
                  'comments': item.comments,
                  'cubicFeet': item.cubicFeet,
                  'weight': item.weight,
                  'groupNameId': item.groupNameId,
                  'density': item.density
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _itemsMapper = (Map<String, dynamic> row) => Item(
      cid: row['cid'] as String,
      roomId: row['roomId'] as String,
      cFieldName: row['cFieldName'] as String,
      comments: row['comments'] as String,
      cubicFeet: row['cubicFeet'] as String,
      weight: row['weight'] as String,
      groupNameId: row['groupNameId'] as String,
      density: row['density'] as String);

  final InsertionAdapter<Item> _itemInsertionAdapter;

  @override
  Future<List<Item>> getAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM items', mapper: _itemsMapper);
  }

  @override
  Future<List<Item>> findItemByRoomId(String roomId) async {
    return _queryAdapter.queryList('SELECT * FROM items WHERE roomId = ?',
        arguments: <dynamic>[roomId], mapper: _itemsMapper);
  }

  @override
  Future<List<int>> insertItems(List<Item> items) {
    return _itemInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }
}
