import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/extension/screen_size.dart';
import 'package:flutter_project2/screens/home_screen.dart';
import 'package:flutter_project2/screens/main_screen.dart';
import 'package:flutter_project2/screens/sign_up_screen.dart';
import 'package:flutter_project2/service/database.dart';
import 'package:flutter_project2/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = context.screenWidth;
    var screenHeight = context.screenHeight;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(8),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    height: screenHeight * 0.25,
                    width: screenHeight * 0.25,
                  ),
                  Text(
                    "Welcome Back!\n",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFieldWidget(
                    hint: "Enter you email",
                    icon: Icon(Icons.email_outlined),
                    controller: emailController,
                  ),
                  SizedBox(height: 24),
                  TextFieldWidget(
                    hint: "Enter you password",
                    icon: Icon(Icons.lock),
                    controller: passwordController,
                  ),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await Database().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (context.mounted) {
                          context.push(MainScreen());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brownColor,
                      foregroundColor: AppColors.greenColor,
                      side: const BorderSide(
                        color: AppColors.greenColor,
                        width: 1.5,
                      ),
                      elevation: 3,
                      shadowColor: AppColors.greenColor,
                    ),
                    child: Text("Log In"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushAndClear(SignUpScreen());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.greenColor,
                    ),
                    child: Text("Don't have an account?Sign Up"),
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
