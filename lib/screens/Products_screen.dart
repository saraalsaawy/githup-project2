import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/screens/plant_detail_screen.dart';
import 'package:flutter_project2/service/database.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';
import 'package:flutter_project2/widgets/plant_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: Database().getAllPlants(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: AppColors.greenColor,));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No plant found"));
            }
            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return PlantCard(
                  onTap: () {
                    context.push(
                      PlantDetailScreen(plant: snapshot.data![index]),
                    );
                  },
                  plant: snapshot.data![index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
