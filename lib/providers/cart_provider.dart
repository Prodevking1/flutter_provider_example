import 'dart:collection';

import 'package:cart_provider_exemple/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _items = [];
  final unitPrice = 50;

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // add item
  void addItem(int id, Item item) {
    _items.add(item);
    notifyListeners();
  }

  // clear _items
  void clearItem() {
    _items.clear();
    notifyListeners();
  }

  // quantity getter
  getQuantity(id) => _items[id].quantity;

  // quantity setter
  setQuantity(id, item) => _items[id] = item[id];

  // increase quantity
  void increaseQuantity(int id) {
    _items[id].quantity++;
    notifyListeners();
  }

  // increase quantity
  void decreaseQuantity(int id) {
    if (_items[id].quantity > 0) {
      _items[id].quantity--;
    }
    notifyListeners();
  }

  // remove item
  void removeItem(int id) {
    _items.removeAt(id);
    notifyListeners();
  }

  // total
  int get totalPrice {
    int total = 0;
    for (int i = 0; i < _items.length; i++) {
      total += _items[i].quantity * unitPrice;
    }
    return total;
  }
}
