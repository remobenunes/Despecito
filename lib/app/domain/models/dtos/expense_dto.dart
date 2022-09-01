import 'package:despecito/app/domain/models/entities/expense/expense.dart';

class ExpenseDto extends Expense {
  ExpenseDto({
    final double? value,
    final String? name,
    final String? category,
    final String? description,
    required final String? createdAt,
  }) : super(
          category: category,
          description: description,
          name: name,
          value: value,
          createdAt: createdAt,
        );

  @override
  String toString() {
    return 'ExpenseDto(value: $value, name: $name, category: $category, description: $description, createdAt: ${createdAt.toString()} )';
  }
}
