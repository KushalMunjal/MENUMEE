import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_service/more/more_view.dart';
import 'package:food_service/splash/app_startup.dart';
import 'package:food_service/home/homepage.dart';
import 'package:food_service/menu/menu_view.dart';
import 'package:food_service/onboarding/onboarding_screen.dart';
import 'package:food_service/tablefinder/homescreen.dart';
import 'package:food_service/tabview/main_tabview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle initialization errors gracefully, show a message, or take appropriate action
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MENUMEE',
      debugShowCheckedModeBanner: false,
      home: MyAppScreen(),
    );
  }
}