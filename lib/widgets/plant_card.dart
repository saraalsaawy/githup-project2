import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/extension/screen_size.dart';
import 'package:flutter_project2/models/plant_model.dart';
import 'package:flutter_project2/screens/plant_detail_screen.dart';
import 'package:flutter_project2/service/cart_service.dart';

class PlantCard extends StatelessWidget {
  final PlantModel plant;
  final VoidCallback? onTap;

  const PlantCard({super.key, required this.onTap, required this.plant});

  @override
  Widget build(BuildContext context) {
    var screenWidth = context.screenWidth;
    var screenHeight = context.screenHeight;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.brownColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: AppColors.greenColor, blurRadius: 2)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                plant.image!,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                plant.name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenColor,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${plant.price} SAR",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      CartService().addToCart(plant);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text("Added to cart"),
                        duration: Duration(seconds: 2),
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: AppColors.greenColor,
                      side: BorderSide(color: AppColors.greenColor, width: 4),
                    ),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
