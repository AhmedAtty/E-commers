import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/cart_product.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  DBHelper.internal();

  static Database? _db;

  createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE products(id integer primary key autoincrement,name text,img text,price text,count integer )');
    });
    return _db;
  }

  Future<int> createPruduct(CartPruduct cartPruduct) async {
    Database db = await createDatabase();
    return db.insert('products', cartPruduct.toMap()).then((value) {
      print("the id inserted>>>>>>>>>>>>>>>>>>>>>>>>>> $value");
      return value;
    });
  }

  Future<List<Map<String, Object?>>> allPruducts() async {
    Database db = await createDatabase();
    return db.query("products");
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }



  void clear() async {
    Database db = await createDatabase();
    db.execute('delete from products');
  }

  Future<int> update(CartPruduct pruduct) async {
    Database db = await createDatabase();
    return db.update('products', pruduct.toMap(),
        where: 'id = ?', whereArgs: [pruduct.id]);
  }
}
