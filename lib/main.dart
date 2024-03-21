import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_service/firebase_options.dart';
import 'package:food_service/login/mobile_signin.dart';
import 'package:food_service/login/welcome_view.dart';
import 'package:food_service/outlet/outlet_view.dart';

import 'outlet/map_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
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
      home:GettingMobileNoView(),
    );
  }
}