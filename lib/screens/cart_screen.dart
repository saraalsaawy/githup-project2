import 'package:flutter/material.dart';
import 'package:flutter_project2/models/plant_model.dart';
import 'package:flutter_project2/service/cart_service.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final List<PlantModel> items = CartService().items;
    if (items.isEmpty) {
      return Scaffold(
        appBar: const CostomAppBar(),
        endDrawer: const AppDrawer(),
        body: Center(child: Text("Your cart is empty 🌿")),
      );
    }
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final plant = items[index];

          return ListTile(
            leading: Image.network(
              plant.image ?? "",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(plant.name ?? ""),
            subtitle: Text("${plant.price} SAR"),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  CartService().removeFromCart(plant);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
