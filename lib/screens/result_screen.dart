import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/service/database.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';
import 'package:flutter_project2/widgets/plant_details_view.dart';

class ResultScreen extends StatefulWidget {
  final String? light;
  final String? water;
  final String? difficulty;
  const ResultScreen({super.key, this.difficulty, this.light, this.water});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),

      body: SafeArea(
        child: FutureBuilder(
          future: Database().getPlants(
            light: widget.light!,
            water: widget.water!,
            difficulty: widget.difficulty!,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: AppColors.greenColor,));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No plant found"));
            }

            final plant = snapshot.data!.first;

            return PlantDetailsView(plant: plant);
          },
        ),
      ),
    );
  }
}
