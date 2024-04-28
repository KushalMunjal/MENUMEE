import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_service/firebase_options.dart';
import 'package:get/get.dart';
import 'package:food_service/login/welcome_view.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MENUMEE',
      debugShowCheckedModeBanner: false,
      home: WelcomeView(),
    );
  }
}