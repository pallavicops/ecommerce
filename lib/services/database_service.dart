import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

const String fileName = "database.db";

class DatabaseService {
  DatabaseService._init();

  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initializeDB(fileName);
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      category TEXT,
      price REAL,
      discountPercentage REAL,
      rating REAL,
      stock INTEGER,
      brand TEXT,
      image TEXT,
      thumbnail TEXT
      isFavourite INTEGER


    )
    ''');
  }

  Future<Database> _initializeDB(String fileName) async {
    String dbpath = await getDatabasesPath();
    final path = join(dbpath, fileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    final db = await database;
    await db.insert('products', product.toJson());
  }

  Future<List<ProductModel>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<void> deleteAllProducts() async {
    final db = await database;
    await db.delete(
      'products',
    );
  }
}
