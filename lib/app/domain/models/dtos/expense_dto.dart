import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'dart:convert';

class ExpenseDto extends Expense {
  ExpenseDto({
    final double? value,
    final String? name,
    final String? category,
    final String? description,
  }) : super(
          category: category,
          description: description,
          name: name,
          value: value,
        );


  
  Expense copyWith({
    double? value,
    String? name,
    String? category,
    String? description,
  }) {
    return Expense(
      value: value ?? this.value,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'name': name,
      'category': category,
      'description': description,
    };
  }

  factory ExpenseDto.fromMap(Map<String, dynamic> map) {
    return ExpenseDto(
      value: map['value']?.toDouble(),
      name: map['name'],
      category: map['category'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseDto.fromJson(String source) =>
      ExpenseDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(value: $value, name: $name, category: $category, description: $description)';
  }
}
