import 'package:hive_flutter/hive_flutter.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  final double? value;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? createdAt;

  Expense({
    this.value,
    this.name,
    this.category,
    this.description,
    required this.createdAt,
  });

  DateTime get getDateTime {
    return DateTime.parse(createdAt!);
  }

  @override
  String toString() {
    return 'Expense(value: $value, name: $name, category: $category, description: $description, createdAt: ${createdAt.toString()})';
  }
}
