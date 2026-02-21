import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/screens/home_screen.dart';
import 'package:flutter_project2/screens/main_screen.dart';

class CostomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CostomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.greenColor,
      titleSpacing: 0,
      title: InkWell(
        onTap: () {
          context.pushAndClear(MainScreen());
        },
        child: Row(
          children: [
            const SizedBox(width: 12),
            Image.asset('assets/images/10254184-2a99-42f0-b183-0febb4f5e371.png', height: 43),
          ],
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }
}
