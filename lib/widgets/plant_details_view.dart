import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/screen_size.dart';
import 'package:flutter_project2/models/plant_model.dart';
import 'package:flutter_project2/service/cart_service.dart';

class PlantDetailsView extends StatelessWidget {
  final PlantModel plant;
  const PlantDetailsView({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    var screenWidth = context.screenWidth;
    var screenHeight = context.screenHeight;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.network(
              plant.image!,
              height: screenHeight*0.65,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            plant.name!,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
            ),
          ),
          SizedBox(height: 12),
          Text(
            plant.description!,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
            "${plant.price} SAR",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
            ),
          ),
          SizedBox(height: 200),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                CartService().addToCart(plant);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Added to cart"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
