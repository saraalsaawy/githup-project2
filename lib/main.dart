import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/Products_screen.dart';
import 'package:flutter_project2/screens/home_screen.dart';
import 'package:flutter_project2/screens/login_screen.dart';
import 'package:flutter_project2/screens/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:"https://npgwadbetmrjdsobouva.supabase.co",
    anonKey:"sb_publishable_TvNLwVosvAztDmbIjwkQvQ_1OaelokU",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}
