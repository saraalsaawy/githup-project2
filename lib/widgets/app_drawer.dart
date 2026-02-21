import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/screens/Products_screen.dart';
import 'package:flutter_project2/screens/cart_screen.dart';
import 'package:flutter_project2/screens/home_screen.dart';
import 'package:flutter_project2/screens/login_screen.dart';
import 'package:flutter_project2/screens/quiz_screen.dart';
import 'package:flutter_project2/service/database.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = Database().getCurrentUserEmail() ?? "Guest";

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            color: AppColors.greenColor,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  userEmail,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text("Home"),
                  onTap: () {
                    context.push(HomeScreen());
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.quiz_outlined),
                  title: const Text("Quiz"),
                  onTap: () {
                    context.push(QuizScreen());
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.local_florist_outlined),
                  title: const Text("Products"),
                  onTap: () {
                    context.push(ProductsScreen());
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.shopping_cart_outlined),
                  title: const Text("Cart"),
                  onTap: () {
                    context.push(CartScreen());
                  },
                ),
              ],
            ),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.redColor),
            title: const Text("Logout", style: TextStyle(color: AppColors.redColor)),
            onTap: () async {
              await Database().signOut();

              context.pushAndClear(LoginScreen());
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
