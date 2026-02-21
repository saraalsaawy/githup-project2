import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/extension/screen_size.dart';
import 'package:flutter_project2/screens/login_screen.dart';
import 'package:flutter_project2/service/database.dart';
import 'package:flutter_project2/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

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
                    "Create your Account\n",
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
                  SizedBox(height: 24),
                  TextFieldWidget(
                    hint: "Confirm you password",
                    icon: Icon(Icons.lock_outline),
                    controller: confirmPasswordController,
                  ),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () async {
                      if (passwordController.text != confirmPasswordController.text) {
                         ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Passwords don't match")));
                      }
                      try{
                      await Database().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                      }
                      catch(e){
                        print(e);
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
                    child: Text("Sign Up"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushAndClear(LoginScreen());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.greenColor,
                    ),
                    child: Text("Already have an account?Log In"),
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
