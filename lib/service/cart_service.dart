import 'package:flutter_project2/models/plant_model.dart';

class CartService {
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  final List<PlantModel> _items = [];

  List<PlantModel> get items => _items;

  void addToCart(PlantModel plant) {
    _items.add(plant);
  }

  void removeFromCart(PlantModel plant) {
    _items.remove(plant);
  }

  void clearCart() {
    _items.clear();
  }
}