import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/domain/repositories/database_repository.dart';
import 'database_usecase.dart';

class DatabaseImpUsecase implements DatabaseUsecase {
  final DatabaseRepository _databaseRepository;

  DatabaseImpUsecase(this._databaseRepository);

  @override
  create(Expense expense) async {
    _databaseRepository.create(expense);
  }

  @override
  delete(Expense expense) async {
    _databaseRepository.delete(expense);
  }

  @override
  update(Expense expense) async {
    _databaseRepository.update(expense);
  }

  @override
  Future<List<Expense>> getAll() async {
    return await _databaseRepository.getAll();
  }
}
