import 'package:apartment_manager/models/transaction_history.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTransactionHistory {
  static final DatabaseTransactionHistory instance =
      DatabaseTransactionHistory._init();
  static Database? _database;

  DatabaseTransactionHistory._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('transactionsHistory.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 3, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'DOUBLE NOT NULL';
    const dateTimeType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableTransactionsHistory (
  ${TransactionHistoryFields.id} $idType,
  ${TransactionHistoryFields.date} $dateTimeType,
  ${TransactionHistoryFields.nameApartment} $textType,
  ${TransactionHistoryFields.amount} $doubleType,
  ${TransactionHistoryFields.type} $textType
)
''');
  }

  Future<TransactionHistory> addTransaction(
      TransactionHistory transactionHistory) async {
    final db = await instance.database;

    final id =
        await db.insert(tableTransactionsHistory, transactionHistory.toJson());
    return transactionHistory.copy(id: id);
  }

  Future<int> update(TransactionHistory transactionHistory) async {
    final db = await instance.database;

    return db.update(
      tableTransactionsHistory,
      transactionHistory.toJson(),
      where: '${TransactionHistoryFields.id} = ?',
      whereArgs: [transactionHistory.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableTransactionsHistory,
      where: '${TransactionHistoryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<TransactionHistory> readTransactionHistory(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableTransactionsHistory,
      columns: TransactionHistoryFields.values,
      where: '${TransactionHistoryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TransactionHistory.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TransactionHistory>> readAllTransactionHistorys() async {
    final db = await instance.database;

    final orderBy = '${TransactionHistoryFields.id} DESC';
    final result = await db.query(
      tableTransactionsHistory,
      orderBy: orderBy,
    );

    return result.map((json) => TransactionHistory.fromJson(json)).toList();
  }

  Future<int> getTransactionHistoryCount() async {
    final db = await instance.database;
    final result =
        await db.rawQuery('SELECT COUNT(*) FROM $tableTransactionsHistory');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> dropTable() async {
    final db = await instance.database;
    await db.execute('DROP TABLE IF EXISTS $tableTransactionsHistory');
  }
}
