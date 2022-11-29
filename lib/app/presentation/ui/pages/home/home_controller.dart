import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/domain/usecases/database_usecase.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final DatabaseUsecase _databaseUsecase;
  bool loading = false;

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

  void update(Expense expense) async {
    await _databaseUsecase.update(expense);
    getAll();
  }

  void getAll() async {
    final tempList = await _databaseUsecase.getAll();
    list$.value = tempList;
  }
}
