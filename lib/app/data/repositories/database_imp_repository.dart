import 'package:despecito/app/data/datasources/database_datasource.dart';
import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import '../../domain/repositories/database_repository.dart';

class DatabaseImpRepository implements DatabaseRepository {
  final DatabaseDatasource _databaseDatasource;

  DatabaseImpRepository(this._databaseDatasource);

  @override
  void create(Expense expense) async {
    await _databaseDatasource.create(expense);
  }

  @override
  void delete(Expense expense) async {
    await _databaseDatasource.delete(expense);
  }

  @override
  void update(Expense expense) async {
    await _databaseDatasource.update(expense);
  }
  
  @override
  Future<List<Expense>> getAll() async {
    return await _databaseDatasource.getAll();
  }
}
