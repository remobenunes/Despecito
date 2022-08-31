import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/domain/repositories/database_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'database_usecase.dart';

class DatabaseImpUsecase implements DatabaseUsecase {
  final DatabaseRepository _databaseRepository;
  final String _boxName = 'expenses';

  DatabaseImpUsecase(this._databaseRepository);

  @override
  create(Expense expense) async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);
      box.put(expense.createdAt.toString(), expense);

      // _databaseRepository.create();
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  @override
  delete(Expense expense) async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);
      box.delete(expense.createdAt);

      _databaseRepository.delete();
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  @override
  read() {
    _databaseRepository.read();
    throw UnimplementedError();
  }

  @override
  update() {
    _databaseRepository.update();
    throw UnimplementedError();
  }

  @override
  Future<List<Expense>> getAll() async {
    var box = await Hive.openBox<Expense>(_boxName);

    // box.values.toList().forEach(print);
    return box.values.toList();
  }
}
