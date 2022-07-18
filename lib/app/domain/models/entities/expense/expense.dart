import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense  extends HiveObject {
  @HiveField(0)
  final double? value;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final String? description;

  Expense({
    this.value,
    this.name,
    this.category,
    this.description,
  });

  //Daqui pra baixo foi gerado automaticamente pelo plugin: Data class generator

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

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      value: map['value']?.toDouble(),
      name: map['name'],
      category: map['category'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(value: $value, name: $name, category: $category, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.value == value &&
        other.name == name &&
        other.category == category &&
        other.description == description;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        name.hashCode ^
        category.hashCode ^
        description.hashCode;
  }
}
