import 'package:despecito/app/domain/models/dtos/expense_dto.dart';

abstract class DatabaseRepository {
  Future<ExpenseDto> create();
  Future<ExpenseDto> read();
  Future<ExpenseDto> delete();
  Future<ExpenseDto> update();
}
