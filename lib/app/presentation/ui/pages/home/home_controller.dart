import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/domain/usecases/database_usecase.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final DatabaseUsecase _databaseUsecase;
  bool loading = false;
  List<Expense> expenseList = [];
  var list$ = ValueNotifier<List<Expense>>([]);

  HomeController(this._databaseUsecase);

  void setLoading(bool value) {
    loading = value;
  }

  void create(Expense expense) async {
    await _databaseUsecase.create(expense);
    getAll();
  }

  void delete(Expense expense) async {
    await _databaseUsecase.delete(expense);
    getAll();
  }

  void getAll() async {
    list$.value = await _databaseUsecase.getAll();
    expenseList = list$.value;
  }
}
