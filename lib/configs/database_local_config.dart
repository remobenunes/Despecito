import 'dart:io';

import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseLocalConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    
    Hive.registerAdapter(ExpenseAdapter());
  }

  openBoxes() async {
    await Hive.openBox<Expense>('expenses');
  }
}