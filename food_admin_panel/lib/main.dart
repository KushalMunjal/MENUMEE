import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'package:flutter/services.dart';
import 'package:food_admin_panel/home_screen.dart';
import 'package:food_admin_panel/screens/Welcome/welcome_screen.dart';
import 'package:food_admin_panel/screens/constants.dart';
import 'package:food_admin_panel/screens/dashboard.dart';
import 'package:food_admin_panel/screens/home_page.dart';
import 'package:food_admin_panel/settings.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
             apiKey: "AIzaSyBnNcSNgf16VHYggIWgDm5aELLU7qRM5Cg",
      authDomain: "foodadminpanel-b15da.firebaseapp.com",
      databaseURL: "https://foodadminpanel-b15da-default-rtdb.firebaseio.com",
      projectId: "foodadminpanel-b15da",
      storageBucket: "foodadminpanel-b15da.appspot.com",
      messagingSenderId: "437513836307",
      appId: "1:437513836307:web:aae98982ef0a6437e6ece6",));
  } else {
    await Firebase.initializeApp();
  }
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home:  HomeScreen(),
    );
  }
}
