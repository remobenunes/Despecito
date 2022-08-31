import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/domain/usecases/database_usecase.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  final DatabaseUsecase _databaseUsecase;
  bool loading = false;
  List<Expense> expenseList = [];

  HomeController(this._databaseUsecase);

  void setLoading(bool value) {
    loading = value;
  }

  void create(Expense expense) async {
    await _databaseUsecase.create(expense);
    getAll();
    notifyListeners();
  }

  void delete(Expense expense) async {
    await _databaseUsecase.delete(expense);
    getAll();
    notifyListeners();
  }

  void getAll() async {
    expenseList = await _databaseUsecase.getAll();
    notifyListeners();
  }

}
