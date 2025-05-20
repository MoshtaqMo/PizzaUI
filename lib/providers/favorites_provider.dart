import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FavoritesProvider with ChangeNotifier {
  final Set<FoodItem> _favorites = {};

  Set<FoodItem> get favorites => _favorites;

  void toggleFavorite(FoodItem food) {
    if (_favorites.contains(food)) {
      _favorites.remove(food);
    } else {
      _favorites.add(food);
    }
    notifyListeners();
  }

  bool isFavorite(FoodItem food) => _favorites.contains(food);
} 