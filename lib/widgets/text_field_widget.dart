import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.greenColor),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
        prefixIcon: IconTheme(
          data: IconThemeData(color: AppColors.greenColor),
          child: icon,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.greenColor),
      ),
    );
  }
}
