import 'package:flutter/foundation.dart';

@immutable
class FoodItem {
  final String name;
  final String image;
  final String description;
  final double price;

  const FoodItem({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
} 