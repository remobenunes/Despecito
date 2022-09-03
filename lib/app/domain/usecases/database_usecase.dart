import 'package:despecito/app/domain/models/entities/expense/expense.dart';

abstract class DatabaseUsecase {
  create(Expense expense);
  delete(Expense expense);
  update(Expense expense);
  Future<List<Expense>> getAll();
}
