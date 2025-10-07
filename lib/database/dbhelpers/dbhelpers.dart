import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:version_3_22_8/core/domain/model/dash.dart';

class DBHelper {
  Database? _db;

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'dishesDb.db');

    var db = await openDatabase(dbPath, version: 1, onCreate: onCreate);
    return db;
  }

  void onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Dishes ( name TEXT, description TEXT, price DOUBLE)");
  }

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<int> createDish(Dish dish) async {
    var dbReady = await db;
    var sql =
        "INSERT INTO Dishes (name, description, price) VALUES ('${dish.name}', '${dish.description}', '${dish.price}')";

    return await dbReady!.rawInsert(sql);
  }

  Future<int> updateDish(Dish dish) async {
    var dbReady = await db;
    var sqlUpdate =
        "UPDATE Dishes SET description = '${dish.description}', price = '${dish.price}' WHERE name = '${dish.name}'";

    return await dbReady!.rawInsert(sqlUpdate);
  }

  Future<int> deleteDish(String name) async {
    var dbReady = await db;
    var sqlDelete = "DELETE FROM Dishes WHERE name = '$name'";

    return await dbReady!.rawInsert(sqlDelete);
  }

  Future<Dish> readData(String name) async {
    var dbReady = await db;
    var sqlRead = "SELECT * FROM Dishes WHERE name = '$name'";

    var read = await dbReady!.rawQuery(sqlRead);
    return Dish.fromMap(read[0]);
  }

  Future<List<Dish>> readAllDishes() async {
    var dbReady = await db;
    var sqlReadAll = "SELECT * FROM Dishes";

    List<Map> list = await dbReady!.rawQuery(sqlReadAll);
    List<Dish> dishes = [];

    for (int i = 0; i < list.length; i++) {
      dishes.add(Dish(
          name: list[i]['name'],
          description: list[i]['description'],
          price: list[i]['price']));
    }
    return dishes;
  }
}
