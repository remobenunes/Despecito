import 'dart:developer';

import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/datasources/database_datasource.dart';

class DatabaseImpDatasource implements DatabaseDatasource {
  final String _boxName = 'expenses';

  @override
  create(Expense expense) async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);
      box.put(expense.createdAt.toString(), expense);
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  @override
  delete(Expense expense) async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);
      box.delete(expense.createdAt);
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  @override
  update(Expense expense) async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);
      box.put(expense.createdAt, expense);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Expense>> getAll() async {
    try {
      var box = await Hive.openBox<Expense>(_boxName);

      return box.values.toList();
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
