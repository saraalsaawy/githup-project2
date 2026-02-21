import 'package:flutter/material.dart';
import 'package:flutter_project2/models/plant_model.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';
import 'package:flutter_project2/widgets/plant_details_view.dart';

class PlantDetailScreen extends StatelessWidget {
  final PlantModel plant;
  const PlantDetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),
      body: PlantDetailsView(plant: plant),
    );
  }
}