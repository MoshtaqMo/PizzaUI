import 'package:flutter/material.dart';
import '../models/food_item.dart';

class CartProvider with ChangeNotifier {
  final Map<FoodItem, int> _items = {};

  Map<FoodItem, int> get items => _items;

  void addToCart(FoodItem food) {
    if (_items.containsKey(food)) {
      _items[food] = _items[food]! + 1;
    } else {
      _items[food] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(FoodItem food) {
    if (_items.containsKey(food)) {
      if (_items[food]! > 1) {
        _items[food] = _items[food]! - 1;
      } else {
        _items.remove(food);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice =>
      _items.entries.fold(0, (sum, e) => sum + e.key.price * e.value);

  int get itemCount => _items.values.fold(0, (sum, e) => sum + e);
} 