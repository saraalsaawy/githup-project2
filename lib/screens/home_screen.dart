import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/extension/screen_size.dart';
import 'package:flutter_project2/screens/Products_screen.dart';
import 'package:flutter_project2/screens/plant_detail_screen.dart';
import 'package:flutter_project2/screens/quiz_screen.dart';
import 'package:flutter_project2/service/database.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';
import 'package:flutter_project2/widgets/plant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = context.screenWidth;
    var screenHeight = context.screenHeight;
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenHeight*0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/2eaa7eb7-0e31-4405-93f8-bfa578dacbf1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    context.push(QuizScreen());
                  },
                  child: Text(
                    'Start the Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              const Text(
                'Answer a few questions to find your perfect plant 🌿',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.greenColor),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    Recommended",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(ProductsScreen());
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              SizedBox(
                height: screenHeight*0.40,
                child: FutureBuilder(
                  future: Database().getAllPlants(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.greenColor,
                        ),
                      );
                    }
                    final plants = snapshot.data!.take(4).toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: plants.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: screenWidth*0.50,
                            child: PlantCard(
                              onTap: () {
                                context.push(
                                  PlantDetailScreen(plant: plants[index]),
                                );
                              },
                              plant: plants[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 130,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.brownColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(color: AppColors.greenColor, blurRadius: 1),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 6,),
                    Text(
                      "Need help choosing your plant?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Contact us we'll help you to find the perfect plant 🌿",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "leaflogic@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "+966 505 488 899",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
