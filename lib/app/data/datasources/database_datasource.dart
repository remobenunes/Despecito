import 'package:despecito/app/domain/models/dtos/expense_dto.dart';

abstract class DatabaseDatasource {
  Future<ExpenseDto> create();
  Future<ExpenseDto> read();
  Future<ExpenseDto> delete();
  Future<ExpenseDto> update();
}
