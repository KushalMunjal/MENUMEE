import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/tablefinder/homescreen.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_service/onboarding/onboarding_screen.dart';


class MyAppScreen extends StatefulWidget {
  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), checkUserStatus);
  }
  Future<void> checkUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool new_user = prefs.getBool('new_user') ?? true;

    if (new_user == true) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBoardingView()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
@override
  Widget build(BuildContext context) {
    return Container(
      color: TColor.primary,
      padding: EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image
          Image.asset(
            'assets/images/splash_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // SVG in the center
          SvgPicture.asset(
            'assets/icons/hotel-bell-svgrepo-com.svg',
            height: 200,
            width: 100,
          ),
        ],
      ),
    );
  }
}