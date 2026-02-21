import 'package:flutter_project2/models/plant_model.dart';

class CartModel {
  final PlantModel? plant;
  int? quantity;

  CartModel({required this.plant,this.quantity});
}